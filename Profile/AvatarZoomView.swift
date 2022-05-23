//
//  AvatarZoomView.swift
//  Navigation
//
//  Created by Natali on 18.05.2022.
//

import UIKit

class AvatarZoomView: UIView {

    let profileView = ProfileHeaderView()

    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var avatarImage: UIImageView = {
        let cat = UIImage(named: "cat")
        let avatarImage = UIImageView(image: cat)
        avatarImage.layer.shadowColor = UIColor.black.cgColor
        avatarImage.layer.shadowOffset = CGSize(width: 10, height: 10)
        avatarImage.layer.shadowRadius = 10
        avatarImage.layer.shadowOpacity = 0.3
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    } ()

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPressed), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()

    @objc func exitPressed() {

        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        self.alpha = 0
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func layout() {
        self.addSubview(alphaView)
        self.addSubview(avatarImage)
        self.bringSubviewToFront(alphaView)
        self.addSubview(exitButton)

        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.exitButton.alpha = 1.0
        }

        self.bringSubviewToFront(avatarImage)
        alphaView.alpha = 0.5

        var constraints = [NSLayoutConstraint] ()

        constraints.append(exitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 30))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 30))

        constraints.append(avatarImage.leadingAnchor.constraint(lessThanOrEqualTo: self.leadingAnchor, constant: 150))
        constraints.append(avatarImage.trailingAnchor.constraint(greaterThanOrEqualTo: self.trailingAnchor, constant: -150))
        constraints.append(avatarImage.heightAnchor.constraint(lessThanOrEqualToConstant: 350))
        constraints.append(avatarImage.centerXAnchor.constraint(equalTo: self.centerXAnchor))
        constraints.append(avatarImage.centerYAnchor.constraint(equalTo: self.centerYAnchor))
        
        constraints.append(alphaView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor))
        constraints.append(alphaView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(alphaView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(alphaView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor))

        NSLayoutConstraint.activate(constraints)
    }
}


