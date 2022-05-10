//
//  ProfileViewController.swift
//  InstagramLocalTestTask
//
//  Created by Oksana Poliakova on 04.05.2022.
//

import UIKit
import Photos
import PhotosUI

class ProfileViewController: UIViewController {
    
    private let countCells: Int = 3

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var editProfileButton: UIButton!
    @IBOutlet private weak var addPhotoButton: UIBarButtonItem!
    @IBOutlet private weak var galleryCollectionView: UICollectionView! {
        didSet {
            galleryCollectionView.delegate = self
            galleryCollectionView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
   
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize:24, weight: .bold)]
        
        avatarImageView.maskCircle(imageView: avatarImageView)
        
        editProfileButton.layer.cornerRadius = 6
        editProfileButton.backgroundColor = .clear
        editProfileButton.layer.borderWidth = 1
        editProfileButton.layer.borderColor = UIColor.lightGray.cgColor
        editProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    
    @IBAction private func didTapAdd(_ sender: UIBarButtonItem) {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
//        config.filter = PHPickerFilter.any(of: [.images, .videos, .livePhotos])
        config.filter = .images
        
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
        
        
    }
    

}

// MARK: - UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCollectionView = collectionView.frame
        return CGSize(width: 128, height: 128)
    }
}

// MARK: - PHPickerViewControllerDelegate

extension ProfileViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard let image = reading as? UIImage, error == nil else { return }
                print(image)
            }
        }
    }
}
