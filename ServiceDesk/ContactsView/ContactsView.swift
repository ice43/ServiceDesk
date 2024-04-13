//
//  ContactsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct ContactsView: View {
    @State private var departments: [Department] = []
    private let networkManager = NetworkManager.shared
    
    var body: some View {
        NavigationStack {
            List(departments, id: \.id) { department in
                Section {
                    ForEach(department.members, id: \.name) { contact in
                        NavigationLink(destination: ContactDetailsView(contact: contact)) {
                            ContactCellView(contact: contact)
                        }
                    }
                } header: {
                    Text(department.name)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 10)
                }
                
            }
            .navigationTitle("Contacts")
        }
        .onAppear {
            networkManager.fetchContacts(from: Link.contacts.url) { result in
                switch result {
                case .success(let departments):
                    self.departments = departments
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContactsView()
}
