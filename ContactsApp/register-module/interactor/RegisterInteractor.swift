//
//  RegisterInteractor.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation
import Firebase

class RegisterInteractor: PresenterToInteractorRegisterProtocol {
    var refContacts = Database.database().reference().child("contacts")

    func addContact(name: String, phone: String) {
        let newContact = ["id":"", "name":name , "phone":phone]
        refContacts.childByAutoId().setValue(newContact)
    }
    
    
}
