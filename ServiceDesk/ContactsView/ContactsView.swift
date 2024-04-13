//
//  ContactsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct ContactsView: View {
    @StateObject private var contactsViewVM = ContactsViewViewModel()
    
    var body: some View {
        NavigationStack {
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
            .navigationTitle("Contacts")
            .searchable(text: $contactsViewVM.searchText, prompt: "Look for a person")
        }
        .onAppear {
            contactsViewVM.fetchContacts()
        }
    }
}

#Preview {
    ContactsView()
}
