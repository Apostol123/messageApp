//
//  LoginPhoneNumberValidationCellCollectionViewCell.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 04/06/2021.
//

import UIKit

class LoginPhoneNumberValidationCellCollectionViewCell: UICollectionViewCell {
    
    private lazy var phoneValidationView: LoginPhoneNumberValidationView = {
        let view = LoginPhoneNumberValidationView(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.contentView.addSubview(phoneValidationView)
        self.phoneValidationView.translatesAutoresizingMaskIntoConstraints = false
        self.phoneValidationView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.phoneValidationView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.phoneValidationView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.phoneValidationView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
