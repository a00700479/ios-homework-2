//
//  DetailPhotoView.swift
//  Navigation
//
//  Created by Natali on 03.05.2022.
//

import UIKit

class DetailPhotoView: UIView {
    
    lazy var collectionImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    func setDetailImage(image: CollectionViewModel) {
        collectionImage.image = image.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.backgroundColor = .white
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.addSubview(collectionImage)
        
        NSLayoutConstraint.activate([
            collectionImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
}

