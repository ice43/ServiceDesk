//
//  CreateIncidentButton.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct CreateIncidentButton: View {
    @ObservedObject var departmentsDetailsViewVM: DepartmentDetailsViewViewModel
    
    let department: DepartmentTask
    
    var body: some View {
        Button {
            departmentsDetailsViewVM.isShowingCreateAnIncident = true
        } label: {
            Text("Create an incident")
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 45)
        .background(.green)
        .clipShape(.capsule)
        .sheet(isPresented: $departmentsDetailsViewVM.isShowingCreateAnIncident) {
            IncidentView(departmentName: department)
        }
    }
}

#Preview {
    CreateIncidentButton(
        departmentsDetailsViewVM: DepartmentDetailsViewViewModel(),
        department: DepartmentTask.getDepartment()
    )
}
