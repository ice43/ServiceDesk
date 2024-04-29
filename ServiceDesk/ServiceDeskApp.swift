//
//  ServiceDeskApp.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/8/24.
//

import SwiftUI
import FirebaseCore

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ServiceDeskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var loginViewVM = LoginViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(loginViewVM)
        }
    }
}
