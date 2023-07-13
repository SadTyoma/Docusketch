//
//  DataManager.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import Foundation
import CoreData

class DataManager: ObservableObject {
    
    static let shared = DataManager()
    let persistentContainer = NSPersistentContainer(name: "ToDoItemModel")
    
    private init() {
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
    }
        
    func deleteToDoItem(_ toDoItem: ToDoItemEntity) {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ToDoItemEntity> = ToDoItemEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", toDoItem.id?.uuidString ?? "")
        do {
            let items = try context.fetch(fetchRequest)
            if let item = items.first {
                context.delete(item)
                try context.save()
            }
        } catch let error as NSError {
            print("Error deleting item: \(error.localizedDescription)")
        }
    }
    
    func updateToDoItem(_ item: ToDoItemEntity,_ title: String,_ dueDate: Date, _ isDone: Bool){
        let context = persistentContainer.viewContext
        item.title = title
        item.dueDate = dueDate
        item.isDone = isDone
        
        do{
            try context.save()
        }catch{
            print("Error updating item: \(error.localizedDescription)")
        }
    }
    
    func saveToDoItem(_ title: String,_ dueDate: Date) {
        let context = persistentContainer.viewContext
        let item = ToDoItemEntity(context: context)
        item.id = UUID()
        item.creationDate = Date()
        item.title = title
        item.dueDate = dueDate
        item.isDone = false
        
        do{
            try context.save()
        }catch{
            print("Error saving item: \(error.localizedDescription)")
        }
    }
}
