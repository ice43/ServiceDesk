//
//  SettingsRowView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/29/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
        }
    }
}

#Preview {
    SettingsRowView(
        imageName: "gear",
        title: "Department",
        tintColor: .gray
    )
}
