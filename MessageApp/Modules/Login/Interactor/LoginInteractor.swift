//
//  LoginInteractor.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import Foundation
import Firebase

class LoginInteractor: LoginInteractorProtocol {
    var dataManager: LoginDataManagerProtocol
    
    init(dataManager: LoginDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func saveEmail(email: String, completion: @escaping (Result<AuthDataResult?, Error>) -> Void) {
        dataManager.saveEmail(email: email) { (result) in
            switch result {
            case .success(let dataResult):
                completion(.success(dataResult))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
