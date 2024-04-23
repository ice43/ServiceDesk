//
//  DepartmentsView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct DepartmentsView: View {
    @StateObject private var departmentsViewVM = DepartmentsViewViewModel()
     
    private let columns = [GridItem(.adaptive(minimum: 180, maximum: 180))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(departmentsViewVM.departments, id: \.name) { department in
                            NavigationLink(
                                destination: DepartmentDetailsView(
                                    title: department.name,
                                    departmentName: department)) {
                                DepartmentItemView(title: department.name)
                            }
                        }
                    }
            }
            .navigationTitle("Service Desk")
        }
        .onAppear {
            departmentsViewVM.fetchDepartments()
        }
    }
}

#Preview {
    DepartmentsView()
}
