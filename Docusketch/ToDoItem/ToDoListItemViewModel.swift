//
//  ToDoListItemViewModel.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import Foundation

class ToDoListItemViewModel: ObservableObject{
    func toggleIsDone(_ item: ToDoItemEntity){
        DataManager.shared.updateToDoItem(item, item.title ?? "", item.dueDate ?? Date(), !item.isDone)
    }
}
