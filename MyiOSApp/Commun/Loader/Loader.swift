//
//  Loader.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import UIKit

protocol LoaderProtocol {
    func show(onView view: UIView?, withTitle title: String)
    func hide(onView view: UIView?, withTitle title: String)
}

class Loader : LoaderProtocol {
    
    // MARK: - Properties
    
    static let shared = Loader()
    private let spinner: LoadingView
    
    // MARK: - Init
    
    private init() {
        spinner =  Bundle.main.loadNibNamed("LoadingView", owner: LoadingView.self, options: nil)?.first as! LoadingView
    }
    
    /// SHow Loader
    ///
    /// - Parameters:
    ///   - onView: indicate the superView
    ///   - title: Title to show under spinner (empty if you don't want to show any title)
    func show(onView view: UIView? = nil, withTitle title: String) {
        let view: UIView = view ?? UIApplication.shared.keyWindow!
        if  !view.subviews.contains(spinner) {
            view.addSubview(spinner)
            spinner.frame.origin = CGPoint.zero
            spinner.frame.size = view.frame.size
            spinner.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
            spinner.startAnimation(withTitle: title)
        }
    }
    
    /// Hide Loader
    ///
    /// - Parameters:
    ///   - onView: indicate the superView
    ///   - title: Title to show under the check mark before hiding (empty title mean no check mark just hide)
    func hide(onView view: UIView? = nil, withTitle title: String) {
        DispatchQueue.main.async {
            let view: UIView = view ?? UIApplication.shared.keyWindow!
            if  view.subviews.contains(self.spinner) {
                self.spinner.stopLoaderAnimation(withTitle: title)
            }
        }
    }
}
