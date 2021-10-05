//
//  SplashViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBAction func touchKakaoLogin(_ sender: Any) {
        //최상위 루트뷰를 바꿔주는 방법
        self.changeRootViewController(BaseTabBarController())
    }
}
