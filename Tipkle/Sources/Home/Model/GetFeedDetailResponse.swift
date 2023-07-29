//
//  GetFeedDetailResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2022/02/18.
//


// MARK: - Welcome
struct GetFeedDetailResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: GetFeedDetailResult?
}

// MARK: - Result
struct GetFeedDetailResult : Decodable {
    var postID, userID: Int?
    var nickName: String?
    var profileImgURL: String?
    var whenText, howText, resultDescription, score: String?
    var star: Int?
    var isStarred, isBookMarked: String?
    var commentCount: Int?
    var isAuthor: String?
    var imgURL: [String]?
}
