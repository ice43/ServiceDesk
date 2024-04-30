//
//  ContactCellView.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/13/24.
//

import SwiftUI

struct ContactCellView: View {
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image(systemName: "person.text.rectangle")
                    .foregroundStyle(.ascp)
                Text(contact.name)
                    .font(.headline)
            }
            Text(contact.post)
                .font(.subheadline)
        }
    }
}

#Preview {
    ContactCellView(contact: Contact.getContact())
}
