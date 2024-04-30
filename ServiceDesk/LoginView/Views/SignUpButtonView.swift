//
//  SignUpButtonView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct SignUpButtonView: View {
    var body: some View {
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
            .foregroundStyle(.ascp)
        }
    }
}

#Preview {
    SignUpButtonView()
}
