//
//  User.swift
//  To Do List
//
//  Created by Abdelrahman on 04/06/2023.
//

import Foundation

struct user:Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
