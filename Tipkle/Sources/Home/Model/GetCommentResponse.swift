//
//  GetCommentResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2022/03/02.
//

struct GetCommentResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [Comment]?
}

struct Comment: Decodable {
    var commentId: Int
    var userId: Int
    var nickName: String
    var profileImgUrl: String
    var content: String
    var createdAt: String
    var isAuthor: String
}
