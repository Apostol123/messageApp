//
//  MainMenuDataManager.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import Contacts

class MainMenuDataManager: MainMenuDataManagerProtocol {
    
    var contactStore = CNContactStore()
    func askForContactsPermission(completion: @escaping (Result<Bool, Error>) -> Void) {
        contactStore.requestAccess(for: .contacts) { (accesGranted, error) in
            if let error = error {
                completion(.failure(error))
                
            } else {
                completion(.success(accesGranted))
            }
        }
    }
    
    func getAllContacts(completion: @escaping (Result<[CNContact], Error>) -> Void) {
        contactStore.containers(matching: NSPredicate(format: "emailAddresses.count > 0"))
    }
}
