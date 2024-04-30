//
//  TaskDescriptionSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct TaskDescriptionSection: View {
    let task: CurrentTask
    
    var body: some View {
        Text("Description")
            .font(.subheadline)
            .foregroundStyle(.secondary)
        
        Text(task.text)
    }
}

#Preview {
    TaskDescriptionSection(
        task: CurrentTask.getTask()
    )
}
