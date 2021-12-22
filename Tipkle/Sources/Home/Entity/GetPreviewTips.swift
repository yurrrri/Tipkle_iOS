//
//  GetPreviewTips.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/16.
//

struct GetPreviewTips: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetPreview]?
}

struct GetPreview: Decodable{
    var postId: Int
    var title: String
    var thumbnailUrl: String
}
