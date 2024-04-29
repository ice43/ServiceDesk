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
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                VStack(spacing: 24) {
                    InputView(
                        text: $loginViewVM.email,
                        title: "Email address",
                        placeholder: "name@example.com"
                    )
                    .textInputAutocapitalization(.never)
                    
                    InputView(
                        text: $loginViewVM.password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true
                    )
                }
                .padding()
                
                Button {
                    Task {
                        try await loginViewVM.signIn(
                            withEmail: loginViewVM.email,
                            password: loginViewVM.password
                        )
                    }
                } label: {
                    Text("Sign in")
                        .foregroundStyle(.white)
                }
                .frame(width: 120, height: 45)
                .background(.ascp)
                .clipShape(.capsule)
                .padding(.top, 20)
                
                Spacer()
                            
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}


#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
