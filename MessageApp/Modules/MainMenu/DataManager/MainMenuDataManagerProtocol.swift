//
//  MainMenuDataManagerProtocol.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import Contacts

protocol  MainMenuDataManagerProtocol {
    func askForContactsPermission(completion: @escaping (Result<Bool,Error>) -> Void)
    func getAllContacts(completion: @escaping (Result<[CNContact], Error>) -> Void)
}
