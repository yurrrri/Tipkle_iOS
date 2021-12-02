//
//  SignInResponse.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

/*
 /*
  {
      "isSuccess": true,
      "code": 1000,
      "message": "비회원 카카오 로그인 검증 성공",
      "result": {
          "isMember": "N",
          "userId": 0,
          "jwt": null
      }
  }
  */
 */

struct KakaoLoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: KakaoLoginResult?
}

struct KakaoLoginResult: Decodable{
    var isMember: String
    var userId: Int
    var jwt: String?
}
