//
//  DetailsPresenter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

class DetailsPresenter:ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol?
    
    func update(id: String, name: String, phone: String) {
        detailInteractor?.updateContact(id: id, name: name, phone: phone)
    }
    
    
}
