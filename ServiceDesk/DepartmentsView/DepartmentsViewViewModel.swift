//
//  DepartmentsViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/22/24.
//

import Foundation

final class DepartmentsViewViewModel: ObservableObject {
    @Published var departments: [DepartmentTask] = []
    @Published var isRefreshing = false
    @Published var isLoading = true
    
    private let networkManager = NetworkManager.shared
    
    func fetchDepartments() {
        networkManager.fetchTasks(from: Link.tasks.url) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let departments):
                self.departments = departments
                isLoading = false
            case .failure(let error):
                print(error)
            }
        }
    }
}
