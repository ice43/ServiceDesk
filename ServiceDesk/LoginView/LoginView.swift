//
//  LoginView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/8/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        NavigationStack {
            Spacer()
            
            VStack {
                LogoView()
                
                LoginInputViews(
                    email: $loginViewVM.email,
                    password: $loginViewVM.password
                )
                .padding()
                
                BlueButtonView(title: "Sign in") {
                    loginViewVM.signIn()
                }
                .padding(.top, 20)
                .disabled(!loginViewVM.formIsValid)
                .opacity(loginViewVM.formIsValid ? 1 : 0.5)
                .alert(loginViewVM.alertMessage, isPresented: $loginViewVM.showAlert, actions: {} )
                
                Spacer()
                            
                SignUpButtonView()
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
