//
//  LoginDataManager.swift
//  Tipkle
//
//  Created by 이유리 on 2021/11/29.
//

import Alamofire

class LoginDataManager {
    func postKakaoLogin(_ parameters: KakaoLoginRequest, viewController: LoginViewController) {
        AF.request("\(Constant.BASE_URL)login/kakao", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: KakaoLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        viewController.didSuccessKakaoLogin(result)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    
    func getAutoLogin(viewController: LoginViewController) {
        AF.request("\(Constant.BASE_URL)auto-login", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: BaseResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didgetAutoLoginSuccess(response)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
