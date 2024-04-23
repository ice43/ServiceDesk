//
//  TasksView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/17/24.
//

import SwiftUI

struct TasksView: View {
    let tasks: [Tasks]
    let title: String
    
    var body: some View {
        NavigationStack {
            List(tasks, id: \.number) { task in
                NavigationLink(destination: TaskView(task: task, title: task.task)) {
                    TaskCellView(task: task)
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    TasksView(tasks: Tasks.getTasks(), title: "Information Technology Department")
}
