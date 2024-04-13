//
//  User.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation

struct User: Codable {
    var name = "name"
    var pass = "pass"
    
    var isLogged = false
}

struct Person: Identifiable {
    let id: Int
    let name: String
    let surname: String
    let phone: String
    let email: String
    let avatar: String
    let position: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getContacts() -> [Person] {
        var persons: [Person] = []
        let dataStore = DataStore.shared
        
        for index in 0..<dataStore.names.count {
            let person = Person(
                id: index + 1,
                name: dataStore.names[index],
                surname: dataStore.surnames[index],
                phone: dataStore.phones[index],
                email: dataStore.emails[index],
                avatar: "person.fill",
                position: dataStore.positions[index]
            )
            
            persons.append(person)
        }
        
        return persons
    }
}
