//
//  RootViewModel.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 20-06-08.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation

class RootViewModel {
    
    // MARK: - Properties
    
    var router: RootRouter.Routes?
    
    // MARK: - Init
    
    init(router: RootRouter.Routes) {
        self.router = router
    }
    
    // MARK: Routes
    
    func handlingFlows() {
        // TODO: handle flows here
    }
}
