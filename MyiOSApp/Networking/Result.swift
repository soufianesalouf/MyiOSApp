//
//  Result.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 06/08/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    case failure(Error)
}
