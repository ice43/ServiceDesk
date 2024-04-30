//
//  TaskNumberSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct TaskNumberSection: View {
    let task: CurrentTask
    
    var body: some View {
        HStack {
            Text("Task \(task.number)")
                .bold()
            
            Spacer()
            
            Text(task.author)
        }
    }
}

#Preview {
    TaskNumberSection(task: CurrentTask.getTask())
}
