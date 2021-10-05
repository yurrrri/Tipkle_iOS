//
//  SplashViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

import UIKit

class SplashViewController: BaseViewController {
    @IBAction func mainButtonTouchUpInside(_ sender: UIButton) {
        self.changeRootViewController(BaseTabBarController())
    }
}
