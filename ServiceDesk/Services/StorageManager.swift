//
//  StorageManager.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("User") private var savedUser: Data?
    
    private init() {}
    
    func saveUser(_ user: User) {
        savedUser = try? JSONEncoder().encode(user)
    }
    
    func loadUser() -> User {
        guard let data = savedUser else {
            return User()
        }
        
        let user = try? JSONDecoder().decode(User.self, from: data)
        
        return user ?? User()
    }
    
    func removeUser() {
        savedUser = nil
    }
}


struct Departments {
    let name: String
    
    static func getDepartments() -> [Departments] {
        var departments: [Departments] = []
        for index in 0..<DataStore.shared.departments.count {
            let department = Departments(name: DataStore.shared.departments[index])
            
            departments.append(department)
        }
        return departments
    }
}

struct Tasks: Equatable {
    let author: String
    let task: String
    let number: String
    let date: String
    let priority: String
    let status: String
    let responsiblePerson: String
    
    static func getTasks() -> [Tasks] {
        var tasks: [Tasks] = []
        
        let dataStore = DataStore.shared
        
        let iterationCount = min(
            dataStore.authors.count,
            dataStore.tasks.count,
            dataStore.numbers.count,
            dataStore.dates.count,
            dataStore.priorities.count,
            dataStore.statuses.count,
            dataStore.responsiblePeople.count
        )
        
        for index in 0..<iterationCount {
            let task = Tasks(
                author: dataStore.authors[index],
                task: dataStore.tasks[index],
                number: dataStore.numbers[index],
                date: dataStore.dates[index],
                priority: dataStore.priorities[index],
                status: dataStore.statuses[index],
                responsiblePerson: dataStore.responsiblePeople[index]
            )
            tasks.append(task)
        }
        
        return tasks
    }
    
    static func == (lhs: Tasks, rhs: Tasks) -> Bool {
            return lhs.task == rhs.task
    }
}

final class DataStore {
    static let shared = DataStore()
    
    let departments = [
        "Information Technology Department",
        "Household Activities",
        "Logistics Service",
        "Energy Department",
        "Auto Transport Department",
        "Mechanization",
        "Carpenters"
    ]
    
    let authors = [
        "Shirley Simpson",
        "Edna Thompson",
        "Bonnie Moody",
        "Bonnie Silva",
        "Melvin King"
    ]
    
    let tasks = [
        "Create active directory account for new accountant",
        "New employee joining the organization",
        "Need to change location",
        "Unable to browse",
        "Web-site don't load"
    ]
    
    let numbers = [
        "#71",
        "#113",
        "#66",
        "#45",
        "#97"
    ]
    
    let dates = [
        "22 Feb, 03:30 PM",
        "17 Feb, 07:30 AM",
        "No due data set",
        "No due data set",
        "No due data set"
    ]
    
    let priorities = [
        "Priority not set",
        "Critical",
        "Priority not set",
        "Priority not set",
        "Priority not set"
    ]
    
    let statuses = [
        "Open",
        "Open",
        "Open",
        "Open",
        "Open"
    ]
    
    let responsiblePeople = [
        "Not set",
        "Not set",
        "Not set",
        "Not set",
        "Not set"
    ]
    
    private init() {}
}
