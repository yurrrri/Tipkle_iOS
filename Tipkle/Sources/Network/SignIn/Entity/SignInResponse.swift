//
//  SignInResponse.swift
//  EduTemplate
//
//  Created by Zero Yoon on 2020/10/10.
//

struct SignInResponse: Decodable {
    var code: Int
    var message: String
    var isSuccess: Bool
    var result: SignInResult?
}

struct SignInResult: Decodable {
    var token: String
    var userInfoIdx: Int
}
