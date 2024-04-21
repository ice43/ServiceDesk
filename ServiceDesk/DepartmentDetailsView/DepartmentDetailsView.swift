//
//  DepartmentDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct DepartmentDetailsView: View {
    @State private var isExpandedIncome = false
    @State private var isExpandedOutgoing = false
    @State private var isExpandedGroup = false
    
    let title: String
    let tasks = Tasks.getTasks()
    
    var body: some View {
        Spacer()
        
        Button(action: {} ) {
            Text("Create an accident")
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 45)
        .background(.green)
        .clipShape(.capsule)
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {
            Button(action: {} ) {
                Image(systemName: "hand.thumbsup")
                Text("Awaiting approval")
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
                        destination: TasksView(tasks: tasks),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Motivated refusals") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Subscriptions") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Approval") }
                    )
                }
                .listStyle(.plain)
                .transition(.move(edge: .bottom))
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
                        destination: TasksView(tasks: tasks),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Motivated refusals") }
                    )
                }
                .listStyle(.plain)
                .transition(.move(edge: .bottom))
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
                        destination: TasksView(tasks: tasks),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Completed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Motivated refusals") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Subscriptions") }
                    )
                    NavigationLink(
                        destination: TasksView(tasks: tasks),
                        label: { Text("Approval") }
                    )
                }
                .listStyle(.plain)
                .transition(.move(edge: .bottom))
            }
            
            Button(action: {} ) {
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

#Preview {
    DepartmentDetailsView(title: "IT Department")
}
