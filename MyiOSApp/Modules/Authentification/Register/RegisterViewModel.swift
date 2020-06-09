//
//  RegisterViewModel.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

class RegisterViewModel {
    
    // MARK: - Properties
    
    var email: String? = ""
    var firstname: String? = ""
    var lastname: String? = ""
    var password: String? = ""
    
    // MARK: - Binging Properties
    
    var isEmailValid: Box<Bool> = Box(true)
    var isFirstNameValid: Box<Bool> = Box(true)
    var isLastNameValid: Box<Bool> = Box(true)
    var isPasswordValid: Box<Bool> = Box(true)
    
    // MARK: - Routing
    
    private var router: RegisterRouter.Routes?
    
    // MARK: - Init
    
    init(router: RegisterRouter.Routes) {
        self.router = router
    }
    
    // MARK: - Routing
    
    func close() {
        router?.close()
    }
}

// MARK: - Validation

extension RegisterViewModel {
    
    func isInputValid() -> Bool {
        
        isFirstNameValid.value = ValidationUtilities().isNameValid(firstname)
        isLastNameValid.value = ValidationUtilities().isNameValid(lastname)
        isEmailValid.value = ValidationUtilities().isEmailValid(email)
        isPasswordValid.value = ValidationUtilities().isPasswordValid(password)
        
        return isFirstNameValid.value && isLastNameValid.value && isEmailValid.value && isPasswordValid.value
    }
    
    func isValidNameCharachter(_ newString: String, newCharachter: String) -> Bool {
        return newString.count > appNameMaxLength || newCharachter.rangeOfCharacter(from: ValidationUtilities().appNameCharsNotAllowedSet) != nil
    }
}

// MARK: - Request

extension RegisterViewModel {

}
