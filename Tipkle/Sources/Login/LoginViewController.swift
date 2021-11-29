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
        //카카오톡 설치여부 확인 -> 카카오로 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
        //설치가 안되어있으면 -> 카카오 계정으로 로그인
        else{
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
}
