//
//  ValidationUtilities.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

struct ValidationUtilities {
    
    /// Create character set for allowed characters to be used for names, all letters plus (" ", "-", "'" and ".")
    var appNameCharsNotAllowedSet: CharacterSet = {
        
        let appNameCharsAllowedSet = NSMutableCharacterSet.letter()
        appNameCharsAllowedSet.addCharacters(in: " -'.")
        return appNameCharsAllowedSet.inverted
    }()
    
    /// Check if the user password is valid or not
    ///
    /// - Parameter password: The user password
    /// - Returns: True if the password is valid
    func isPasswordValid(_ password: String?) -> Bool {
        
        guard let password = password else { return false }
        
        return password.count >= appPasswordMinLength &&
            password.count <= appPasswordMaxLength &&
            password.containsUpperCase() &&
            password.containsLowerCase() &&
            (password.containsDigit() || password.containsSpecialCharachter())
    }
    
    /// Chech if user name is valid or not
    ///
    /// - Parameter name: user name
    /// - Returns: false is it's empty
    func isNameValid(_ name: String?) -> Bool {
        
        guard let name = name else { return false }
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return  trimmedName.isEmpty ? false : true
    }
    
    /// Funtion to determine if a given string is a valid email address.
    ///
    /// - Returns: True if valid email
    func isEmailValid(_ email: String?) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let matchPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return matchPredicate.evaluate(with: email) == true ? true : false
    }
}
