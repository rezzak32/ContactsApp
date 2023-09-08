//
//  HomePagePresenter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol {
    
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    func uploadContacts() {
        homePageInteractor?.takeContacts()
    }
    
    func search(searchText: String) {
        homePageInteractor?.searchContacts(searchText: searchText)
    }
    
    func delete(id: String) {
        homePageInteractor?.deleteContacts(id: id)
    }
    
    
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(contactsList: Array<Contacts>) {
        homePageView?.sendDataToView(contactsList: contactsList)
    }
}
