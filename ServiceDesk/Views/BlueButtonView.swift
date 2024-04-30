//
//  BlueButtonView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct BlueButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(.white)
        }
        .frame(width: 120, height: 45)
        .background(.ascp)
        .clipShape(.capsule)
    }
}

#Preview {
    BlueButtonView(title: "Sign in",
                   action: {}
    )
}
