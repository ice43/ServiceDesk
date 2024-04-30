//
//  SignInButtonView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct SignInButtonView: View {
    let dismiss: () -> Void
    
    var body: some View {
        Button(action: dismiss) {
            HStack(spacing: 3) {
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
            .foregroundStyle(.ascp)
        }
    }
}

#Preview {
    SignInButtonView(dismiss: {} )
}
