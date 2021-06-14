//
//  MainMenuInteractor.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import Foundation

class MainMenuInteractor: MainMenuInteractorProtocol {
    var dataManager: MainMenuDataManagerProtocol
    
    init(dataManager: MainMenuDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
