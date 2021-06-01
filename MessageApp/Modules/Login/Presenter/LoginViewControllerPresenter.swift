//
//  LoginViewControllerPresenter.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import Foundation

class LoginViewControllerPresenter: LoginViewControllerPresenterProtocol {
    weak var view: LoginViewControllerProtocol?
    var interactor: LoginInteractorProtocol
    
    init(interactor: LoginInteractor) {
        self.interactor = interactor
    }
}
