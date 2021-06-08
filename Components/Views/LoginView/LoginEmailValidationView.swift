//
//  LoginView.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 03/06/2021.
//

import UIKit

class LoginEmailValidationView: UIView {
    lazy private var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.textColor = .black
        textField.textAlignment = .center
        return textField
    }()
    
    weak public var delegate: LoginEmailValidatonCollectionViewCellDelegate?
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        textField.topAnchor.constraint(equalTo: self.topAnchor,constant: 0).isActive = true
        textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginEmailValidationView: LoginEmailValidatonCollectionViewCellDelegate {
    func getValidationCode() -> String? {
        return self.textField.text
    }
}
