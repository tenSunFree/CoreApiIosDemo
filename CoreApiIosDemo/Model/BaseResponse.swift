import Foundation

class BaseResponse<T: Decodable>: Decodable {
    
    var page, perPage, total, totalPages: Int?
    var products: T?
    
    private enum CodingKeys: String, CodingKey {
        case page = "page"
        case perPage = "per_page"
        case total = "total"
        case products = "products"
        case totalPages = "total_pages"
    }
}
