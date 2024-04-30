//
//  DepartmentDetailsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct DepartmentDetailsView: View {
    @StateObject private var departmentDetailsViewVM = DepartmentDetailsViewViewModel()
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    let title: String
    let department: DepartmentTask
    
    var body: some View {
        Spacer()
        
        CreateIncidentButton(
            departmentsDetailsViewVM: departmentDetailsViewVM,
            department: department
        )
        
        Spacer()
        
        TasksSection(
            departmentDetailsViewVM: departmentDetailsViewVM,
            department: department
        )
        .padding()
        .navigationTitle(title)
        .onAppear {
            departmentDetailsViewVM.fetchTasks(for: department.name)
            withAnimation {
                departmentDetailsViewVM.isExpandedTasks.toggle()
            }
        }
        
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
}

#Preview {
    DepartmentDetailsView(
        title: "IT Department",
        department: DepartmentTask.getDepartment())
        .environmentObject(LoginViewViewModel())
}
