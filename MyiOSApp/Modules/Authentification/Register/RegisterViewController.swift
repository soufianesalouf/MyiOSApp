//
//  RegisterViewController.swift
//  MyiOSApp
//
//  Created by Soufiane Salouf on 6/8/20.
//  Copyright © 2020 Soufiane Salouf. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {
    
    // MARK: Views
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var emailTextField: CTextField!
    @IBOutlet weak var firstnameTextField: CTextField!
    @IBOutlet weak var lastnameTextField: CTextField!
    @IBOutlet weak var passwordTextField: CTextField!
    @IBOutlet weak var registerButton: CButton!
    
    // MARK: - Properties
    
    var viewModel: RegisterViewModel!
    
    // MARK: - Init
    
    static func instantiate(viewModel: RegisterViewModel) -> RegisterViewController {
        
        let viewController = UIStoryboard.load(from: .authentication, viewController: self) as! RegisterViewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocalization()
    }
    
    // MARK: - Actions
    
    @IBAction func onRegister(_ sender: Any) {
        print(viewModel.email)
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        
        // Setup TextFields
        emailTextField.type = .email
        firstnameTextField.type = .name
        lastnameTextField.type = .name
        passwordTextField.type = .password
        
        // Setup Buttons
        registerButton.style = .primary
        
        // Assign Delegate
        emailTextField.delegate = self
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupLocalization() {
        
        // Set title
        self.title = i18n.Authenticaion.title
        
        // Set message
        messageLabel.text = i18n.Authenticaion.message
        
        
        // setup placeholders
        emailTextField.setPlaceholder(withMessage: i18n.placeholderEmail)
        firstnameTextField.setPlaceholder(withMessage: i18n.placeholderFirstName)
        lastnameTextField.setPlaceholder(withMessage: i18n.placeholderLastName)
        passwordTextField.setPlaceholder(withMessage: i18n.placeholderPassword)
    }
}

// MARK: - UITextField Delegate Methods

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newString: String = ""
        
        // Create new string
        if let text = textField.text, let textRange = Range(range, in: text) {
            newString = text.replacingCharacters(in: textRange,  with: string)
        }
        
        switch textField {
        case emailTextField.textField:
            
            // Update viewModel Value
            viewModel.email = newString
        case firstnameTextField.textField:
            
            // Update viewModel Value
            viewModel.firstname = newString
            
        case lastnameTextField.textField:
            
            // Update viewModel Value
            viewModel.lastname = newString
        case passwordTextField.textField:
            
            // Update viewModel Value
            viewModel.password = newString
        default:
            return false
        }
        
        return true
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        if textField == emailTextField.textField {
            viewModel.email = textField.text
        } else if textField == firstnameTextField.textField {
            viewModel.firstname = textField.text
        } else if textField == lastnameTextField.textField {
            viewModel.lastname = textField.text
        } else if textField == passwordTextField.textField {
            viewModel.password = textField.text
        }
    }
}
