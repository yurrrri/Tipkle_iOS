//
//  SignInDataManager.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

import Alamofire

//네트워크 통신만 담당하는 친구
class SignInDataManager {
    func postSignIn(_ parameters: SignInRequest, viewController: SignInViewController) {
        AF.request("\(Constant.BASE_URL)/signin", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: nil)
            .validate()
            .responseDecodable(of: SignInResponse.self) { response in
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
