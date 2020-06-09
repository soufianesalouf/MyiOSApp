//
//  i18n+Authentication.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/9/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

extension i18n {
    
    // MARK: - AARP
    
    struct Authenticaion {
        
        // MARK: - Private Init
        
        private init() {}
        
        // MARK: - Register
        
        static var title: String { return "authentication.title".localized}
        static var message: String { return "authentication.message".localized}
    }
}
