//
//  AdvancedSearchViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/23/24.
//

import Foundation

final class AdvancedSearchViewViewModel: ObservableObject {
    @Published var author = ""
    @Published var text = ""
    @Published var number = ""
    @Published var date = ""
    @Published var status = ""
    @Published var responsiblePerson = ""
    
    @Published var filteredTasks: [CurrentTask] = []
    
    func filterTasks(for tasks: [CurrentTask]) {
        filteredTasks = tasks.filter { task in
            return task.author.localizedCaseInsensitiveContains(author) ||
            task.text.localizedCaseInsensitiveContains(text) ||
            task.number.localizedCaseInsensitiveContains(number) ||
            task.date.localizedCaseInsensitiveContains(date) ||
            task.status.localizedCaseInsensitiveContains(status) ||
            task.responsiblePerson.localizedCaseInsensitiveContains(responsiblePerson)
        }
    }
}
