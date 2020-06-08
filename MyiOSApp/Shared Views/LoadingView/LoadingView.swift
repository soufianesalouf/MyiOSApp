//
//  LoadingView.swift
//  Cidel
//
//  Created by Soufiane Salouf on 9/23/19.
//  Copyright © 2019 Soufiane SALOUF. All rights reserved.
//

import UIKit

enum AnimationType {
    case progress
    case success
}

class LoadingView: UIView {
    
    // MARK: - Views
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var successMark: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var titleLbl: UILabel!

    // MARK: - Properties

    var titleLoader: String?
    var animationType: AnimationType = .progress
    var loaderStopAnimationTimer:Timer?
    
    // MARK: - Inits
    
    /// For Storyboard/.xib created the spinner
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// For programmatically created the spinner
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
   
    // MARK: - Life cycle
    
    override func didMoveToSuperview() {
        setupLocalization()
    }
    
    // MARK: - Local helper
    

    func startAnimation(type: AnimationType = .progress, withTitle title: String = "") {

        // set a timer to automatically dismiss the loader
        loaderStopAnimationTimer = Timer.scheduledTimer(timeInterval: Constant.TIMEOUT_SECONDS, target: self, selector: #selector(stopAnimation), userInfo: nil, repeats: false)

        // Create Loader Animation

        switch type {
        case .progress:
            titleLbl.text = title
            spinner.isHidden = false
            successMark.isHidden = true
            spinner.startAnimating()
        case .success:
            //TODO: Show a check mark for success
            spinner.isHidden = true
            successMark.isHidden = false
            
        }
    }

    func stopLoaderAnimation(withTitle title: String) {

        if !title.isEmpty {
            titleLbl.text = title
            startAnimation(type: .success)
            perform(#selector(stopAnimation), with: nil, afterDelay: 1.5)
        } else {
            stopAnimation()
        }
    }

    private func setupLocalization() {
        titleLbl.text = titleLoader ?? ""
    }

    @objc private func stopAnimation() {
        spinner.stopAnimating()
        self.removeFromSuperview()
        loaderStopAnimationTimer?.invalidate()
    }
}

