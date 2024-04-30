//
//  CategorySectionView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct CategorySectionView: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    
    var body: some View {
        Text("Categories")
        Menu {
            ForEach(incidentViewVM.categories, id: \.self) { nameCategory in
                Button {
                    incidentViewVM.textCategory = nameCategory
                    incidentViewVM.selectedCategories = nameCategory
                } label: {
                    Text(nameCategory)
                }
            }
        } label: {
            TextField("Select a category", text: $incidentViewVM.textCategory)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    CategorySectionView(
        incidentViewVM: IncidentViewViewModel()
    )
}
