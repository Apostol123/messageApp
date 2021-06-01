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
        self.state = .initial
    }
    
    func start() {
        self.loop()
    }
    
    private func loop() {
        self.state = next(self.state)
        switch state {
        case .willshowLoginFlow:
            self.goToLoginFlow()
        case .didShowLoginFlow:
            self.goToContactsListFlow()
        case .willShowContactLists ,.initial:
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
    let vc = LoginBuilder().build()
    self.navigationController.setViewControllers([vc], animated: false)
    }
    
    private func goToContactsListFlow() {
        
    }
    
}
