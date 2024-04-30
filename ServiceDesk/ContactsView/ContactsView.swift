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
            if contactsViewVM.isLoading {
                ProgressView()
            } else {
                ContactList(contactsViewVM: contactsViewVM)
                .navigationTitle("Contacts")
                .searchable(text: $contactsViewVM.searchText, prompt: "Look for a person")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "gearshape")
                        }
                    }
                }
            }
        }
        .onAppear {
            contactsViewVM.fetchContacts()
        }
        .refreshable {
            contactsViewVM.fetchContacts()
        }
    }
}

#Preview {
    ContactsView()
}
