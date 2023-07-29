

import Alamofire

//상수값 저장하는 클래스
struct Constant {
    static let BASE_URL = "https://tipkle.shop/"
    
    static var HEADERS:HTTPHeaders = ["x-access-token": JwtToken.token!]
}
