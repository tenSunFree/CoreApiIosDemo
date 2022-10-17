import Foundation
import Combine

enum ViewModelStatus : Equatable {
    case loadStart
    case dismissAlert
}

protocol ViewModelBaseProtocol {
    var loadinState : CurrentValueSubject<ViewModelStatus, Never> { get set }
    var subscriber : Set<AnyCancellable> { get }
}

//ListViewModel
typealias listViewModel = ViewModelBaseProtocol & ListViewModelBaseProtocol

protocol ListViewModelBaseProtocol {
    func callUserListServie()
}


