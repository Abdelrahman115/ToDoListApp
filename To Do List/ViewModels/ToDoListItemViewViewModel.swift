//
//  ToDoListItemView.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// ViewModel for a single task(each row in item list)
/// 
class ToDoListItemViewViewModel:ObservableObject{
    init(){}
    
    
    func toggleIsDone(item:ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
    
}
