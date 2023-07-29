
struct KakaoLoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: KakaoLoginResult?
}

struct KakaoLoginResult: Decodable{
    var isMember: String
    var userId: Int
    var jwt: String?
}
