//
//  RegisterRoute.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

protocol RegisterRoute {
    
    var customTransition: Transition { get }
    func openRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    var customTransition: Transition {
        return ModalTransition()
    }
    
    func openRegister() {
        
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController.instantiate(viewModel: viewModel)
        router.viewController = viewController
        
        // Wrap within navigation controller
        let navigationController = BaseNavigationController(rootViewController: viewController)

        let transition = customTransition
        router.openTransition = transition
        open(navigationController, transition: transition)
    }
}
