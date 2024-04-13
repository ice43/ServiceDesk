//
//  ServiceDeskApp.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/8/24.
//

import SwiftUI

@main
struct ServiceDeskApp: App {
    @StateObject private var loginViewVM = LoginViewViewModel(
        user: StorageManager.shared.loadUser()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(loginViewVM)
    }
}
