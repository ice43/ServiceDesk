//
//  LoginViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
final class LoginViewViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var email: String = ""
    @Published var password: String = ""
    
    init() {
        userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            await fetchUser()
        } catch {
            print("Failed to log in with error: \(error)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String, department: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            
            let user = User(
                id: result.user.uid,
                fullName: fullName,
                email: email,
                department: department
            )
            
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print(error)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSession = nil
            currentUser = nil
        } catch {
            print("Failed to sign out with error: \(error)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
    }
}
