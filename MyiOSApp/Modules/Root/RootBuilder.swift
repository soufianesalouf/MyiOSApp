//
//  RootBuilder.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 20-06-08.
//  Copyright © 2020 IBM. All rights reserved.
//

import Foundation
import UIKit

final class RootBuilder {
    
    static func viewController() -> UIViewController {
        
        let router = RootRouter()
        let viewController = RootViewController.instantiate(router: router)
        router.viewController = viewController
        return viewController
    }
}
