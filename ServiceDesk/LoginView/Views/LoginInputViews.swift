//
//  LoginInputViews.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct LoginInputViews: View {
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack(spacing: 24) {
            InputView(
                text: $email,
                title: "Email address",
                placeholder: "name@example.com"
            )
            .textInputAutocapitalization(.never)
            
            InputView(
                text: $password,
                title: "Password",
                placeholder: "Enter your password",
                isSecureField: true
            )
        }
    }
}

#Preview {
    LoginInputViews(
        email: .constant("name@example.com"),
        password: .constant("123456")
    )
}
