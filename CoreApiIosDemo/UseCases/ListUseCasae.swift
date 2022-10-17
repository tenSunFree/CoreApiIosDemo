import Foundation
import Combine

protocol UsersListProtocol {
    func getUserData() -> AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError>
}

class UserListRequest : BaseAPI<Networking>, UsersListProtocol {
    func getUserData() -> AnyPublisher<BaseResponse<[UsersListResponse]>?, APIError> {
        self.fetchData(target: .users, responseClass: BaseResponse<[UsersListResponse]>.self)
    }
}
