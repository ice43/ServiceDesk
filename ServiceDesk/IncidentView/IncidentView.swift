//
//  AccidentView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct IncidentView: View {
    @StateObject private var incidentViewVM = IncidentViewViewModel()
    @Environment(\.dismiss) private var dismiss
    
    let departmentName: DepartmentTask
    
    var body: some View {
        IncidentButtons(incidentViewVM: incidentViewVM)
        
        Spacer()
        
        IncidentSections(incidentViewVM: incidentViewVM)
        .padding()
        .onAppear {
            incidentViewVM.fetchInfoForCreateTasks(for: departmentName.name)
        }
        
        Spacer()
    }
}

#Preview {
    IncidentView(
        departmentName: DepartmentTask.getDepartment()
    )
}
