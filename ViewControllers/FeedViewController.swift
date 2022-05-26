//
//  FeedViewController.swift
//  Navigation
//
//  Created by Natali on 14.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private lazy var firstButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("First button", for: .normal)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Second button", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"

        setupViews()
        setConstraints()
    }

    private func setupViews() {

        view.backgroundColor = .white
        view.addSubview(stackView)
        [firstButton, secondButton].forEach { stackView.addArrangedSubview($0) }
    }

    @objc private func buttonTapped() {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
    }
}

struct Post {
    let title:String = "Post"
}

extension FeedViewController{

    private func setConstraints() {

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            stackView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}



