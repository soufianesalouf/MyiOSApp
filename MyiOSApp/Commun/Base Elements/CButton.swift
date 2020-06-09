//
//  CButton.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/9/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import UIKit

// MARK: - Private Constants

private let buttonCornerRadius: CGFloat = 12.0
private let buttonPrimaryStyleBorderWidth: CGFloat = 0.0
private let buttonSecondaryStyleBorderWidth: CGFloat = 2.0
private let buttonTextImageSpacing: CGFloat = 10.0
private var gradientLayer: CAGradientLayer!

// MARK: - Custom Button Styles

enum ButtonStyle: Int {
    case primary = 0
    case secondary = 1
    case tertiary = 2
    case custom = 3
}

class CButton: UIButton {
    
    // MARK: - Inits
    
    /// For programmatically created buttons
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    /// For Storyboard/.xib created buttons
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic
        refreshStyle(value: style)
    }
    
    // MARK: - IBInspectable Style Prperty
    
    var style: ButtonStyle = .tertiary {
        didSet {
            refreshStyle(value: self.style)
        }
    }
    
    func refreshStyle(value: ButtonStyle) {
        
        setCommonStyle()
        
        switch value {
        case .primary:
            setPrimaryStyle()
        case .secondary:
            setSecondaryStyle()
        case .tertiary:
            setTernaryStyle()
        case .custom:
            setCustomStyle()
        }
    }
    
    // MARK: - Customization Methods
    
    private func setCommonStyle() {
        layer.cornerRadius = buttonCornerRadius
        layer.masksToBounds = true
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func setPrimaryStyle() {
        
        DispatchQueue.main.async {
            self.applyGradient(colours: [lightPrimaryColor, darkPrimaryColor])
            self.layer.borderWidth = buttonPrimaryStyleBorderWidth
            self.layer.borderColor = UIColor.clear.cgColor
            self.setTitleColor(.white, for: .normal)
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    private func setSecondaryStyle() {
        
        DispatchQueue.main.async {
            self.backgroundColor = .clear
            self.layer.borderWidth = buttonSecondaryStyleBorderWidth
            self.layer.borderColor = UIColor.blue.cgColor
            self.setTitleColor(.blue, for: .normal)
        }
    }
    
    private func setTernaryStyle() {
        
        DispatchQueue.main.async {
            self.backgroundColor = .clear
            self.setTitleColor(lightPrimaryColor, for: .normal)
        }
    }
    
    private func setCustomStyle() {
        
        DispatchQueue.main.async {
            self.backgroundColor = .white
            self.layer.borderWidth = buttonSecondaryStyleBorderWidth
            self.layer.borderColor = UIColor.clear.cgColor
            self.setTitleColor(.blue, for: .normal)
        }
    }
}

