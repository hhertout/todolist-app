//
//  ListItemView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI

struct ListItemView: View {
    @State var viewModel = ListItemViewViewModel()
    let item : TodoListItem
    let listViewModel: ListViewViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                let date: String = (Date(timeIntervalSince1970: item.dueDate)
                    .formatted(date: .abbreviated, time: .shortened))
                Text(item.title)
                    .font(.title3)
                    .bold()
                Text(date)
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                listViewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isDone ? Color.green : Color.orange)
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(
            item: .init(
                id: "123",
                title: "Get milk",
                dueDate: Date().timeIntervalSince1970,
                creationDate: Date().timeIntervalSince1970,
                isDone: false
            ),
            listViewModel: ListViewViewModel(userId: "ftPt9taZjXSswuQ8lQDGWX3ACZl2")
        )
    }
}
