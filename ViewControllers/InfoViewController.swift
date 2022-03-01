//
//  InfoViewController.swift
//  Navigation
//
//  Created by Natali on 15.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Info"
        let button = UIButton(frame: CGRect(x: 140, y: 500, width: 125, height: 50))
        
        view.addSubview(button)
        button.setTitle("Alert!", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        
        button.addTarget(self, action: #selector(alertPush), for: .touchUpInside)
        
    }
    
    @objc func alertPush() {
        let alert = UIAlertController(title: "Alert activated", message: "Ooops!", preferredStyle: .alert)
        
        let rightPush = UIAlertAction(title: "Accept", style: .default, handler: nil)
        let leftPush = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(leftPush)
        alert.addAction(rightPush)
        
        present(alert, animated: true, completion: nil)
        print("Alert has been shown")
        
        
    }
    
    
}
