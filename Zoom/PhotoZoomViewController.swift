//
//  PhotoZoomViewController.swift
//  Navigation
//
//  Created by Natali on 23.05.2022.
//

import UIKit

class PhotoZoomVIewController: UIViewController {

    lazy var photo: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        return photo
    }()

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func set(image: PhotosView) {
        photo.image = UIImage(named: image.imageName)
    }

    private func setupView() {

        view.addSubview(exitButton)
        view.addSubview(photo)

        NSLayoutConstraint.activate([

            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40),

            photo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photo.heightAnchor.constraint(equalToConstant: 500),
            photo.widthAnchor.constraint(equalToConstant: 500)
        ])
    }

    @objc private func exitPressed() {
        dismiss(animated: true)
    }
}
