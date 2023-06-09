//
//  NewItemView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top,40)
            
            Form{
                //Title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TLButton(buttonTitle: "Save", background: Color.green) {
                    //save task
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error") ,message:Text("Please fill all fields and select date that is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _, _ in
            
        }))
    }
}
