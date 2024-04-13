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
                
//                Image(systemName: contact.avatar)
//                    .resizable()
//                    .frame(width: 150, height: 150)
                
                Spacer()
            }
            
//            Label(contact.fullName, systemImage: "person")
//            Label(contact.phone, systemImage: "phone")
//            Label(contact.email, systemImage: "tray")
//            Label(contact.position, systemImage: "star")
        }
//        .navigationTitle(contact.fullName)
    }
}

//#Preview {
//    ContactDetailsView(contact: Person.getContacts().first!)
//}
