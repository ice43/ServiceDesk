//
//  AwaitingApprovalSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct AwaitingApprovalSection: View {
    @ObservedObject var departmentDetailsViewVM: DepartmentDetailsViewViewModel
    
    var body: some View {
        NavigationLink(
            destination: TaskView(
                title: "Awaiting approval",
                tasks: departmentDetailsViewVM.awaitingApproval),
            label: {
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Awaiting approval")
                }
            }
        )
    }
}

#Preview {
    AwaitingApprovalSection(
        departmentDetailsViewVM: DepartmentDetailsViewViewModel()
    )
}
