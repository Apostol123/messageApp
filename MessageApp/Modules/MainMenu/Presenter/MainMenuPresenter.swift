//
//  MainMenuPresenter.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import Foundation

class MainMenuPresenter: MainMenuPresenterProtocol {
    weak var view: MainMenuViewProtocol?
    var interactor: MainMenuInteractorProtocol
    
    init(interactor: MainMenuInteractorProtocol) {
        self.interactor = interactor
    }
    
    func askForContactPermision() {
        interactor.askForContactsPermission { (result) in
            switch result {
            case .success(let accesValue):
                if accesValue {
                    
                }
            case .failure(let error):
                self.view?.showError(text: error.localizedDescription, title: "There was a error in getting your contacts", actionTitle: "OK", handler: nil)
            }
        }
    }
}
