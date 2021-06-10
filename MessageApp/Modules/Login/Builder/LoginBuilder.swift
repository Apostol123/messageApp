//
//  LoginBuilder.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import UIKit

class LoginBuilder: Builder {
    
    var output: ((LoginViewOutput) -> Void)
    
    init(output: @escaping ((LoginViewOutput) -> Void)) {
        self.output = output
    }
    
    func build() -> UIViewController {
        let dataManager = LoginDataManager()
        let interactor = LoginInteractor(dataManager: dataManager)
        let presenter = LoginViewControllerPresenter(interactor: interactor, output: self.output)
        let view = LoginViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
