//
//  ProfileItemView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 16/07/2023.
//

import SwiftUI

struct ProfileItemView: View {
    let label: String
    let data: String
    
    var body: some View {
        HStack {
            Text("\(label) : ")
                .bold()
            Text(data)
        }
        .padding(.vertical, 1)
    }
}

struct ProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileItemView(label: "Email", data: "test")
    }
}
