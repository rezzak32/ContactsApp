//
//  RegisterPresenter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation


class RegisterPresenter: ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    
    func add(name: String, phone: String) {
        registerInteractor?.addContact(name: name, phone: phone)
    }
    
    
}
