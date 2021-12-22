//
//  HomeDataManager.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/03.
//

import Foundation
import Alamofire

class HomeDataManager {
    func getUserCategories(viewController: HomeViewController) {
        AF.request("\(Constant.BASE_URL)users/categories", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: GetUserCategoryResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didSuccessGetUserCategories(response.result!)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    
    func getBanner(viewController: HomePagerViewController) {
        AF.request("\(Constant.BASE_URL)banners", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constant.HEADERS)
            .validate()
            .responseDecodable(of: GetBannerResopnse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        viewController.didSuccessGetBanner(response.result!)
                    } else {
                        viewController.failedToRequest(message: response.message)
                    }
                case .failure(let error):
                    print(error)
                    viewController.failedToRequest(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
    
    func getPreviewTips(viewController: HomePagerViewController, categoryName:String, order:String){
        let urlString = "\(Constant.BASE_URL)categories/"+categoryName+"/tips?order="+order

        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url, method: .get, parameters:nil, headers:Constant.HEADERS)
                    .validate()
                    .responseDecodable(of: GetPreviewTips.self) { response in
                        switch response.result {
                        case .success(let response):
                            if response.isSuccess {
                                viewController.didSuccessGetPreviewTips(response.result!)
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
    
    func getPreviewTips(viewController: HomePagerChildViewController, categoryName:String, order:String){
        print(order)
        let urlString = "\(Constant.BASE_URL)categories/"+categoryName+"/tips?order="+order

        if let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded){
            AF.request(url, method: .get, parameters:nil, headers:Constant.HEADERS)
                    .validate()
                    .responseDecodable(of: GetPreviewTips.self) { response in
                        switch response.result {
                        case .success(let response):
                            if response.isSuccess {
                                viewController.didSuccessGetPreviewTips(response.result!)
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
}
