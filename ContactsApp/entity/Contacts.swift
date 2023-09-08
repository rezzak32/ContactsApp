//
//  Contacts.swift
//  ContactsApp
//
//  Created by Rezzak on 6.09.2023.
//

import Foundation

class Contacts {
    var id: String?
    var name: String?
    var phone: String?
    
    init(id:String,name:String,phone:String) {
        self.id = id
        self.name = name
        self.phone = phone
    }
}
