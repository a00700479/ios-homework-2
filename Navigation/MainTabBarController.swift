//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Natali on 13.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray5

        setupTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //        self.tabBar.barTintColor = .red
        self.tabBar.isTranslucent = false
        tabBar.tintColor = .blue
        tabBar.unselectedItemTintColor = .gray
    }

    func setupTabBar() {

        let feedViewController = createNavigationController(vc:FeedViewController(), titleName: "Feed", picture: "newspaper")

        let profileViewController = createNavigationController(vc:ProfileViewController(), titleName: "Profile", picture: "person")


        viewControllers = [feedViewController, profileViewController]
    }

    func createNavigationController(vc: UIViewController, titleName:String, picture:String) -> UINavigationController {

        let item = UITabBarItem(title: titleName, image: UIImage(systemName: picture), tag: 0)

        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item

        return navController
    }
}
