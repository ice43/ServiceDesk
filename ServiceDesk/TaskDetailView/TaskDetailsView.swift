//
//  TaskDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct TaskDetailsView: View {
    let task: CurrentTask
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TaskNumberSection(task: task)
            
            Divider()
            
            TaskDetailsSection(
                firstTitle: "Status",
                firstValue: task.status,
                secondTitle: "Priority",
                secondValue: task.priority
            )
            
            Divider()
            
            TaskDetailsSection(
                firstTitle: "Responsible person",
                firstValue: task.responsiblePerson,
                secondTitle: "Date",
                secondValue: task.date
            )
            
            Divider()
            
            TaskDescriptionSection(
                task: task
            )
            
            Spacer()
        }
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    TaskDetailsView(
        task: CurrentTask.getTask(),
        title: "Create active directory account for new accountant"
    )
}
