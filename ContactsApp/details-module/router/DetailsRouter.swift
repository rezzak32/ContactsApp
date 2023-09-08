//
//  DetailsRouter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

class DetailsRouter: PresenterToRouterDetailProtocol {
    static func createModule(ref: ContactsDetailVC) {
        ref.detailPresenterObject = DetailsPresenter()
        ref.detailPresenterObject?.detailInteractor = DetailsInteractor()
    }
    
    
}
