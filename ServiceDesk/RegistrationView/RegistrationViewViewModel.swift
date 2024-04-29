//
//  RegistrationViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/29/24.
//

import Foundation

final class RegistrationViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var fullName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var textDepartment = ""
    
    @Published var departments: [DepartmentTask] = []
    
    private let networkManager = NetworkManager.shared
    
    func fetchDepartments() {
        networkManager.fetchTasks(from: Link.tasks.url) { result in
            switch result {
            case .success(let departments):
                self.departments = departments
            case .failure(let error):
                print(error)
            }
        }
    }
}
