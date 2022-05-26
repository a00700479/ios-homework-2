//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Natali on 27.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var likedDelegate: TapLikedDelegate?

    struct ViewModel {
        let author: String
        let image: String
        let description: String
        var likesNum: Int
        var views: Int
    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    lazy var authorPost: UILabel = {
        let authorPost = UILabel()
        authorPost.numberOfLines = 0
        authorPost.font = .systemFont(ofSize: 20, weight: .bold)
        authorPost.adjustsFontForContentSizeCategory = true
        authorPost.minimumScaleFactor = 0.5
        authorPost.textAlignment = .center
        authorPost.translatesAutoresizingMaskIntoConstraints = false
        return authorPost
    }()

    lazy var imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.contentMode = .scaleAspectFit
        return imagePost
    }()

    lazy var descriptionPost: UILabel = {
        let descriptionPost = UILabel()
        descriptionPost.font = .systemFont(ofSize: 12, weight: .light)
        descriptionPost.numberOfLines = 2
        descriptionPost.textAlignment = .center
        descriptionPost.translatesAutoresizingMaskIntoConstraints = false
        return descriptionPost
    }()

    lazy var likesPost: UILabel = {
        let likesPost = UILabel()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLiked))
        likesPost.addGestureRecognizer(tap)
        likesPost.isUserInteractionEnabled = true
        likesPost.translatesAutoresizingMaskIntoConstraints = false
        return likesPost
    }()

    lazy var viewsPost: UILabel = {
        let viewsPost = UILabel()
        viewsPost.textAlignment = .right
        viewsPost.translatesAutoresizingMaskIntoConstraints = false
        return viewsPost
    }()

    lazy var labelStackView: UIStackView = {
        let labelStackView = UIStackView()
        labelStackView.axis = .horizontal
        labelStackView.backgroundColor = .white
        labelStackView.distribution = .fillEqually
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        return labelStackView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with viewModel: ViewModel) {
        self.authorPost.text = viewModel.author
        self.imagePost.image = UIImage(named: viewModel.image)
        self.descriptionPost.text = viewModel.description
        self.likesPost.text = "\(viewModel.likesNum) ♡"
        self.viewsPost.text = "\(viewModel.views) ▷"
    }

    @objc func tapLiked() {
        likedDelegate?.tapLikedLabel()
    }

    private func configureTableView() {

        contentView.addSubview(backView)
        backView.addSubview(stackView)
        stackView.addArrangedSubview(authorPost)
        stackView.addArrangedSubview(imagePost)
        stackView.addArrangedSubview(descriptionPost)
        stackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(likesPost)
        labelStackView.addArrangedSubview(viewsPost)

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            imagePost.heightAnchor.constraint(equalToConstant: 350),

            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),

            likesPost.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            viewsPost.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            authorPost.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}

var dataSource: [PostView] = []

struct PostView: Equatable {
    let author: String
    let description: String
    let imageName: String
    var likes: Int
    var views: Int
}

protocol TapLikedDelegate: AnyObject {
    func tapLikedLabel()
}
