//
//  ProfileViewViewModel.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProfileViewViewModel:ObservableObject{
    init(){}
    
    @Published var currentUser:user? = nil
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data  = snapshot?.data() else {return}
            DispatchQueue.main.async {
                self?.currentUser = user(id: data["id"] as? String ?? "", name: data["name"] as? String ?? "", email: data["email"] as? String ?? "", joined: data["joined"] as? TimeInterval ?? 0)
                
            }
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
    
}
