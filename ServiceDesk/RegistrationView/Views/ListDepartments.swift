//
//  ListDepartments.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct ListDepartments: View {
    @ObservedObject var registrationViewVM: RegistrationViewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Department")
                .foregroundStyle(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            Menu {
                ForEach(registrationViewVM.departments, id: \.name) { department in
                    Button(action: { registrationViewVM.textDepartment = department.name }) {
                        Text(department.name)
                    }
                }
            } label: {
                TextField("Select the department", text: $registrationViewVM.textDepartment)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

#Preview {
    ListDepartments(
        registrationViewVM: RegistrationViewViewModel()
    )
}
