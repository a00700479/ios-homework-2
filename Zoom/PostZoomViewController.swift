//
//  PostZoomViewController.swift
//  Navigation
//
//  Created by Natali on 23.05.2022.
//

import UIKit

class PostZoomViewController:UIViewController {

    private lazy var author: UILabel = {
        let author = UILabel()
        author.numberOfLines = 0
        author.font = .systemFont(ofSize: 20, weight: .bold)
        author.adjustsFontForContentSizeCategory = true
        author.minimumScaleFactor = 0.5
        author.textAlignment = .center
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    lazy var descriptionV: UILabel = {
        let descriptionV = UILabel()
        descriptionV.font = .systemFont(ofSize: 12, weight: .light)
        descriptionV.numberOfLines = 10
        descriptionV.textAlignment = .center
        descriptionV.translatesAutoresizingMaskIntoConstraints = false
        return descriptionV
    }()

    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    lazy var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.setTitle("X", for: .normal)
        exitButton.addTarget(self, action: #selector(exitPress), for: .touchUpInside)
        exitButton.backgroundColor = .gray
        exitButton.layer.cornerRadius = 10
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        return exitButton
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        view.backgroundColor = .white
        configureTableView()
    }

    @objc func exitPress() {
        dismiss(animated: true)
    }

    private let tapGestureRecognizer = UITapGestureRecognizer()

    func set(post: PostView) {
        author.text = post.author
        image.image = UIImage(named: post.imageName)
        descriptionV.text = post.description
        likes.text = "\(post.likes) ♡"
        views.text = "\(post.views) ▷"
    }

    private func configureTableView() {

        var constraints = [NSLayoutConstraint]()

        view.addSubview(exitButton)
        view.addSubview(author)
        view.addSubview(image)
        view.addSubview(descriptionV)
        view.addSubview(stackView)
        stackView.addArrangedSubview(likes)
        stackView.addArrangedSubview(views)

        constraints.append(exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        constraints.append(exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30))
        constraints.append(exitButton.heightAnchor.constraint(equalToConstant: 30))
        constraints.append(exitButton.widthAnchor.constraint(equalToConstant: 30))

        constraints.append(author.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10))
        constraints.append(author.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        constraints.append(author.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
        constraints.append(author.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -10))

        constraints.append(image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
        constraints.append(image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        constraints.append(image.heightAnchor.constraint(lessThanOrEqualToConstant: 450))

        constraints.append(descriptionV.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10))
        constraints.append(descriptionV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
        constraints.append(descriptionV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        constraints.append(descriptionV.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -20))

        constraints.append(stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10))
        constraints.append(stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10))
        constraints.append(stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20))

        NSLayoutConstraint.activate(constraints)
    }
}

