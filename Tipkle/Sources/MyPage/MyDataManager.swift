//
//  MyDataManager.swift
//  Tipkle
//
//  Created by 이유리 on 2022/04/15.
//

import Foundation
import Alamofire

class MyDataManager {
    func getMyPage(viewController: MyPageViewController) {
        AF.request("\(Constant.BASE_URL)users/profiles", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: GetMyPageResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didSuccessGetUserMyPage(response.result!)
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
