//
//  UserModel.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
