//
//  AppCoordinator.swift
//  MessageApp
//
//  Created by Apostol, Alexandru on 27/05/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    private enum AppCoordinatorState {
        case initial
        case willshowLoginFlow
        case didShowLoginFlow
        case willShowContactLists
    }
    
    let navigationController: UINavigationController
    private var state: AppCoordinatorState
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        let hasEmailCredentials = UserDefaults.standard.bool(forKey: "hasEmailCredentials")
        self.state = hasEmailCredentials ? .willShowContactLists : .initial
    }
    
    func start() {
        self.loop()
    }
    
    private func loop() {
        self.state = next(self.state)
        switch state {
        case .willshowLoginFlow:
            self.goToLoginFlow()
        case .willShowContactLists:
            self.goToContactsListFlow()
        case .didShowLoginFlow, .initial:
            fatalError("Unexpeted case in App Coordinator")
        }
    }

    
    private func next(_ nextState: AppCoordinatorState) -> AppCoordinatorState {
        switch nextState {
        case .initial:
            return .willshowLoginFlow
        case .didShowLoginFlow:
            return .willShowContactLists
        case .willShowContactLists ,  .willshowLoginFlow:
            return nextState
        }
    }
    
    private func goToLoginFlow() {
        let vc = LoginBuilder(output: { [weak self] output in
            switch output {
            case .goToMainView:
                self?.state = .didShowLoginFlow
                self?.loop()
            }
        }).build()
        self.navigationController.setViewControllers([vc], animated: false)
    }
    
    private func goToContactsListFlow() {
        let vc = MainMenuBuilder().build()
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
