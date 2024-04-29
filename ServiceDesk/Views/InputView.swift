//
//  InputView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/29/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    var showCheckmark = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                if showCheckmark {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.small)
                        .foregroundStyle(.green)
                }
            }
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email address", placeholder: "name@example.com")
}
