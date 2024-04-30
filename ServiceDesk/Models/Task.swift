//
//  Task.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/22/24.
//

import Foundation


struct CompanyTasks: Decodable {
    let departments: [DepartmentTask]
}

struct DepartmentTask: Decodable {
    let name: String
    let infoCreateTask: [InfoCreateTask]
    let tasks: Tasks
    
    static func getDepartment() -> DepartmentTask {
        DepartmentTask(
            name: "Information Technology Department",
            infoCreateTask: [InfoCreateTask.getInfoCreateTask()],
            tasks: Tasks.getTasks()
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, tasks
        case infoCreateTask = "info_create_task"
    }
}

struct InfoCreateTask: Decodable {
    let nameCategory: String
    let details: [String]
    
    static func getInfoCreateTask() -> InfoCreateTask {
        InfoCreateTask(
            nameCategory: "Software",
            details: ["Service Desk", "Other"]
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case details
        case nameCategory = "name_category"
    }
}

struct Tasks: Decodable {
    let awaitingApproval: [CurrentTask]
    let currentTasks: CategoryTasks
    
    static func getTasks() -> Tasks {
        Tasks(
            awaitingApproval: [CurrentTask.getTask()],
            currentTasks: CategoryTasks.getCategoryTasks()
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case awaitingApproval = "awaiting_approval"
        case currentTasks = "current_tasks"
    }
}

struct CategoryTasks: Decodable {
    let open: [CurrentTask]
    let closed: [CurrentTask]
    let motivatedRefusals: [CurrentTask]
    
    static func getCategoryTasks() -> CategoryTasks {
        CategoryTasks(
            open: [CurrentTask.getTask()],
            closed: [CurrentTask.getTask()],
            motivatedRefusals: [CurrentTask.getTask()]
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case open, closed
        case motivatedRefusals = "motivated_refusals"
    }
}

struct CurrentTask: Decodable {
    let number: String
    let author: String
    let text: String
    let date: String
    let priority: String
    let status: String
    let responsiblePerson: String
    
    static func getTask() -> CurrentTask {
        CurrentTask(
            number: "1/10101",
            author: "Max Payne",
            text: "Hello! Just mock-data",
            date: "04.04.24",
            priority: "Important",
            status: "Open",
            responsiblePerson: "Sonny Ball"
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case number, author, text, date, priority, status
        case responsiblePerson = "responsible_person"
    }
}
