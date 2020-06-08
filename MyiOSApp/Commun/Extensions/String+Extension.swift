//
//  String+Extension.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 6/8/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Computed properties
    
    /// Localize a string
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
