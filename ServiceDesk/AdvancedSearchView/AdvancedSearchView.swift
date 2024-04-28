//
//  AdvancedSearchView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct AdvancedSearchView: View {
    @State private var author = ""
    @State private var text = ""
    @State private var number = ""
    @State private var date = ""
    @State private var status = ""
    @State private var responsiblePerson = ""
    
    @State private var filteredTasks: [CurrentTask] = []
    
    let title: String
    let tasks: [CurrentTask]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Author")
                TextField("Specify the author you are looking for", text: $author)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: author) { _, _ in
                        filterRequests()
                    }
                    .onAppear {
                        UITextField.appearance().clearButtonMode = .whileEditing
                    }
                
                Text("Text")
                TextField("Specify the text you are looking for", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: text) { _, _ in
                        filterRequests()
                    }
                
                Text("Number")
                TextField("Not selected", text: $number)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: number) { _, _ in
                        filterRequests()
                    }
                
                Text("Date")
                TextField("Not selected", text: $date)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: date) { _, _ in
                        filterRequests()
                    }
                
                Text("Status")
                TextField("Not selected", text: $status)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: status) { _, _ in
                        filterRequests()
                    }
                
                Text("Responsible person")
                TextField("Not selected", text: $responsiblePerson)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: responsiblePerson) { _, _ in
                        filterRequests()
                    }
                
                
                ForEach(filteredTasks, id: \.number) { task in
                    NavigationLink(destination: TaskView(task: task, title: task.text)) {
                        TaskCellView(task: task)
                            .foregroundStyle(.black)
                    }
                    Divider()
                }
                
            }
            .padding()
            .navigationTitle(title)
        }
    }
    
    private func filterRequests() {
        filteredTasks = tasks.filter { task in
            return task.author.localizedCaseInsensitiveContains(author) ||
            task.text.localizedCaseInsensitiveContains(text) ||
            task.number.localizedCaseInsensitiveContains(number) ||
            task.date.localizedCaseInsensitiveContains(date) ||
            task.status.localizedCaseInsensitiveContains(status) ||
            task.responsiblePerson.localizedCaseInsensitiveContains(responsiblePerson)
        }
    }
}

#Preview {
    AdvancedSearchView(title: "Advanced search", tasks: [CurrentTask.getTask()])
}
