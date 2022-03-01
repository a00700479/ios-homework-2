//
//  FeedViewController.swift
//  Navigation
//
//  Created by Natali on 14.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.title = "Feed"

        let button = UIButton(frame: CGRect(x: 140, y: 500, width: 125, height: 50))
        view.addSubview(button)

        button.backgroundColor = .orange

        button.setTitle("Open Post", for: .normal)
        button.layer.cornerRadius = 12

        button.addTarget(self, action: #selector(buttonPush), for: .touchUpInside)
   //     self.navigationController?.navigationBar.backgroundColor = .white

    }
    
    @objc func buttonPush() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)

    }


}
struct Post {
    let title:String = "Post"

}



