//
//  GetMyPageResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2022/04/15.
//

struct GetMyPageResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: GetMyPageResult?
}

struct GetMyPageResult: Decodable{
    var level:Int
    var levelName:String
    var profileImgUrl:String
    var nickName:String
    var levelbar:Int
    var achievement:String
}

