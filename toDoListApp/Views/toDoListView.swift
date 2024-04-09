//
//  TabBarView.swift
//  toDoListApp
//
//  Created by Berken Özbek on 19.03.2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct toDoListView: View {
    @StateObject var viewModel: toDoListViewModel
    @FirestoreQuery var Items: [toDoListItem]
    
    init(userId: String) {
        self._Items = FirestoreQuery(collectionPath: "Users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: toDoListViewModel(UserId: userId))
    }
    
    var body: some View {
        NavigationView {
                VStack{
                    List(Items) {item in
                        toDoListItemsView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(Color.red)
                            }
                        
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationTitle("To Do List")
                .toolbar {
                    Button {
                        //action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    toDoListView(userId: "IJid9g1doTQ4lckLQ4uKn7GOtbf2")
}
