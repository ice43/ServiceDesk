//
//  TasksSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct TasksSection: View {
    @ObservedObject var departmentDetailsViewVM: DepartmentDetailsViewViewModel
    @EnvironmentObject var loginViewVM: LoginViewViewModel
    
    let department: DepartmentTask
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            AwaitingApprovalSection(
                departmentDetailsViewVM: departmentDetailsViewVM
            )
            
            ExpandedTasks(
                departmentDetailsViewVM: departmentDetailsViewVM,
                department: department
            )
            
            AdvancedSearchSection(
                departmentDetailsViewVM: departmentDetailsViewVM
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TasksSection(
        departmentDetailsViewVM: DepartmentDetailsViewViewModel(),
        department: DepartmentTask.getDepartment())
        .environmentObject(LoginViewViewModel())
}
