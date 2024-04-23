//
//  AccidentView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct IncidentView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var incidentViewVM = IncidentViewViewModel()
    
    let departmentName: DepartmentTask
    
    var body: some View {
        HStack {
            Button(action: dismiss.callAsFunction) {
                Text("Cancel")
                    .foregroundStyle(.red)
            }
            
            Spacer()
            
            Button(action: dismiss.callAsFunction) {
                Text("Create an incident")
                    .foregroundStyle(.white)
            }
            .frame(width: 180, height: 45)
            .background(.ascp)
            .clipShape(.capsule)
                
        }
        .padding()
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Priority")
            Menu {
                Button(action: { incidentViewVM.textPriority = "Default"} ) {
                    Text("Default")
                }
                Button(action: { incidentViewVM.textPriority = "second"} ) {
                    Text("Important")
                }

            } label: {
                TextField("Select a priority", text: $incidentViewVM.textPriority)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
            }
            
            Text("Categories")
            
            Menu {
                ForEach(incidentViewVM.categories, id: \.self) { nameCategory in
                    Button(action: {
                        incidentViewVM.textCategory = nameCategory
                        incidentViewVM.selectedCategories = nameCategory
                    }) {
                        Text(nameCategory)
                    }
                }
            } label: {
                TextField("Select a category", text: $incidentViewVM.textCategory)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
            }
            
            
            if !incidentViewVM.selectedCategories.isEmpty {
                Text("Details")
                
                Menu {
                    ForEach(incidentViewVM.getDetailsForCategory(incidentViewVM.selectedCategories), id: \.self) { detail in
                        Button(action: { incidentViewVM.textDetail = detail }) {
                            Text(detail)
                        }
                    }
                } label: {
                    TextField("Select the detail", text: $incidentViewVM.textDetail)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.leading)
                }
            }
            
            Text("Description")
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $incidentViewVM.textDescription)
                    .frame(height: 200)
                    .border(.fill, width: 0.5)
                    .clipShape(.rect(cornerRadius: 5))
                
                if incidentViewVM.textDescription.isEmpty {
                    Text("Specify description of the incident")
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 7)
                }
            }
        }
        .padding()
        .onAppear {
            incidentViewVM.fetchInfoForCreateTasks(for: departmentName.name)
            print(incidentViewVM.categories)
        }
        
        Spacer()
    }
}

#Preview {
    IncidentView(departmentName: DepartmentTask.getDepartment())
}
