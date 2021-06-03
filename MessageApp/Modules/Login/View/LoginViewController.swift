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
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: "loginView")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var collectionViewLayout: UICollectionViewFlowLayout = {
       var layout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
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
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
}

extension LoginViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loginView", for: indexPath) as! LoginCell
        return cell
    }
}

