//
//  LoginInteractorProtocol.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import Foundation
import Firebase

protocol LoginInteractorProtocol: class {
    func saveEmail(email: String, completion: @escaping(Result<AuthDataResult?,Error>) -> Void)
}
