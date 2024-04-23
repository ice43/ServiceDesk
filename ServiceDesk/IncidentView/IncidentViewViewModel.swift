//
//  IncidentViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/22/24.
//

import Foundation

final class IncidentViewViewModel: ObservableObject {
    @Published var categories: [String] = []
    @Published var selectedCategories = ""
    @Published var textPriority = ""
    @Published var textCategory = ""
    @Published var textDetail = ""
    @Published var textDescription = ""
    
    private let networkManager = NetworkManager.shared
    private var selectedDepartment: DepartmentTask?
    
    func fetchInfoForCreateTasks(for departmentName: String) {
        networkManager.fetchTasks(from: Link.tasks.url) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let infoCreateTasks):
                selectedDepartment = infoCreateTasks.first { $0.name == departmentName }
                
                guard let selectedDepartment = selectedDepartment else {
                    return
                }
                
                categories = selectedDepartment.infoCreateTask.map { $0.nameCategory }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDetailsForCategory(_ category: String) -> [String] {
        guard let selectedDepartment = self.selectedDepartment else {
            return []
        }
        
        if let selectedCategory = selectedDepartment.infoCreateTask.first(where: { $0.nameCategory == category }) {
            return selectedCategory.details
        }
        
        return []
    }
}
