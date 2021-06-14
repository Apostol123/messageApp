//
//  MainMenuViewController.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 14/06/2021.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var presenter: MainMenuPresenterProtocol
    
    init(presenter: MainMenuPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension MainMenuViewController: MainMenuViewProtocol {
    
}
