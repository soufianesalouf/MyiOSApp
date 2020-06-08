//
//  MyiOSAppAPI.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 06/08/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

enum MyiOSAppAPI: APIProtocol {
    case login
    case register
}

extension MyiOSAppAPI {
    
    var baseURL: URL {
        return URL(string: Constant.CONNECTION)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "login/"
        case .register:
            return "profile/"
        }
    }
}
