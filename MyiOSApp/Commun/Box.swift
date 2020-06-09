//
//  Box.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import Foundation

/// Binding class
class Box<T> {
    
    // MARK: - Properties
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: - Init
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Methods
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
