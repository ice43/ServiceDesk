//
//  ProfileView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/29/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        if let user = loginViewVM.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(.gray)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.email)
                                .font(.footnote)
                                .tint(.ascp)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(
                            imageName: "gear",
                            title: "Version",
                            tintColor: .gray
                        )
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    SettingsRowView(
                        imageName: "person.text.rectangle",
                        title: user.department,
                        tintColor: .gray
                    )
                }
                
                Section("Account") {
                    Button {
                        loginViewVM.signOut()
                    } label: {
                        SettingsRowView(
                            imageName: "arrow.left.circle.fill",
                            title: "Sign out",
                            tintColor: .yellow
                        )
                    }
                    
                    Button {
                        loginViewVM.delete()
                    } label: {
                        SettingsRowView(
                            imageName: "xmark.circle.fill",
                            title: "Delete account",
                            tintColor: .red
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(LoginViewViewModel())
}
