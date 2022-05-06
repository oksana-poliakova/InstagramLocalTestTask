//
//  UIImageView+Extensions.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 06.05.2022.
//

import UIKit

// MARK: - Extension to set an imageView in circle

extension UIImageView {
    func maskCircle(imageView: UIImageView, borderWidth: CGFloat = 0, borderColor: CGColor = CGColor.init(gray: 0, alpha: 0)) {
        contentMode = .scaleAspectFill
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        image = imageView.image
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
}
