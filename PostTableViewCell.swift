//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Natali on 27.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let petsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        label.text = "Name Label"
        label.sizeToFit()
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = "Description Label"
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .white
        label.text = "Likes"
        label.sizeToFit()
        return label
    }()

    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 16)
        label.text = "Views"
        label.sizeToFit()
        return label
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, viewsLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.clear.cgColor

        stackView.spacing = 10
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell (_ model: PostModel) {
        petsImageView.image = model.image
        nameLabel.text = model.authorName
        descriptionLabel.text = model.description
        likesLabel.text = "Likes: \(model.numberOfLikes)"
        viewsLabel.text = "Views: \(model.numberOfViews)"
    }

    private func layout() {
        [nameLabel, petsImageView, descriptionLabel].forEach {
            contentView.addSubview($0)}

        addSubview(labelsStackView)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),

            petsImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            petsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            petsImageView.heightAnchor.constraint(equalTo: petsImageView.widthAnchor),

                 descriptionLabel.topAnchor.constraint(equalTo: petsImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),

             labelsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}




