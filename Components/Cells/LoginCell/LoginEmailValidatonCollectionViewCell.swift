//
//  LoginCell.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 03/06/2021.
//

import UIKit

protocol LoginEmailValidatonCollectionViewCellDelegate {
    func getValidationCode() -> String
}

class LoginEmailValidatonCollectionViewCell: UICollectionViewCell {
    
    lazy var loginView: LoginEmailValidationView = {
        let view = LoginEmailValidationView(frame: self.contentView.frame)
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    deinit {
        print("\(self.description) is deiniting")
    }
    
    private func commonInit() {
        self.contentView.addSubview(loginView)
        self.loginView.translatesAutoresizingMaskIntoConstraints = false
        self.loginView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.loginView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.loginView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.loginView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
