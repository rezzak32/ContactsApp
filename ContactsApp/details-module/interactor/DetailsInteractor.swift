//
//  DetailsInteractor.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation
import Firebase

class DetailsInteractor: PresenterToInteractorDetailProtocol {
    var refContacts = Database.database().reference().child("contacts")

    func updateContact(id: String, name: String, phone: String) {
        let updatedContact = ["name":name , "phone":phone]
        refContacts.child(id).updateChildValues(updatedContact)
        
    }
    
    
}
