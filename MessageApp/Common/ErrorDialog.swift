//
//  ErrorDialog.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 08/06/2021.
//

import UIKit


protocol ErrorDialog: class {
    func showError(text: String, title: String, actionTitle: String, handler: ((UIAlertAction) -> Void)?)
}

extension ErrorDialog where Self: UIViewController {
    func showError (text: String, title: String, actionTitle: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
