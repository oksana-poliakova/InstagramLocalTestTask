//
//  UIApplication+Externsions.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 04.05.2022.
//

import UIKit

// MARK: - Extension for UIViewController to adding and presenting UIAlertController

extension UIViewController {
    func showAlertWithTitle(title: String?, message: String? = nil, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController.present(alert, animated: true)
    }
}
