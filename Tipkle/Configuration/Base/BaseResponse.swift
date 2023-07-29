//
//  BaseResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/02.
//

struct BaseResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
}
