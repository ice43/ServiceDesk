//
//  ExpandedTasks.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct ExpandedTasks: View {
    @ObservedObject var departmentDetailsViewVM: DepartmentDetailsViewViewModel
    @EnvironmentObject var loginViewVM: LoginViewViewModel
    
    let department: DepartmentTask
    
    var body: some View {
        Button {
            withAnimation {
                departmentDetailsViewVM.isExpandedTasks.toggle()
            }
        } label: {
            Image(systemName: loginViewVM.currentUser?.department == department.name
                  ? "arrowshape.turn.up.right"
                  : "arrowshape.turn.up.left")
            Text(loginViewVM.currentUser?.department == department.name
                 ? "Incoming requests"
                 : "Outgoing requests")
            Image(systemName: "chevron.down")
                .rotationEffect(.degrees(departmentDetailsViewVM.isExpandedTasks ? 0 : 90))
        }
        
        if departmentDetailsViewVM.isExpandedTasks {
            List {
                NavigationLink(
                    destination: TaskView(
                        title: "Open",
                        tasks: departmentDetailsViewVM.openTasks),
                    label: {
                        Text("Open")
                    }
                )
                NavigationLink(
                    destination: TaskView(
                        title: "Closed",
                        tasks: departmentDetailsViewVM.closedTasks),
                    label: {
                        Text("Closed")
                    }
                )
                NavigationLink(
                    destination: TaskView(
                        title: "Motivated refusals",
                        tasks: departmentDetailsViewVM.refusalTasks),
                    label: {
                        Text("Motivated refusals")
                    }
                )
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ExpandedTasks(
        departmentDetailsViewVM: DepartmentDetailsViewViewModel(),
        department: DepartmentTask.getDepartment())
        .environmentObject(LoginViewViewModel())
}
