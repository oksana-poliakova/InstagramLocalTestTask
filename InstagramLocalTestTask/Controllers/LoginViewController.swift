//
//  LoginViewController.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 04.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Login
    
    @IBAction private func login() {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlertWithTitle(title: "Fill your phone number, username or email", viewController: self)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlertWithTitle(title: "Fill your password", viewController: self)
            return
        }
    }

}
