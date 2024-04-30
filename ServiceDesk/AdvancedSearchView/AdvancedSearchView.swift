//
//  AdvancedSearchView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/21/24.
//

import SwiftUI

struct AdvancedSearchView: View {
    @StateObject private var advancedSearchViewVM = AdvancedSearchViewViewModel()
    
    let title: String
    let tasks: [CurrentTask]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                SearchSection(
                    advancedSearchViewVM: advancedSearchViewVM,
                    tasks: tasks
                )
                
                FilteredTasksSection(
                    advancedSearchViewVM: advancedSearchViewVM
                )
            }
            .padding()
            .navigationTitle(title)
        }
    }
}

#Preview {
    AdvancedSearchView(
        title: "Advanced search",
        tasks: [CurrentTask.getTask()]
    )
}
