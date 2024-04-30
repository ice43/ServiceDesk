//
//  AdvancedSearchSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct AdvancedSearchSection: View {
    @ObservedObject var departmentDetailsViewVM: DepartmentDetailsViewViewModel
    
    var body: some View {
        NavigationLink(
            destination: AdvancedSearchView(
                title: "Advanced search",
                tasks: departmentDetailsViewVM.openTasks
                        + departmentDetailsViewVM.closedTasks
                        + departmentDetailsViewVM.refusalTasks
                        + departmentDetailsViewVM.awaitingApproval),
            label: {
                Image(systemName: "magnifyingglass")
                Text("Advanced search")
            }
        )
    }
}

#Preview {
    AdvancedSearchSection(
        departmentDetailsViewVM: DepartmentDetailsViewViewModel()
    )
}
