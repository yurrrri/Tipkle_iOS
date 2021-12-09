//
//  GetUserCeategoryResponse.swift
//  Tipkle
//
//  Created by 이유리 on 2021/12/03.
//

struct GetUserCategoryResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [GetUserCategoryResult]?
}

struct GetUserCategoryResult: Decodable{
    var categoryId: Int
    var categoryName: String
}
