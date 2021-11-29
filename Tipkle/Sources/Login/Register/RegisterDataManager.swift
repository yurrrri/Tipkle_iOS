//
//  RegisterDataManager.swift
//  Tipkle
//
//  Created by 이유리 on 2021/11/29.
//

import Alamofire

class RegisterDataManager {
    func postKakaoLogin(_ parameters: KakaoLoginRequest, viewController: LoginViewController) {
        AF.request("\(Constant.BASE_URL)/login/kakao", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: KakaoLoginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess, let result = response.result {
                        viewController.didSuccessSignIn(result)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
