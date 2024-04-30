//
//  ContactList.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct ContactList: View {
    @ObservedObject var contactsViewVM: ContactsViewViewModel
    
    var body: some View {
        List(contactsViewVM.filteredDepartments, id: \.id) { department in
            Section {
                ForEach(department.members, id: \.name) { contact in
                    NavigationLink(destination: ContactDetailsView(contact: contact)) {
                        ContactCellView(contact: contact)
                    }
                }
            } header: {
                Text(department.name)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ContactList(
        contactsViewVM: ContactsViewViewModel()
    )
}
