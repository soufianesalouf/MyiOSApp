//
//  RootViewController.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController {
    
    // MARK: - Views
    
    @IBOutlet weak var loginButton: CButton!
    @IBOutlet weak var registerButton: CButton!
    
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Actions
    
    @IBAction func onLogin(_ sender: Any) {
        
    }
    
    @IBAction func onRegister(_ sender: Any) {
        viewModel.onpenRegister()
    }
    
    // MARK: - Actions
    
    func setupUI() {
        loginButton.style = .primary
        registerButton.style = .primary
    }
}
