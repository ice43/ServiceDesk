//
//  IncidentButtons.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct IncidentButtons: View {
    @ObservedObject var incidentViewVM: IncidentViewViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(action: dismiss.callAsFunction) {
                Text("Cancel")
                    .foregroundStyle(.red)
            }
            
            Spacer()
        
            Button {
                incidentViewVM.isShowingAlert = true
            } label: {
                Text("Create an incident")
                    .foregroundStyle(.white)
            }
            .frame(width: 180, height: 45)
            .background(.ascp)
            .clipShape(.capsule)
        }
        .padding()
        .alert(":)",
               isPresented: $incidentViewVM.isShowingAlert,
               actions: { Button("OK", action: dismiss.callAsFunction) }
        ) {
            Text("POST request server support is needed")
        }
    }
}

#Preview {
    IncidentButtons(
        incidentViewVM: IncidentViewViewModel()
    )
}
