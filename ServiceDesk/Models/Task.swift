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
    
    static func getDepartment() -> DepartmentTask {
        DepartmentTask(
            name: "Information Technology Department",
            infoCreateTask: [InfoCreateTask.getInfoCreateTask()]
        )
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
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
        case nameCategory = "name_category"
        case details
    }
}

//struct Tasks_: Decodable {
//    let awaitingApproval: [Task_]
//    
//    private enum CodingKeyForTasks_: String, CodingKey {
//        case awaitingApproval = "awaiting_approval"
//    }
//}

//struct Task_: Decodable {
//    let number: String
//    let author: String
//    let text: String
//    let date: String
//    let priority: String
//    let status: String
//    let responsiblePerson: String
//    
//    private enum CodingKeyForTask_: String, CodingKey {
//        case responsiblePerson = "responsible_person"
//    }
//}
