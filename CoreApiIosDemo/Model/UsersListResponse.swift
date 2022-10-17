import Foundation

struct UsersListResponse : Decodable {
    
    let title: String?
    var images = [String]()
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case images = "images"
    }
}
