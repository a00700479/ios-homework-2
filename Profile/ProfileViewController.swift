//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Natali on 14.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private lazy var changeTitleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Change title", for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(changeTitleButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = "Profile"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray5
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        setupViews()
        activateViewConstraints()
    }
    
    private func setupViews() {
        view.addSubview(profileHeaderView)
        view.addSubview(changeTitleButton)
    }
    
    @objc private func changeTitleButtonPressed() {
        print ("Change title")
        
        let alert = UIAlertController(title: "Set title", message: "Enter new title", preferredStyle: .alert)
        alert.addTextField()
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self, weak alert] _ in
            guard let newTitle = alert?.textFields?[0].text else {return}
            if newTitle.isEmpty {
                let alert = UIAlertController(title: "You should enter something", message: nil, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                self?.present(alert, animated: true)
            }
            self?.profileHeaderView.changeTitle(title: newTitle)
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    private func activateViewConstraints() {
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        NSLayoutConstraint.activate([
            changeTitleButton.heightAnchor.constraint(equalToConstant: 50),
            changeTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


