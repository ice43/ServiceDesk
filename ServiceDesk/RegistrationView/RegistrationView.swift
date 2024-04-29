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
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            VStack(spacing: 24) {
                InputView(
                    text: $registrationViewVM.email,
                    title: "Email address",
                    placeholder: "name@example.com"
                )
                .textInputAutocapitalization(.never)
                
                InputView(
                    text: $registrationViewVM.fullName,
                    title: "Full name",
                    placeholder: "Enter your name"
                )
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Department")
                        .foregroundStyle(.gray)
                        .fontWeight(.semibold)
                        .font(.footnote)
                    
                    Menu {
                        ForEach(registrationViewVM.departments, id: \.name) { department in
                            Button(action: { registrationViewVM.textDepartment = department.name }) {
                                Text(department.name)
                            }
                        }
                    } label: {
                        TextField("Select the department", text: $registrationViewVM.textDepartment)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                    }
                    
                    Divider()
                }
                
                InputView(
                    text: $registrationViewVM.password,
                    title: "Password",
                    placeholder: "Must be at least 6 characters long",
                    isSecureField: true
                )
                
                InputView(
                    text: $registrationViewVM.confirmPassword,
                    title: "Confirm password",
                    placeholder: "Confirm your password",
                    isSecureField: true,
                    showCheckmark: registrationViewVM.isValidPass
                )
            }
            .padding()
            
            Button {
                Task {
                    try await loginViewVM.createUser(
                        withEmail: registrationViewVM.email,
                        password: registrationViewVM.password,
                        fullName: registrationViewVM.fullName,
                        department: registrationViewVM.textDepartment
                    )
                }
            } label: {
                Text("Sign up")
                    .foregroundStyle(.white)
            }
            .frame(width: 120, height: 45)
            .background(.ascp)
            .clipShape(.capsule)
            .padding(.top, 20)
            .alert(loginViewVM.alertMessage, isPresented: $loginViewVM.isEmailTaken, actions: {} )
            .disabled(!registrationViewVM.formIsValid)
            .opacity(registrationViewVM.formIsValid ? 1 : 0.5)
            
            Spacer()
            
            Button(action: dismiss.callAsFunction) {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
                .foregroundStyle(.ascp)
            }
            .onAppear {
                registrationViewVM.fetchDepartments()
            }
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(LoginViewViewModel())
}
