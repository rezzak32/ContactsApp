//
//  RegisterRouter.swift
//  ContactsApp
//
//  Created by Rezzak on 7.09.2023.
//

import Foundation

class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref: ContactsRegisterVC) {
        ref.registerPresenterObject = RegisterPresenter()
        ref.registerPresenterObject?.registerInteractor = RegisterInteractor()
    }
    
    
    
}
