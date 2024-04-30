//
//  LogoView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    LogoView()
}
