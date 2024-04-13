//
//  Contact.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/12/24.
//

import Foundation

struct Company: Decodable {
    let unionSeaCompanyDepartments: [Department]
    
    private enum CodingKeys: String, CodingKey {
        case unionSeaCompanyDepartments = "union_sea_company_departments"
    }
}

struct Department: Decodable {
    let id: Int
    let name: String
    let members: [Contact]
}

struct Contact: Decodable {
    let name: String
    let post: String
    let phone: String
    let email: String
    
    static func getContact() -> Contact {
        Contact(
            name: "Max Payne",
            post: "Detective",
            phone: "(324) 764-7634",
            email: "max.payne@remedy.com"
        )
    }
}

