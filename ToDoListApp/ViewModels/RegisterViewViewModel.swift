//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var name: String = ""
    @Published var errors: Array<String> = []
    
    init() {}
    
    func register() {
        guard validate().count == 0 else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insetUserRecord(id: userId)
        }
    }
    
    private func insetUserRecord(id: String) {
        let newUser = User(
            id: id,
            name: name,
            email: email,
            joined: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Array<String> {
        errors = []
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("Email cannot be empty")
        }
        if password.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("Password cannot be empty")
        }
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("Name cannot be empty")
        }
        if !email.contains("@") || !email.contains(".") {
            errors.append("Invalid email format")
        }
        if password.count < 6 {
            errors.append("Password is too short, 6 character minimum")
        }
        return errors
    }
}
