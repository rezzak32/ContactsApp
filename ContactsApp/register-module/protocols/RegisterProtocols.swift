//
//  RegisterProtocols.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

protocol ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol? {get set}
    func add(name:String, phone:String)
}

protocol PresenterToInteractorRegisterProtocol {
    
    func addContact(name:String, phone:String)

    
}

protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref: ContactsRegisterVC)
    
}
