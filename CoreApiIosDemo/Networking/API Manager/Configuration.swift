import Foundation

enum BaseURLType {
    
    case baseApi
    case staging
    
    var desc : String {
        switch self {
        case .baseApi :
            return "https://dummyjson.com"
        case .staging :
            return "https://dummyjson.com"
        }
    }
}

enum VersionType {
    case none
    case v1, v2
    
    var desc : String {
        switch self {
        case .none :
            return ""
        case .v1 :
            return "/v1"
        case .v2 :
            return "/v2"
        }
    }
}
