//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard isValid else {
            return
        }
        //Get current id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newTodo = TodoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            creationDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newTodo.asDictionary())
    }
    
    var isValid: Bool {
        guard
            !title.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        let secondInADay: Double = 86400
        guard dueDate >= Date().addingTimeInterval(-secondInADay) else {
            return false
        }
        return true
    }
}
