//
//  TaskDetailsSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct TaskDetailsSection: View {
    let firstTitle: String
    let firstValue: String
    let secondTitle: String
    let secondValue: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(firstTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(firstValue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider().frame(height: 60)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(secondTitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(secondValue)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    TaskDetailsSection(
        firstTitle: "Status",
        firstValue: "Open",
        secondTitle: "Priority",
        secondValue: "Default"
    )
}
