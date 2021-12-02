//
//  JwtToken.swift
//  Tipkle
//
//  Created by 이유리 on 2021/10/06.
//

import Foundation

struct JwtToken{
    static var token: String? = UserDefaults.standard.string(forKey: "jwt")
}
