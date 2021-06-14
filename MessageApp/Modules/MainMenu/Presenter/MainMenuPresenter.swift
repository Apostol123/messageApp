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
}
