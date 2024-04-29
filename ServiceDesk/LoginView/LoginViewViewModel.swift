//
//  LoginViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
final class LoginViewViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEmailTaken = false
    @Published var showAlert = false
    @Published var alertMessage = ""

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
            
            self.email = ""
            self.password = ""
        } catch {
            showAlert.toggle()
            alertMessage = error.localizedDescription
        }
    }
    
    func signIn() {
        Task {
            try await signIn(withEmail: email, password: password)
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
            isEmailTaken.toggle()
            alertMessage = error.localizedDescription
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
    
    func deleteAccount() async throws {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        do {
            try await Firestore.firestore().collection("users").document(currentUser.uid).delete()
            try await currentUser.delete()
            signOut()
        } catch {
            print("Failed to delete current user with error: \(error)")
        }
    }
    
    func delete() {
        Task {
            try await deleteAccount()
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
    }
}

// MARK: - AuthenticationFormProtocol
extension LoginViewViewModel: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
