//
//  LoginView.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 03/06/2021.
//

import UIKit

class LoginView: UIView {
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Email: "
        textField.textAlignment = .center
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: self.topAnchor,constant: 16).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
