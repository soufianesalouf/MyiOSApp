//
//  UIStoryboard+Loader.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

// MARK: - Storyboards

enum Storyboard : String {
    case authentification = "Authentification"
    case home = "Home"
}

// MARK: - Loader Methods

extension UIStoryboard {
    
    /// Load a View Controller from a specific Storyboard
    ///
    /// - Parameters:
    ///   - storyboard: Storyboard
    ///   - viewController: View Controller Type to load
    /// - Returns: View Controller
    static func load(from storyboard: Storyboard, viewController: UIViewController.Type) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: String(describing: viewController.self))
    }
}
