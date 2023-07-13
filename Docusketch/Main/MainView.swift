//
//  ContentView.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import SwiftUI

struct MainView: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.creationDate, order: .reverse)
    ]) var items: FetchedResults<ToDoItemEntity>
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.deleteItem(item)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ToDo App")
            .toolbar {
                Button{
                    viewModel.showingNewItemView.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(showView: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
