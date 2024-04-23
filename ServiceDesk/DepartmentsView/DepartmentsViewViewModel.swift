//
//  DepartmentsViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/22/24.
//

import Foundation

final class DepartmentsViewViewModel: ObservableObject {
    @Published var departments: [DepartmentTask] = []
    
    private let networkManager = NetworkManager.shared
    
    func fetchDepartments() {
        networkManager.fetchTasks(from: Link.tasks.url) { result in
            switch result {
            case .success(let departments):
                self.departments = departments
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
