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
    
    var isValidPass: Bool {
        return password.count > 5
        && password == confirmPassword
        && !password.isEmpty
        && !confirmPassword.isEmpty
    }
    
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

// MARK: - AuthenticationFormProtocol
extension RegistrationViewViewModel: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !fullName.isEmpty
        && !textDepartment.isEmpty
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
    }
}
