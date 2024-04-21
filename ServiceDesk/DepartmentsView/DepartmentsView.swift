//
//  DepartmentsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct DepartmentsView: View {
    private let departments = Departments.getDepartments()
    private let columns = [GridItem(.adaptive(minimum: 180, maximum: 180))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(departments, id: \.name) { department in
                        NavigationLink(destination: DepartmentDetailsView(title: department.name)) {
                            DepartmentItemView(title: department.name)
                        }
                    }
                }
            }
            .navigationTitle("Service Desk")
        }
    }
}

#Preview {
    DepartmentsView()
}
