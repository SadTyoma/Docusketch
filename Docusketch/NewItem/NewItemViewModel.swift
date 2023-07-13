//
//  NewItemViewModel.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import Foundation

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    func save(){
        DataManager.shared.saveToDoItem(title, dueDate)
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard dueDate >= Date().getDateFor(days: -1)! else { return false }
        
        return true
    }
}
