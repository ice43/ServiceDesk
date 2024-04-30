//
//  DetailSectionView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct DetailSectionView: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    
    var body: some View {
        if !incidentViewVM.selectedCategories.isEmpty {
            Text("Details")
            
            Menu {
                ForEach(incidentViewVM.getDetailsForCategory(incidentViewVM.selectedCategories), id: \.self) { detail in
                    Button {
                        incidentViewVM.textDetail = detail
                    } label: {
                        Text(detail)
                    }
                }
            } label: {
                TextField("Select the detail", text: $incidentViewVM.textDetail)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

#Preview {
    DetailSectionView(
        incidentViewVM: IncidentViewViewModel()
    )
}
