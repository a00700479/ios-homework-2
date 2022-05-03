//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Natali on 03.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var photoGalleryImages: UIImageView = {
        let photoGalleryImages = UIImageView()
        photoGalleryImages.clipsToBounds = true
        photoGalleryImages.translatesAutoresizingMaskIntoConstraints = false
        return photoGalleryImages
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoGalleryImages)
        
        NSLayoutConstraint.activate([
            
            photoGalleryImages.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoGalleryImages.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoGalleryImages.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            photoGalleryImages.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
