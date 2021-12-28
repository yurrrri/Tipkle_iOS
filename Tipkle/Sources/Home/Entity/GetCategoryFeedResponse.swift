//
//  GetCategoryFeedResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/27.
//

struct GetCategoryFeedResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Feed]?
}

struct Feed: Decodable{
    var postId: Int
    var userId: Int
    var nickName: String
    var profileImgUrl: String
    var whenText: String
    var howText: String
    var description: String
    var score: String
    var star: Int
    var createdAt: String
    var imgUrl: [String]
    var isAuthor: String
}
