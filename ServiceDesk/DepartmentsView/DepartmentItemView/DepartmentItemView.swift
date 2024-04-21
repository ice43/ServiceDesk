//
//  DepartmentItemView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct DepartmentItemView: View {
    let title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 180, height: 180)
                .foregroundStyle(.ascp)
                .clipShape(.rect(cornerRadius: 60))
            
            Text(title)
                .multilineTextAlignment(.center)
                .frame(width: 180)
                .font(.title2)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    DepartmentItemView(
        title: "Information Technology Department")
}
