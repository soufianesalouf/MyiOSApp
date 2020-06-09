//
//  CTextField.swift
//  MyiOSApp
//
//  Created by soufiane salouf on 5/16/20.
//  Copyright © 2020 Soufiane salouf. All rights reserved.
//

import UIKit

enum CTextFieldType {
    case phone
    case password
    case email
    case name
    case birthday
}

class CTextField: UIView, UITextFieldDelegate {
    
    // MARK: - Constants
    
    struct Constants {
        static let phoneImageIconName = "ic_calendar"
        static let passwordImageIconName = "ic_lock"
        static let emailImageIconName = "ic_email"
        static let nameImageIconName = "ic_user"
        static let birthdayImageIconName = "ic_calendar"
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewContainer: RoundedView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imgTextFieldIcon: UIImageView!
    @IBOutlet weak var btnPhone: UIButton!

    @IBOutlet var delegate: UITextFieldDelegate? {
        set {
            self.textField.delegate = newValue
        }
        get {
            return self.textField.delegate
        }
    }
    
    // MARK: - Properties
    
    let datePicker = UIDatePicker()
    var doneClicked: ((Bool) -> Void)?
    var type: CTextFieldType = .password {
        didSet {
            switch type {
            case .phone:
                self.btnPhone.isHidden = false
                self.imgTextFieldIcon.isHidden = true
                self.textField.keyboardType = .numberPad
            case .password:
                self.textField.isSecureTextEntry = true
                self.imgTextFieldIcon.image = UIImage(named: Constants.passwordImageIconName)
            case .email:
                self.textField.keyboardType = .emailAddress
                self.imgTextFieldIcon.image = UIImage(named: Constants.emailImageIconName)
            case .name:
                self.imgTextFieldIcon.image = UIImage(named: Constants.nameImageIconName)
            case .birthday:
                self.imgTextFieldIcon.image = UIImage(named: Constants.birthdayImageIconName)
                
                // Setup PickerView
                self.setupDatePicker(textField: textField)
            }
            self.textField.autocorrectionType = .no
            self.imgTextFieldIcon.image?.withTintColor(.black)
        }
    }
    
    @IBInspectable var text: String {
        set {
            self.textField.text = newValue
        }
        get {
            return self.textField.text ?? ""
        }
    }
    
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
        let nib = UINib(nibName: "CTextField", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    // MARK: - Methodes
    
    private func setupDatePicker(textField: UITextField) {
        
        // Setup Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Setup BarButton
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spacer, doneBtn], animated: true)
        toolbar.sizeToFit()
        
        // Assign Toolbar
        textField.inputAccessoryView = toolbar
        
        // Setup PickerView
        textField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc private func donePressed() {
        
        let dateFormatter = DateFormatter()
        
        textField.text = "\(dateFormatter.string(from: datePicker.date))"
        self.endEditing(true)
        doneClicked?(true)
    }
    
    func setPlaceholder(withMessage message: String) {
        self.textField.attributedPlaceholder = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    // MARK: Actions
    
    @IBAction func onNumber(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "countriesList"), object: nil)
    }
}
