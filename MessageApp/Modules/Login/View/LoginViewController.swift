//
//  LoginViewController.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 01/06/2021.
//

import UIKit

class LoginViewController: UIViewController {
    let presenter: LoginViewControllerPresenter
    private let sectionInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    lazy var collectionViewContainer: UIView = {
        let view = UIView(frame: .zero)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        return view
    }()
    
    lazy var  button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Validate", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: "loginView")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.size.width, height: 140)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.theme(identifier: .messageAppDefaultPurple)
        self.setUpLayout()
    }
    
    private func setUpLayout() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setUpCollectionViewContainerLayout()
        setUpButtonLayout()
    }
    
    private func setUpButtonLayout() {
        self.view.addSubview(button)
        let guide = view.safeAreaLayoutGuide
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        button.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    }
    
    private func setUpCollectionViewContainerLayout() {
        self.view.addSubview(collectionViewContainer)
        let guide = view.safeAreaLayoutGuide
        self.collectionViewContainer.translatesAutoresizingMaskIntoConstraints = false
        self.collectionViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        self.collectionViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        self.collectionViewContainer.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16).isActive = true
        self.collectionViewContainer.heightAnchor.constraint(equalToConstant: 140).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    init(presenter: LoginViewControllerPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapButton() {
        self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .right, animated: true)
        self.collectionView.isScrollEnabled = false
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
}

extension LoginViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loginView", for: indexPath) as! LoginCell
        if indexPath.row == 1 {
            cell.loginView.textField.placeholder = "Enter Validation Code: "
        }
        return cell
    }
}

