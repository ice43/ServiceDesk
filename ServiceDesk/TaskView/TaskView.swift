//
//  TaskView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct TaskView: View {
    let task: CurrentTask
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Task \(task.number)")
                    .bold()
                
                Spacer()
                
                Text(task.author)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Status")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(task.status)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider().frame(height: 60)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Priority")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(task.priority)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Responsible person")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(task.responsiblePerson)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider().frame(height: 60)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Due date")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Text(task.date)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
            
            Text("Description")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(task.text)
            
            Spacer()
        }
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    TaskView(task: CurrentTask.getTask(), title: "Create active directory account for new accountant")
}
