//
//  RegistrationView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/29/24.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @StateObject private var registrationViewVM = RegistrationViewViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView()
                
                RegistrationInputViews(registrationViewVM: registrationViewVM)
                
                BlueButtonView(title: "Sign up") {
                    createUser()
                }
                .alert(loginViewVM.alertMessage, isPresented: $loginViewVM.isEmailTaken, actions: {} )
                .padding(.top, 10)
                .disabled(!registrationViewVM.formIsValid)
                .opacity(registrationViewVM.formIsValid ? 1 : 0.5)
                
                Spacer()
                
                SignInButtonView(dismiss: dismiss.callAsFunction)
                    .padding(.top, 20)
            }
            .padding()
            .onAppear {
                registrationViewVM.fetchDepartments()
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
    
    private func createUser() {
        Task {
            try await loginViewVM.createUser(
                withEmail: registrationViewVM.email,
                password: registrationViewVM.password,
                fullName: registrationViewVM.fullName,
                department: registrationViewVM.textDepartment
            )
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(LoginViewViewModel())
}
