//
//  AdvancedSearchViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/23/24.
//

import Foundation

//final class AdvancedSearchViewViewModel: ObservableObject {
//    @Published var author = ""
//    @Published var text = ""
//    @Published var number = ""
//    @Published var date = ""
//    @Published var status = ""
//    @Published var responsiblePerson = ""
//    
//    @Published var filteredTasks: [Tasks] = []
//    
//    private let tasks: [Tasks]
//    
//    var searchParametere: [String] {
//        return [author, text, number, date, status, responsiblePerson]
//    }
//    
//    init(tasks: [Tasks]) {
//        self.tasks = tasks
//    }
//    
//    func filterTasks() {
//        filteredTasks = tasks.filter { task in
//            return task.author.localizedCaseInsensitiveContains(author) ||
//            task.task.localizedCaseInsensitiveContains(text) ||
//            task.number.localizedCaseInsensitiveContains(number) ||
//            task.date.localizedCaseInsensitiveContains(date) ||
//            task.status.localizedCaseInsensitiveContains(status) ||
//            task.responsiblePerson.localizedCaseInsensitiveContains(responsiblePerson)
//        }
//    }
//}
