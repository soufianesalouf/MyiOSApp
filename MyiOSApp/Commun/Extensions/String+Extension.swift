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
    
    // MARK: - Check for charachters
    
    /// Ceck if a string conatins an upper case charachter
    ///
    /// - Returns: Bool
    func containsUpperCase() -> Bool {
        if let _ = self.first(where: { $0.isUppercase }) {
            return true
        }
        
        return false
    }
    
    /// Ceck if a string conatins a lower case charachter
    ///
    /// - Returns: Bool
    func containsLowerCase() -> Bool {
        if let _ = self.first(where: { $0.isLowercase }) {
            return true
        }
        
        return false
    }
    
    /// Ceck if a string conatins a digit charachter
    ///
    /// - Returns: Bool
    func containsDigit() -> Bool {
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        return texttest1.evaluate(with: self)
    }
    
    /// Ceck if a string conatins a special charachter: .*[!&^%$#@()/]+.*
    ///
    /// - Returns: Bool
    func containsSpecialCharachter() -> Bool {
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        return texttest2.evaluate(with: self)
    }
}
