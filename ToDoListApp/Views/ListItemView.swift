//
//  ListItemView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct ListItemView: View {
    @State var viewModel = ListItemViewViewModel()
    
    var body: some View {
        Text("Item")
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView()
    }
}
