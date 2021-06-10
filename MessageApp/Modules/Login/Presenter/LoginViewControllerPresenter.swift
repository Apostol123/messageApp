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
    let output: ((LoginViewOutput) -> Void)
    
    init(interactor: LoginInteractor, output: @escaping ((LoginViewOutput) -> Void)) {
        self.interactor = interactor
        self.output = output
    }
    
    func saveEmail(email: String) {
        interactor.saveEmail(email: email) { [weak self] (result) in
            switch result {
            case .success(_):
                self?.output(.goToMainView)
            case .failure(let error):
                self?.view?.showError(text: error.localizedDescription, title: "Email Error", actionTitle: "OK", handler: nil)
            }
        }
    }
    
    func verifyPhoneNumber(phoneNumber: String) {
        interactor.verifyPhoneNumber(phoneNumber: phoneNumber) {  result in
            switch result {
            case .success( let verificationId):
               break
            case .failure(let error):
                print("phone number is not correct \(error) ")
            }
        }
    }
}
