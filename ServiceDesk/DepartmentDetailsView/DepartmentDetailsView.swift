//
//  DepartmentDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct DepartmentDetailsView: View {
    @StateObject private var departmentsDetailsViewVM = DepartmentDetailsViewViewModel()
    
    let title: String
    let department: DepartmentTask
    
    var body: some View {
        Spacer()
        
        Button(action: { departmentsDetailsViewVM.isShowingCreateAnIncident = true } ) {
            Text("Create an incident")
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 45)
        .background(.green)
        .clipShape(.capsule)
        .sheet(isPresented: $departmentsDetailsViewVM.isShowingCreateAnIncident) {
            IncidentView(departmentName: department)
        }
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {            
            NavigationLink(destination: TasksView(title: "Awaiting approval", tasks: departmentsDetailsViewVM.awaitingApproval)) {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Awaiting approval")
                }
            }
            
            Button(action: showIncomingRequests) {
                Image(systemName: "arrowshape.turn.up.right")
                Text("Incoming requests")
                Image(systemName: "chevron.down")
                    .rotationEffect(.degrees(departmentsDetailsViewVM.isExpandedTasks ? 0 : 90))
            }
            
            if departmentsDetailsViewVM.isExpandedTasks {
                List {
                    NavigationLink(
                        destination: TasksView(title: "Open", tasks: departmentsDetailsViewVM.openTasks),
                        label: { Text("Open") }
                    )
                    NavigationLink(
                        destination: TasksView(title: "Closed", tasks: departmentsDetailsViewVM.closedTasks),
                        label: { Text("Closed") }
                    )
                    NavigationLink(
                        destination: TasksView(title: "Motivated refusals", tasks: departmentsDetailsViewVM.refusalTasks),
                        label: { Text("Motivated refusals") }
                    )
                }
                .listStyle(.plain)
            }
            
//            Button(action: showOutgoingRequests) {
//                Image(systemName: "arrowshape.turn.up.left")
//                Text("Outgoing requests")
//                Image(systemName: "chevron.down")
//                    .rotationEffect(.degrees(departmentsDetailsViewVM.isExpandedOutgoing ? 0 : 90))
//            }
//            
//            if departmentsDetailsViewVM.isExpandedOutgoing {
//                List {
//                    NavigationLink(
//                        destination: TasksView(title: "Open", tasks: departmentsDetailsViewVM.openOutgoing),
//                        label: { Text("Open") }
//                    )
//                    NavigationLink(
//                        destination: TasksView(title: "Closed", tasks: departmentsDetailsViewVM.closedOutgoing),
//                        label: { Text("Closed") }
//                    )
//                    NavigationLink(
//                        destination: TasksView(title: "Motivated refusals", tasks: departmentsDetailsViewVM.refusalsOutgoing),
//                        label: { Text("Motivated refusals") }
//                    )
//                }
//                .listStyle(.plain)
//            }
            
            NavigationLink(destination: AdvancedSearchView(title: "Advanced search", tasks: departmentsDetailsViewVM.openTasks)) {
                Image(systemName: "magnifyingglass")
                Text("Advanced search")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(title)
        .onAppear {
            departmentsDetailsViewVM.fetchTasks(for: department.name)
            showIncomingRequests()
        }
        
        
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
            departmentsDetailsViewVM.isExpandedTasks.toggle()
        }
//        departmentsDetailsViewVM.isExpandedOutgoing = false
    }
    
//    func showOutgoingRequests() {
//        withAnimation {
//            departmentsDetailsViewVM.isExpandedOutgoing.toggle()
//        }
//        departmentsDetailsViewVM.isExpandedTasks = false
//    }
}

#Preview {
    DepartmentDetailsView(title: "IT Department", department: DepartmentTask.getDepartment())
}
