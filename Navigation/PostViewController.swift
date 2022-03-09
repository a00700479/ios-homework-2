//
//  PostViewController.swift
//  Navigation
//
//  Created by Natali on 15.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple

        let currentPost = Post()
        let titleLabel = UILabel()
        titleLabel.text = currentPost.title
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        navigationItem.titleView = titleLabel

        let infoButton = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(buttonInfoClicked))

        navigationItem.rightBarButtonItem = infoButton
    }
    
    @objc func buttonInfoClicked() {
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }

}
