//
//  LoginPhoneNumberValidationView.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 04/06/2021.
//

import UIKit

class LoginPhoneNumberValidationView: UIView {
    
    lazy private var validationTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 16.0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.tag = 1
        return textField
    }()
    
    lazy private var validationTextField1: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 16.0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.tag = 2
        return textField
    }()
    
    lazy private var validationTextField2: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 16.0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.tag = 3
        return textField
    }()
    
    lazy private var validationTextField3: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 16.0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.tag = 4
        return textField
    }()
    
    lazy private var validationTextField4: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 16.0))
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .center
        textField.tag = 5
        return textField
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [validationTextField, validationTextField1, validationTextField2, validationTextField3, validationTextField4])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        self.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0).isActive = true
        mainStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        setUpTextFields()
    }
    
    private func setUpTextFields() {
        validationTextField.delegate = self
        validationTextField1.delegate = self
        validationTextField2.delegate = self
        validationTextField3.delegate = self
        validationTextField4.delegate = self
        
        validationTextField.addTarget(self, action: #selector(jumpToNextTextField(sender:)), for: .editingChanged)
        validationTextField1.addTarget(self, action: #selector(jumpToNextTextField(sender:)), for: .editingChanged)
        validationTextField2.addTarget(self, action: #selector(jumpToNextTextField(sender:)), for: .editingChanged)
        validationTextField3.addTarget(self, action: #selector(jumpToNextTextField(sender:)), for: .editingChanged)
        validationTextField4.addTarget(self, action: #selector(jumpToNextTextField(sender:)), for: .editingChanged)
    }
    
    @objc  private func jumpToNextTextField(sender: UITextField) {
        let tag = sender.tag + 1
        if let text = sender.text {
            if text.count > 0 {
                if  let nextTextField = mainStackView.arrangedSubviews.first(where: {$0.tag == tag}) {
                    nextTextField.becomeFirstResponder()
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LoginPhoneNumberValidationView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            let maxLength = 1
            let currentString: NSString = (textField.text ?? "") as NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else
            { return false }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
