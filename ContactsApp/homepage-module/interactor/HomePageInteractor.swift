//
//  HomePageInteractor.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation
import Firebase

class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    var refContacts = Database.database().reference().child("contacts")
    
    func takeContacts() {
        refContacts.observe(.value, with: { snapshot in
            var list = [Contacts]()
            
            if let incomingData = snapshot.value as? [String:AnyObject] {
                for row in incomingData {
                    if let d = row.value as? NSDictionary {
                        let id = row.key
                        let name = d["name"] as? String ?? ""
                        let phone = d["phone"] as? String ?? ""
                        
                        
                        
                        let contact = Contacts(id: id, name: name, phone: phone)
                        list.append(contact)
                    }
                }
                
            }
            self.homePagePresenter?.sendDataToPresenter(contactsList: list)
            
        })
        
        
        
    }
    
    func searchContacts(searchText: String) {
        refContacts.observe(.value, with: { snapshot in
            var list = [Contacts]()
            
            if let incomingData = snapshot.value as? [String:AnyObject] {
                for row in incomingData {
                    if let d = row.value as? NSDictionary {
                        let id = row.key
                        let name = d["name"] as? String ?? ""
                        let phone = d["phone"] as? String ?? ""
                        
                        if name.lowercased().contains(searchText.lowercased()) {
                            let contact = Contacts(id: id, name: name, phone: phone)
                            list.append(contact)
                        }
                        
                    }
                }
                
            }
            self.homePagePresenter?.sendDataToPresenter(contactsList: list)
            
        })
    }
    
    func deleteContacts(id: String) {
        refContacts.child(id).removeValue()
    }
    
    
}
