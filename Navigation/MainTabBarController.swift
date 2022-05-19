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
        navigationController?.setNavigationBarHidden(true, animated: animated)

    }


    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    func setupTabBar() {

        let feedViewController = createNavigationController(vc:FeedViewController(), itemName: "Feed", ItemImage: "newspaper")

        let logInViewController = createNavigationController(vc:LogInViewController(), itemName: "Profile Log", ItemImage: "person")

     //   let profileViewController = createNavigationController(vc:LogInViewController(), titleName: "Profile", picture: "person")



       // viewControllers = [feedViewController, profileViewController]
      //  viewControllers = [feedViewController, logInViewController, profileViewController]
        viewControllers = [feedViewController, logInViewController]
    }

//    func createNavigationController(vc: UIViewController, titleName:String, picture:String) -> UINavigationController {
//
//        let item = UITabBarItem(title: titleName, image: UIImage(systemName: picture), tag: 0)
//
//        let navController = UINavigationController(rootViewController: vc)
//        navController.tabBarItem = item
//
//        return navController
//    }

    func createNavigationController(vc: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {

        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)

        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item




        return navController
    }
    
}
