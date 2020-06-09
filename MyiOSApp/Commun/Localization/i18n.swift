//
//  i18n.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 6/8/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

struct i18n {
    
    // MARK: - Private Init
    
    private init() {}
    
    // MARK: - Commun
    
    static var appName: String { return "appName".localized }
    
    // MARK: - TextFields Placeholders
    
    static var placeholderFirstName: String { return "placeholder.firstName".localized }
    static var placeholderLastName: String { return "placeholder.lastName".localized }
    static var placeholderEmail: String { return "placeholder.email".localized }
    static var placeholderPassword: String { return "placeholder.password".localized }
}
