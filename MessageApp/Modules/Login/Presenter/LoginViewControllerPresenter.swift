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
    
    func saveEmail(email: String) {
        interactor.saveEmail(email: email) { (result) in
            switch result {
            case .success(_):
                self.view?.goToNumberValidationScreen()
            case .failure(let error):
                self.view?.showError(text: error.localizedDescription, title: "Email Error", actionTitle: "OK", handler: nil)
            }
        }
    }
}
