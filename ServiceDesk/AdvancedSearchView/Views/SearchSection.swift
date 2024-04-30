//
//  SearchSection.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct SearchSection: View {
    @ObservedObject var advancedSearchViewVM: AdvancedSearchViewViewModel
    
    let tasks: [CurrentTask]
    
    var body: some View {
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.author,
            title: "Author",
            placeholder: "Specify the author you are looking for",
            tasks: tasks
        )
        
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.text,
            title: "Text",
            placeholder: "Specify the text you are looking for",
            tasks: tasks
        )
        
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.number,
            title: "Number",
            placeholder: "Not selected",
            tasks: tasks
        )
        
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.date,
            title: "Date",
            placeholder: "Not selected",
            tasks: tasks
        )
        
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.status,
            title: "Status",
            placeholder: "Not selected",
            tasks: tasks
        )
        
        SearchFieldView(
            advancedSearchViewVM: advancedSearchViewVM,
            text: $advancedSearchViewVM.responsiblePerson,
            title: "Responsible person",
            placeholder: "Not selected",
            tasks: tasks
        )
    }
}

#Preview {
    SearchSection(
        advancedSearchViewVM: AdvancedSearchViewViewModel(),
        tasks: [CurrentTask.getTask()]
    )
}
