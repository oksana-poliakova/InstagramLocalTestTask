//
//  ProfileViewController.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 04.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let countCells: Int = 3

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var editProfileButton: UIButton!
    @IBOutlet private weak var galleryCollectionView: UICollectionView! {
        didSet {
            galleryCollectionView.delegate = self
            galleryCollectionView.dataSource = self
        }
    }
    
    @IBOutlet private weak var photoCollectionViewCell: UICollectionViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
   
    }
    
    
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:24, weight: .bold)]
        
        avatarImageView.maskCircle(imageView: avatarImageView)
        
        editProfileButton.layer.cornerRadius = 6
        editProfileButton.backgroundColor = .clear
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        editProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    

}

extension ProfileViewController: UICollectionViewDelegate {
    
}


extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
}
