//
//  MainViewModel.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import Foundation

class MainViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    func deleteItem(_ item: ToDoItemEntity){
        DataManager.shared.deleteToDoItem(item)
    }
}
