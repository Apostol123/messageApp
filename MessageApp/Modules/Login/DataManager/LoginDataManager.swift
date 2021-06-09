//
//  LoginDataManager.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import Foundation
import Firebase

class LoginDataManager: LoginDataManagerProtocol {

    func saveEmail(email: String ,result: @escaping(Result<AuthDataResult?,Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: "defaultPassword") { (authResult, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            result(.success(authResult))
        }
    }
    
    func verifyPhoneNumber(phoneNumber: String, completion: @escaping (Result<String?, Error>) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verifcationID, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(verifcationID))
        }
    }
}
