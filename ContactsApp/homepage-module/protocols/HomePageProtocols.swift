//
//  HomePageProtocols.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var homePageInteractor: PresenterToInteractorHomePageProtocol? {get set}
    var homePageView: PresenterToViewHomePageProtocol? {get set}
    func uploadContacts()
    func search(searchText:String)
    func delete(id:String)
}
protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter: InteractorToPresenterHomePageProtocol? { get set  }
    
    func takeContacts()
    func searchContacts(searchText:String)
    func deleteContacts(id:String)
}
protocol InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(contactsList:Array<Contacts>)
}
protocol PresenterToViewHomePageProtocol {
    func sendDataToView(contactsList:Array<Contacts>)

}

protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref:HomePageVC)
}
