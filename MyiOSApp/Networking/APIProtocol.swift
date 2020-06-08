//
//  APIProtocol.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 06/08/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

protocol APIProtocol {
    var baseURL: URL { get }
    var path: String { get }
}
