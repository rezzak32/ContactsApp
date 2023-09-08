//
//  DetailsProtocol.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
    var detailInteractor: PresenterToInteractorDetailProtocol? {get set}
    func update(id:String, name:String, phone:String)
}

protocol PresenterToInteractorDetailProtocol {
    
    func updateContact(id:String, name:String, phone:String)

    
}

protocol PresenterToRouterDetailProtocol {
    static func createModule(ref: ContactsDetailVC)
    
}



