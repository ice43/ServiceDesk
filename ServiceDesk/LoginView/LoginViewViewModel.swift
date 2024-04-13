//
//  LoginViewViewModel.swift
//  ServiceDesk
//
//  Created by Serge Broski on 4/9/24.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var user = User()
    
    init(user: User = User()) {
        self.user = user
    }
    
    func openMainView() {
        user.isLogged.toggle()
    }
}
