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
    
    func askForContactsPermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        dataManager.askForContactsPermission { (result) in
            switch result {
            case .success(let accessValue):
                completion(.success(accessValue))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
