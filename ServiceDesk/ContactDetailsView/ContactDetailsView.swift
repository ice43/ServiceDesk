//
//  ContactDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct ContactDetailsView: View {
    let contact: Contact
    
    var body: some View {
        List {
            HStack {
                Spacer()
                
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Spacer()
            }
            
            Label(contact.name, systemImage: "person")
            Label(contact.post, systemImage: "star")
            Label(contact.phone, systemImage: "phone")
            Label(contact.email, systemImage: "tray")
        }
        .navigationTitle(contact.name)
        .tint(.ascp)
    }
}

#Preview {
    ContactDetailsView(contact: Contact.getContact())
}
