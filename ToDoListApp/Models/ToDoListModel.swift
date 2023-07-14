//
//  ToDoListModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let creationDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
