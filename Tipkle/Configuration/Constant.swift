//
//  Constant.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/08.
//

import Alamofire

//상수값 저장하는 클래스
struct Constant {
    static let BASE_URL = "https://tipkle.shop/"
//    static let KOBIS_BASE_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest"
    
    static var HEADERS:HTTPHeaders = ["x-access-token": JwtToken.token]
}
