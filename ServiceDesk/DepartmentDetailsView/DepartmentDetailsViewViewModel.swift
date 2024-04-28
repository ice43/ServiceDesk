//
//  DepartmentDetailsViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/25/24.
//

import Foundation

final class DepartmentDetailsViewViewModel: ObservableObject {
    @Published var awaitingApproval: [CurrentTask] = []
    
    @Published var openTasks: [CurrentTask] = []
    @Published var closedTasks: [CurrentTask] = []
    @Published var refusalTasks: [CurrentTask] = []
    
    @Published var isShowingCreateAnIncident = false
    @Published var isExpandedTasks = false
    
    private let networkManager = NetworkManager.shared
    
    private var selectedDepartment: DepartmentTask?
    
    func fetchTasks(for departmentName: String) {
        networkManager.fetchTasks(from: Link.tasks.url) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let department):
                selectedDepartment = department.first { $0.name == departmentName }
                
                guard let selectedDepartment = selectedDepartment else {
                    return
                }
                
                awaitingApproval = selectedDepartment.tasks.awaitingApproval!
                
                openTasks = selectedDepartment.tasks.currentTasks.open
                closedTasks = selectedDepartment.tasks.currentTasks.closed
                refusalTasks = selectedDepartment.tasks.currentTasks.motivatedRefusals
            case .failure(let error):
                print(error)
            }
        }
    }
}
