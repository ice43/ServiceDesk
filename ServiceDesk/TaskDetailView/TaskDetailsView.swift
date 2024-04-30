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
                secondTitle: "Priority",
                task: task
            )
            
            Divider()
            
            TaskDetailsSection(
                firstTitle: "Responsible person",
                secondTitle: "Date",
                task: task
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
