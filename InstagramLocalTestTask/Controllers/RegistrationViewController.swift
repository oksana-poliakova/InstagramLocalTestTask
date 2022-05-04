//
//  ViewController.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 03.05.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var fullNameTextField: UITextField!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Sign up
    
    @IBAction private func signUp() {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertWithTitle(title: "Fill your email", viewController: self)
            return
        }
        
        guard let fullName = fullNameTextField.text, !fullName.isEmpty else {
            showAlertWithTitle(title: "Fill your full name", viewController: self)
            return
        }
        
        guard let username = usernameTextField.text, !username.isEmpty else {
            showAlertWithTitle(title: "Fill your username", viewController: self)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlertWithTitle(title: "Fill your password", viewController: self)
            return
        }

    }
}

