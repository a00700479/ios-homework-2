//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali on 14.02.2022.
//

import UIKit

class ProfileViewController: UIViewController, TapLikedDelegate {
    
    let profileView = ProfileHeaderView()
    let avatarView = AvatarZoomView()
    var liked: Bool = false
    
    lazy var tableView: UITableView = {
        let tabelView = UITableView(frame: .zero, style: .grouped)
        tabelView.delegate = self
        tabelView.dataSource = self
        tabelView.layer.cornerRadius = 10
        tabelView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tabelView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        tabelView.register(MyFavouredPostCell.self, forCellReuseIdentifier: Cells.labelCell)
        tabelView.register(MyFavouredPhotosCell.self, forCellReuseIdentifier: Cells.likesCell)
        tabelView.translatesAutoresizingMaskIntoConstraints = false
        return tabelView
    }()

    var photos = PhotoView(photoName1: Photos.photo1!, photoName2: Photos.photo2!, photoName3: Photos.photo3!, photoName4: Photos.photo4!)
    var label = FavouritesView(favourites: "Posts:")
    var likeLabel = myLikesView(myLikes: "Photos:")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = false
        setupConstraints()
        dataSource = fetchData()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        profileView.addGestureRecognizer(tap)
        let avatarTap = UITapGestureRecognizer(target: self, action: #selector(onTapScreen))
        profileView.avatarImage.addGestureRecognizer(avatarTap)
    }

    
    @objc func tap(_ sender: Any) {
        
        profileView.textField.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func tapLikedLabel() {
        liked.toggle()
        self.tableView.reloadData()
    }
    
    @objc func onTapScreen() {
        
        UIView.animate(withDuration: 0.5) {
            self.avatarView.alpha = 0.95
        }
    }
    
    struct Cells {
        static let postCell = "PostTableViewCell"
        static let photoCell = "PhotosTableViewCell"
        static let labelCell = "MyLootsViewCell"
        static let likesCell = "LikesViewCell"
    }
    
    private func setupConstraints() {
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        view.addSubview(avatarView)
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(avatarView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(avatarView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(avatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(avatarView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
}


