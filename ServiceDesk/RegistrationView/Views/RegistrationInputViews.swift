//
//  RegistrationInputViews.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct RegistrationInputViews: View {
    @ObservedObject var registrationViewVM: RegistrationViewViewModel
    
    var body: some View {
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
            
            ListDepartments(
                registrationViewVM: registrationViewVM
            )
            
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
    }
}

#Preview {
    RegistrationInputViews(
        registrationViewVM: RegistrationViewViewModel()
    )
}
