//
//  HomePageRouter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

class HomePageRouter: PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePageVC) {
        let presenter = HomePagePresenter()
        
        ref.homePagePresenterObject = presenter
        
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageView = ref
        
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
    }
}
