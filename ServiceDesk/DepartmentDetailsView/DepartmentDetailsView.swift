//
//  DepartmentDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct DepartmentDetailsView: View {
    @State private var isShowingCreateAnIncident = false
    @State private var isExpandedIncome = false
    @State private var isExpandedOutgoing = false
    @State private var isExpandedGroup = false
    
    let title: String
    let tasks = Tasks.getTasks()
    let departmentName: DepartmentTask
    
    var body: some View {
        Spacer()
        
        Button(action: { isShowingCreateAnIncident = true } ) {
            Text("Create an incident")
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 45)
        .background(.green)
        .clipShape(.capsule)
        .sheet(isPresented: $isShowingCreateAnIncident) {
            IncidentView(departmentName: departmentName)
        }
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {            
            NavigationLink(destination: TasksView(tasks: tasks, title: "Awaiting approval")) {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Awaiting approval")
                }
            }
            
            Button(action: showIncomingRequests) {
                Image(systemName: "arrowshape.turn.up.right")
                Text("Incoming requests")
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpandedIncome ? 0 : 90))
            }
            
            if isExpandedIncome {
                List {
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Open"),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Completed"),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Closed"),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Motivated refusals"),
                        label: { Text("Motivated refusals") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Subscriptions"),
                        label: { Text("Subscriptions") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Approval"),
                        label: { Text("Approval") }
                    )
                }
                .listStyle(.plain)
            }
            
            
            Button(action: showOutgoingRequests) {
                Image(systemName: "arrowshape.turn.up.left")
                Text("Outgoing requests")
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpandedOutgoing ? 0 : 90))
            }
            
            if isExpandedOutgoing {
                List {
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Open"),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Completed"),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Closed"),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Motivated refusals"),
                        label: { Text("Motivated refusals") }
                    )
                }
                .listStyle(.plain)
            }
            
            Button(action: showGroupRequests) {
                Image(systemName: "folder")
                Text("My group")
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(isExpandedGroup ? 0 : 90))
            }
            
            if isExpandedGroup {
                List {
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Open"),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Completed"),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Closed"),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Motivated refusals"),
                        label: { Text("Motivated refusals") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Subscriptions"),
                        label: { Text("Subscriptions") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks, title: "Approval"),
                        label: { Text("Approval") }
                    )
                }
                .listStyle(.plain)
            }
            
            NavigationLink(destination: AdvancedSearchView(title: "Advanced search", tasks: tasks)) {
                Image(systemName: "magnifyingglass")
                Text("Advanced search")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(title)
        
        
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
    
    
    func showIncomingRequests() {
        withAnimation {
            isExpandedIncome.toggle()
        }
        isExpandedOutgoing = false
        isExpandedGroup = false
    }
    
    func showOutgoingRequests() {
        withAnimation {
            isExpandedOutgoing.toggle()
        }
        isExpandedIncome = false
        isExpandedGroup = false
    }
    
    func showGroupRequests() {
        withAnimation {
            isExpandedGroup.toggle()
        }
        isExpandedIncome = false
        isExpandedOutgoing = false
    }
}

//#Preview {
//    DepartmentDetailsView(title: "IT Department", department: )
//}
