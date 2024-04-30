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
                if departmentsViewVM.isLoading {
                    ProgressView()
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(departmentsViewVM.departments, id: \.name) { department in
                            NavigationLink(destination: DepartmentDetailsView(
                                title: department.name,
                                department: department)
                            ) {
                                DepartmentItemView(title: department.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Service Desk")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
        .onAppear {
            departmentsViewVM.fetchDepartments()
        }
        .refreshable {
            departmentsViewVM.fetchDepartments()
        }
    }
}

#Preview {
    DepartmentsView()
}
