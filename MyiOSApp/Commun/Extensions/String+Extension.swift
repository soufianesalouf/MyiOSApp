//
//  String+Extension.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

extension String {
    
    // MARK: - Computed properties
    
    /// Localize a string
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
