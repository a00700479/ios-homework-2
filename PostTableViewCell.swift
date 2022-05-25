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
        labelStackView.backgroundColor = .green
        labelStackView.distribution = .fillEqually
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        return labelStackView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.backgroundColor = .blue
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




//    private let petsImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .black
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    private let nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .white
//        label.font = UIFont.boldSystemFont(ofSize: 20.0)
//        label.numberOfLines = 2
//        label.text = "Name Label"
//        label.sizeToFit()
//        return label
//    }()
//
//    private let descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .white
//        label.font = .systemFont(ofSize: 14)
//        label.text = "Description Label"
//        label.textColor = .systemGray
//        label.numberOfLines = 0
//        return label
//    }()
//
//    private let likesLabel: UILabel = {
//        let label = UILabel()
//        let tap = UITapGestureRecognizer(target: PostTableViewCell.self, action: #selector(tapLiked))
//        label.addGestureRecognizer(tap)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 16)
//      //  label.backgroundColor = .white
//        label.text = "Likes"
//        label.sizeToFit()
//        return label
//    }()
//
//    private let viewsLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//       // label.backgroundColor = .white
//        label.font = .systemFont(ofSize: 16)
//        label.text = "Views"
//        label.sizeToFit()
//        return label
//    }()
//
//    private lazy var labelsStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [likesLabel, viewsLabel])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.backgroundColor = .green
//        stackView.clipsToBounds = true
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.layer.borderWidth = 0.5
//        stackView.layer.borderColor = UIColor.clear.cgColor
//
//        stackView.spacing = 10
//        return stackView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super .init(style: style, reuseIdentifier: reuseIdentifier)
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupCell (with viewModel: ViewModel) {
//        petsImageView.image = UIImage(named: viewModel.image)
//        nameLabel.text = viewModel.author
//        descriptionLabel.text = viewModel.description
//        likesLabel.text = "♡: \(viewModel.likesNum)"
//        viewsLabel.text = "Views: \(viewModel.views)"
//    }
//
//    @objc func tapLiked() {
//        likedDelegate?.tapLikedLabel()
//    }
//
//    private func layout() {
//        [nameLabel, petsImageView, descriptionLabel].forEach {
//            contentView.addSubview($0)}
//
//        addSubview(labelsStackView)
//
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
//
//            petsImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
//            petsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
//            petsImageView.heightAnchor.constraint(equalTo: petsImageView.widthAnchor),
//
//                 descriptionLabel.topAnchor.constraint(equalTo: petsImageView.bottomAnchor, constant: 16),
//            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
//
//             labelsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
//            labelsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            labelsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            labelsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
//        ])
//    }
//}
//
//var dataSource: [PostView] = []
//
//struct PostView: Equatable {
//    let author: String
//    let description: String
//    let imageName: String
//    var likes: Int
//    var views: Int
//}
//
//protocol TapLikedDelegate: AnyObject {
//    func tapLikedLabel()
//}
//
//
//
//
