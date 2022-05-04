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
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var signUpButton: UIButton!
    
    // MARK: - ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
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
    
    
    @IBAction private func tappedOnSignUpButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        guard let registrationViewContoller = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController else { return }
        present(registrationViewContoller, animated: true)
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
