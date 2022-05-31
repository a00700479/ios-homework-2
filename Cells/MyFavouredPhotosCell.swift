//
//  MyFavouredPhotosCell.swift
//  Navigation
//
//  Created by Natali on 23.05.2022.
//


import UIKit

class MyFavouredPhotosCell: UITableViewCell {

    private lazy var likes: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 24, weight: .bold)
        likes.adjustsFontSizeToFitWidth = true
        likes.minimumScaleFactor = 0.5
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private lazy var arrowImageView: UIImageView = {
        let arrow = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView()
        imageView.image = arrow
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setLikes(myLikes: myLikesView) {
        likes.text = myLikes.myLikes
    }

    private func configureTableView() {

        addSubview(likes)
        addSubview(arrowImageView)

        var constraints = [NSLayoutConstraint]()

        constraints.append(likes.topAnchor.constraint(equalTo: self.topAnchor, constant: 2))
        constraints.append(likes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12))
        constraints.append(likes.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30))
        constraints.append(likes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5))

        constraints.append(arrowImageView.centerYAnchor.constraint(equalTo: likes.centerYAnchor))
        constraints.append(arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12))

        NSLayoutConstraint.activate(constraints)
    }
}

struct myLikesView {
    let myLikes: String
}

