//
//  GetUserCeategoryResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/11.
//

struct GetBannerResopnse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetBanner]?
}

struct GetBanner: Decodable{
    var postId: Int
    var title: String
    var thumbnailUrl: String
}
