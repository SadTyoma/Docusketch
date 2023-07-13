//
//  NewItemView.swift
//  Docusketch
//
//  Created by Artem Shuneyko on 12.07.23.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @StateObject var viewModel = NewItemViewModel()
    @Binding var showView: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .padding()
                .font(.title2)
                .bold()
            
            Form{
                TextField("Title",text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                HStack{
                    Spacer()
                    Button("Save") {
                        if viewModel.canSave{
                            viewModel.save()
                            showView = false
                        } else{
                            viewModel.showAlert = true
                        }
                    }
                    Spacer()
                }
            }
        }
        .alert("Please fill title field and select due date that is today or newer.", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(showView: .constant(true))
    }
}
