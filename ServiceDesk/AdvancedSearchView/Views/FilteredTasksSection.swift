//
//  FilteredTasksSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct FilteredTasksSection: View {
    @ObservedObject var advancedSearchViewVM: AdvancedSearchViewViewModel
    
    var body: some View {
        ForEach(advancedSearchViewVM.filteredTasks, id: \.number) { task in
            NavigationLink(destination: TaskDetailsView(task: task, title: task.text)) {
                TaskCellView(task: task)
                    .foregroundStyle(.black)
            }
            Divider()
        }
    }
}

#Preview {
    FilteredTasksSection(
        advancedSearchViewVM: AdvancedSearchViewViewModel()
    )
}
