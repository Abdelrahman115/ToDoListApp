//
//  ToDoListViewViewModel.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import Foundation
import FirebaseFirestore

/// ViewModel for list of items view
/// Primary tab
class ToDoListViewViewModel:ObservableObject{
    @Published var isShowingNewItemView = false
    init(){}
    
    
    func deleteItem(id:String,userId:String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
