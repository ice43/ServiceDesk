//
//  TasksView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/17/24.
//

import SwiftUI

struct TasksView: View {
    let tasks: [Tasks]
    
    var body: some View {
        NavigationStack {
            List(tasks, id: \.number) { task in
                TaskCellView(task: task)
            }
        }
    }
}

#Preview {
    TasksView(tasks: Tasks.getTasks())
}
