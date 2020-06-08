//
//  Transition.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

protocol Transition: class {
    var viewController: UIViewController? { get set }
    
    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
