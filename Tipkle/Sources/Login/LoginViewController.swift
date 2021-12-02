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
    lazy var dataManager = LoginDataManager()
    var acceessToken:String?=nil //property
    //lazy : 사용되기전까지는 연산이 되지 않는다는 뜻

    override func viewDidLoad() {
        self.showIndicator()
        self.dismissKeyboard()
        
        if (UserDefaults.standard.string(forKey: "jwt") != nil){
            dataManager.getAutoLogin(viewController: self)
        }
    }

    //카카오 로그인
    @IBAction func touchKakaoLogin(_ sender: Any) {
        //카카오톡 설치여부 확인 -> 카카오로 로그인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk { [self](oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    self.acceessToken = oauthToken?.accessToken
                    
                    // Request KakaoLogin
                    self.showIndicator()
                    self.dismissKeyboard()
                    let input = KakaoLoginRequest(accessToken: self.acceessToken!, fcmToken: fcmToken.token)
                    dataManager.postKakaoLogin(input, viewController: self)
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
                        self.acceessToken = oauthToken?.accessToken
                        
                        self.showIndicator()
                        self.dismissKeyboard()
                        let input = KakaoLoginRequest(accessToken: self.acceessToken!, fcmToken: fcmToken.token)
                        self.dataManager.postKakaoLogin(input, viewController: self)
                    }
                }
        }
    }
}

extension LoginViewController {
    func didSuccessKakaoLogin(_ result: KakaoLoginResult) {
        if (result.jwt != nil){
            UserDefaults.standard.set(result.jwt, forKey: "jwt")
            JwtToken.token = result.jwt!
            self.changeRootViewController(BaseTabBarController())
        }
    }
    
    func didgetAutoLoginSuccess(_ result: BaseResponse){
        if (result.isSuccess){
            UIApplication.shared.windows.first?.rootViewController = BaseTabBarController()
        }
    }
    
    func failedToRequest(message: String) {
        self.presentAlert(title: message)
    }
}
