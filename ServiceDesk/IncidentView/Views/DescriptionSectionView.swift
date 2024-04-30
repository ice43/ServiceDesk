//
//  DescriptionSectionView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct DescriptionSectionView: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    
    var body: some View {
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
}

#Preview {
    DescriptionSectionView(
        incidentViewVM: IncidentViewViewModel()
    )
}
