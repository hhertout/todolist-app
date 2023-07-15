//
//  ListView.swift
//  ToDoListApp
//
//  Created by Hugues Hertout on 05/07/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ListView: View {
    @StateObject var viewModel: ListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel =  StateObject(
            wrappedValue: ListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ListItemView(item: item, listViewModel: self.viewModel)
                        .swipeActions {
                            Button {
                                viewModel.delete(itemId: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(userId: "ftPt9taZjXSswuQ8lQDGWX3ACZl2")
    }
}
