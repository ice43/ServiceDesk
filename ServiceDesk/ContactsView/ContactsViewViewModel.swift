//
//  ContactsViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import Foundation

final class ContactsViewViewModel: ObservableObject {
    @Published var departments: [DepartmentContact] = []
    @Published var searchText = ""
    @Published var isLoading = true
    
    var filteredDepartments: [DepartmentContact] {
        guard !searchText.isEmpty else { return departments }
        
        return departments.compactMap { department in
            let filteredContacts = department.members.filter { contact in
                contact.name.localizedCaseInsensitiveContains(searchText) ||
                contact.post.localizedCaseInsensitiveContains(searchText) ||
                contact.phone.localizedCaseInsensitiveContains(searchText) ||
                contact.email.localizedCaseInsensitiveContains(searchText)
            }
            
            guard !filteredContacts.isEmpty else { return nil }
            
            return DepartmentContact(
                id: department.id,
                name: department.name,
                members: filteredContacts
            )
        }
    }

    private let networkManager = NetworkManager.shared
    
    func fetchContacts() {
        networkManager.fetchContacts(from: Link.contacts.url) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let departments):
                self.departments = departments
                isLoading = false
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
