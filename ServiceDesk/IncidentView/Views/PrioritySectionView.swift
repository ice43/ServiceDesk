//
//  PrioritySectionView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct PrioritySectionView: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    
    var body: some View {
        Text("Priority")
        Menu {
            Button(action: { incidentViewVM.textPriority = "Default"} ) {
                Text("Default")
            }
            Button(action: { incidentViewVM.textPriority = "Important"} ) {
                Text("Important")
            }
            
        } label: {
            TextField("Select a priority", text: $incidentViewVM.textPriority)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    PrioritySectionView(
        incidentViewVM: IncidentViewViewModel()
    )
}
