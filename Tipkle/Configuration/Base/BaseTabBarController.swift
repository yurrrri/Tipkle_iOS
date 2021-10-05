//
//  BaseTabBarController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    let actionViewController  = ActionViewController()
    let networkViewController = NetworkViewController()
    
    let actionTabBarItem  = UITabBarItem(title: "Action", image: UIImage(systemName: "figure.walk"), tag: 0)
    let networkTabBarItem = UITabBarItem(title: "Network", image: UIImage(systemName: "network"), tag: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionNavigationController = UINavigationController(rootViewController: actionViewController)
        let networkNavigationController = UINavigationController(rootViewController: networkViewController)
        
        actionNavigationController.tabBarItem  = actionTabBarItem
        networkNavigationController.tabBarItem = networkTabBarItem
        
        self.viewControllers = [actionNavigationController, networkNavigationController]
        
        self.delegate = self
    }
}
