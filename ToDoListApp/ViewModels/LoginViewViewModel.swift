//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        errorMessage = ""
        guard !email
            .trimmingCharacters(in: .whitespaces)
            .isEmpty,
              !password
            .trimmingCharacters(in: .whitespaces)
            .isEmpty else {
            errorMessage = "Email or password invalid"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        return true
    }
}
