//
//  RootViewController.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var router: RootRouter.Routes?
    private var viewModel: RootViewModel!
    
    // MARK: - Init
    
    static func instantiate(router: RootRouter.Routes) -> RootViewController {
        
        let viewController = RootViewController(nibName: String(describing: self), bundle: nil)
        viewController.router = router
        viewController.viewModel = RootViewModel(router: router)
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Open Handling Flows
        self.perform(#selector(handlingFlows), with: nil, afterDelay: 0.5)
    }
    
    @objc func handlingFlows() {
        viewModel.handlingFlows()
    }
}
