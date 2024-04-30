//
//  TaskDetailsSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct TaskDetailsSection: View {
    let firstTitle: String
    let secondTitle: String
    let task: CurrentTask
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(firstTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(task.responsiblePerson)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider().frame(height: 60)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(secondTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(task.date)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    TaskDetailsSection(
        firstTitle: "Status",
        secondTitle: "Priority",
        task: CurrentTask.getTask()
    )
}
