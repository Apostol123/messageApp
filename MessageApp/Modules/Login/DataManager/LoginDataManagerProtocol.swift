//
//  LoginDataManagerProtocol.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import Foundation
import Firebase

protocol LoginDataManagerProtocol {
    func saveEmail(email: String ,result: @escaping(Result<AuthDataResult?,Error>) -> Void)
}
