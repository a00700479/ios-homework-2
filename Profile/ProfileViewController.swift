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


    private var heightConstraint: NSLayoutConstraint?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = "Profile"
        self.viewWillLayoutSubviews()


        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray5
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        activateViewConstraints()

    }

    private func activateViewConstraints() {



        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)

        let centerXConstraint = self.profileHeaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

        let centerYConstraint = self.profileHeaderView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

       let widthConstraint = self.profileHeaderView.widthAnchor.constraint(equalTo: self.view.widthAnchor)

        let bottomConstraint = self.profileHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)



        NSLayoutConstraint.activate([
          topConstraint,
          centerXConstraint,
          centerYConstraint,
          widthConstraint,
          bottomConstraint
        ])

    }

    
}
    

