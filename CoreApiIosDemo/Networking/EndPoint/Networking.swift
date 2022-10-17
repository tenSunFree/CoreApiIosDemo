import Foundation
import Alamofire

enum Networking {
    case login(email:String, password: String)
    case users
}

extension Networking : TargetType {
    var baseURL: BaseURLType {
        return .baseApi
    }
    
    var version: VersionType {
        return.none
    }
    
    var path: RequestType {
        switch self {
        case .login:
            return .requestPath(path: "/products")
        case .users:
            return .requestPath(path: "/products")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .users:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password" : password], encoding:JSONEncoding.default)
        case .users:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default :
            return ["Content-Type":"application/json"]
        }
    }
}
