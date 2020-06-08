//
//  Animator.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}
