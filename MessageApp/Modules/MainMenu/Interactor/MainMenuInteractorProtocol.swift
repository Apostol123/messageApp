//
//  MainMenuInteractorProtocol.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import Foundation

protocol MainMenuInteractorProtocol {
    func askForContactsPermission(completion: @escaping (Result<Bool,Error>) -> Void) 
}
