//
//  SearchFieldView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/30/24.
//

import SwiftUI

struct SearchFieldView: View {
    @ObservedObject var advancedSearchViewVM: AdvancedSearchViewViewModel
    @Binding var text: String
    
    let title: String
    let placeholder: String
    let tasks: [CurrentTask]
    
    var body: some View {
        Text(title)
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .onChange(of: advancedSearchViewVM.author) { _, _ in
                advancedSearchViewVM.filterTasks(for: tasks)
            }
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
    }
}

#Preview {
    SearchFieldView(
        advancedSearchViewVM: AdvancedSearchViewViewModel(), 
        text: .constant(""),
        title: "Author",
        placeholder: "Specify the author you are looking for",
        tasks: [CurrentTask.getTask()]
    )
}
