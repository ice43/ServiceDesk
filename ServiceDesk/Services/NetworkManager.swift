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
    case tasks
    
    var url: String {
        switch self {
        case .contacts:
            return "https://ice43.github.io/ServiceDesk_data/service_desk_usc_contacts.json"
        case .tasks:
            return "https://ice43.github.io/ServiceDesk_data/service_desk_usc_tasks.json"
        }
    }
}


final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchContacts(from url: String, completion: @escaping (Result<[DepartmentContact], AFError>) -> ()) {
        AF.request(url)
            .validate()
            .responseDecodable(of: CompanyContact.self) { response in
                switch response.result {
                case .success(let data):
                    let departments = data.unionSeaCompanyDepartments
                    completion(.success(departments))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func fetchTasks(from url: String, completion: @escaping (Result<[DepartmentTask], AFError>) -> ()) {
        AF.request(url)
            .validate()
            .responseDecodable(of: CompanyTasks.self) { response in
                switch response.result {
                case .success(let data):
                    let departments = data.departments
                    completion(.success(departments))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

