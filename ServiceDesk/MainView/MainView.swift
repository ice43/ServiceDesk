//
//  MainView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DepartmentsView()
                .tabItem {
                    Image(systemName: "star.circle")
                    Text("Departments")
                }
            
            ContactsView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Contacts")
                }
        }
        .tint(.ascp)
    }
}

#Preview {
    MainView()
}
