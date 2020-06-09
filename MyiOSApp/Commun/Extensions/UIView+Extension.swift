//
//  UIView+Extension.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/9/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import UIKit

// MARK: - Blur

let defaultBlurStyle = UIBlurEffect.Style.dark
let animationDuration: Double = 0.3

extension UIView {
    
    func applyGradient(colours: [UIColor]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = [0.0, 1.0]
        self.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
    }
    
    /// Add shadow to the view
    ///
    /// - Parameters:
    ///   - offset: The offset (in points) of the layer’s shadow.
    ///   - color: The color of the layer’s shadow.
    ///   - radius: The blur radius (in points) used to render the layer’s shadow.
    ///   - opacity: The opacity of the layer’s shadow.
    func dropShadow(offset: CGSize = CGSize.init(width: 0, height: 2.5) , color: UIColor = .black, radius: CGFloat = 2.0, opacity: Float = 0.3) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
    
    /// Add a blur layer to the current view
    func addBlur() -> UIView {
        let blurEffect = UIBlurEffect(style: defaultBlurStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
        return blurEffectView
    }
    
    /// Remobe all blured layers from current view
    func removeBlur() {
        for subview in self.subviews {
            if subview is UIVisualEffectView {
                subview.removeFromSuperview()
            }
        }
    }
}
