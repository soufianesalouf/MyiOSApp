//
//  UINib+Loader.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 20-06-08.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import UIKit

// MARK: - Loader Methods

extension UINib {
    
    /// Load Nib with name
    ///
    /// - Parameter nibName: Nib name
    /// - Returns: UINib
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    /// Load Nib with name and attach it to owner
    ///
    /// - Parameters:
    ///   - nibName: Nib name
    ///   - owner: Owner
    /// - Returns: UINib
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}
