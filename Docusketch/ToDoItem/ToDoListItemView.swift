//
//  ToDoListItemView.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    @ObservedObject var item: ToDoItemEntity
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title ?? "")
                    .bold()
                    .font(.title2)
                if let dueDate = item.dueDate {
                    Text("\(dueDate.formatted(date: .abbreviated, time: .shortened))")
                        .font(.title3)
                }
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoItemEntity())
    }
}
