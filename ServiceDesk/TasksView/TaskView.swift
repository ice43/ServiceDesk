//
//  TaskView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/17/24.
//

import SwiftUI

struct TaskView: View {
    let title: String
    let tasks: [CurrentTask]
    
    var body: some View {
        NavigationStack {
            List(tasks, id: \.number) { task in
                NavigationLink(destination: TaskDetailsView(task: task, title: task.text)) {
                    TaskCellView(task: task)
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    TaskView(
        title: "Information Technology Department",
        tasks: [CurrentTask.getTask()]
    )
}
