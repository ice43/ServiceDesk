//
//  LoginView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/8/24.
//

import SwiftUI

struct LoginView: View {
    @State var login: String = ""
    @State var pass: String = ""
    
    var body: some View {
        Spacer()
        
        Image("logo")
            .resizable()
            .frame(width: 200, height: 200)
        
        Spacer()
        
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 35) {
                Text("Username")
                Text("Password")
            }
            .padding(.leading, 30)
            
            VStack(alignment: .leading, spacing: 20) {
                TextField("Required", text: $login)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Required", text: $pass)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.trailing, 30)
        }
        
        Button(action: {} ) {
            Text("Log in")
                .foregroundStyle(.white)
        }
        .frame(width: 120, height: 45)
        .background(.ascp)
        .clipShape(.capsule)
        .padding(.top, 20)
        
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
}


#Preview {
    LoginView()
}
