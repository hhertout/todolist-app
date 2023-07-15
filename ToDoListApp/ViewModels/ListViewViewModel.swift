//
//  ListViewViewModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation
import FirebaseFirestore

class ListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete function
    /// - Parameter itemId: String
    func delete(itemId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
    func toggleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        // Can get the user id by
        // gard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
