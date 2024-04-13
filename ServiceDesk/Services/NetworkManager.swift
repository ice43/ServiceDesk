//
//  NetworkManager.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/12/24.
//

import Foundation
import Alamofire

enum Link {
    case contacts
    
    var url: String {
        switch self {
        case .contacts:
            return "https://ice43.github.io/ServiceDesk_data/service_desk_usc_contacts.json"
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchContacts(from url: String, completion: @escaping (Result<[Department], AFError>) -> ()) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Company.self) { response in
                switch response.result {
                case .success(let data):
                    let departments = data.unionSeaCompanyDepartments
                    completion(.success(departments))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

