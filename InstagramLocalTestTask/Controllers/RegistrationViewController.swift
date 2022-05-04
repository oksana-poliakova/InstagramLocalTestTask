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
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        
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
    
    // MARK: - Show and hide keyboard when go to / out from the text field
    
    private func initialSetup() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    /// Hide keyboard
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    /// Keyboard will show
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            scrollView.contentInset = UIEdgeInsets(top: .zero, left: .zero, bottom: keyboardHeight, right: .zero)
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    /// Keyboard will hide
    @objc func keyboardWillHide() {
        scrollView.contentInset = .zero
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    /// Deinit
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

