//
//  HomeViewController.swift
//  Tipkle
//
//  Created by 이유리 on 2021/09/29.
//

import UIKit
import Alamofire
class constant{
    static let baseUrl = "https://dev.tipkle.shop/"
}

//Entity
struct Category:Decodable{
    var categoryId:Int
    var categoryName:String
}

struct response:Decodable{
    var isSuccess:Bool
    var code:Int
    var message:String
    var result:[Category]
}

class dataManager{
    func getCategories(delegate:HomeViewController){
        let url = constant.baseUrl+"categories"
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default, headers: nil, interceptor: nil) //클로저 -> 람다
            .responseDecodable(of: response.self){
                response in
                switch response.result{
                case .success(let response):
                    delegate.didSuccessNetworking(response: response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    
    }
}

class HomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager().getCategories(delegate: self)
    }
    
    func didSuccessNetworking(response:response){
        print(response) //ui 조작할 부분 -> 백그라운드에서 메인 스레드의 UI를 조작할때 사용
        DispatchQueue.main.async {[weak self] in //메모리 누수 방지
            guard let self = self else { return }
        
        
        }
    }
}
