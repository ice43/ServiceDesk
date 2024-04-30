//
//  IncidentSections.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct IncidentSections: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            PrioritySectionView(
                incidentViewVM: incidentViewVM
            )
            
            CategorySectionView(
                incidentViewVM: incidentViewVM
            )
            
            DetailSectionView(
                incidentViewVM: incidentViewVM
            )
            
            DescriptionSectionView(
                incidentViewVM: incidentViewVM
            )
        }
    }
}

#Preview {
    IncidentSections(
        incidentViewVM: IncidentViewViewModel()
    )
}
