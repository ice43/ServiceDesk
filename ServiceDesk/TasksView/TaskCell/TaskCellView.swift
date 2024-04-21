//
//  TaskCellView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/18/24.
//

import SwiftUI

struct TaskCellView: View {
    let task: Tasks
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(task.number)
                Image(systemName: "poweron")
                    .foregroundStyle(.gray)
                Text(task.author)
                
                Spacer()
                
                Text(task.priority)
            }
            
            Text(task.task)
                .bold()
                .lineLimit(1)
            
            HStack {
                Text("Due")
                Text(task.date)
                    .foregroundStyle(.ascp)
            }
        }
    }
}

#Preview {
    TaskCellView(task: Tasks.getTasks().first!)
}
