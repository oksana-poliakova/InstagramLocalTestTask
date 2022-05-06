//
//  PhotoCollectionViewCell.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 06.05.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var photo: UIImageView!
    
    public func configureCell(image: UIImage) {
        photo.image = image
    }
}
