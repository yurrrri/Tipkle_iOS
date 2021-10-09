//
//  SplashViewController.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

import UIKit
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: BaseViewController {
    //카카오 로그인
    @IBAction func touchKakaoLogin(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
}
