//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali on 14.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileView = ProfileHeaderView()
    let avatarView = AvatarZoomView()

    private let postModel:[[PostModel]] = PostModel.makePostModel()

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self,
                           forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self,
                           forCellReuseIdentifier: PhotosTableViewCell.identifier)

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false

        layout()

        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(onTapScreen))
        profileView.avatarImageView.addGestureRecognizer(avatarTap)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    @objc func onTapScreen() {

        UIView.animate(withDuration: 0.5) {
            self.avatarView.alpha = 1
        }
    }

    private func layout() {

        avatarView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        view.addSubview(avatarView)

        NSLayoutConstraint.activate([

            avatarView.topAnchor.constraint(equalTo: view.topAnchor),
            avatarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            avatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            avatarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel[section].count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell

            cell.setupCell(postModel[indexPath.section][indexPath.row - 1])
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return profileView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
