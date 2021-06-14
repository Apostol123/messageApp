//
//  MainMenuBuilder.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import UIKit

class MainMenuBuilder: Builder {
    
    func build() -> UIViewController {
        let dataManager = MainMenuDataManager()
        let interactor = MainMenuInteractor(dataManager: dataManager)
        let presenter = MainMenuPresenter(interactor: interactor)
        let view = MainMenuViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
