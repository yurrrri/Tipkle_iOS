//
//  SignInResponse.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

struct KakaoLoginResponse: Decodable {
    var code: Int
    var message: String
    var isSuccess: Bool
    var result: KakaoLoginResult
}

struct KakaoLoginResult : Decodable {
    var isMember:Character
    var userId:Int
    var jwt:String
}
