//
//  LoginViewController.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginViewControllerPresenter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    init(presenter: LoginViewControllerPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
}
