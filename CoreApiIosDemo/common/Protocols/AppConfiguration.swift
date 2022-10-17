import Foundation
import Combine

// App Configuration Base
protocol AppConfiguration {
    var baseURL : BaseURLType { get }
    var version : VersionType { get }
    func isVPNConnected() -> Bool
    func isJailBrokenDevice() -> Bool
    func enableCertificatePinning() -> Bool
}

// App Configuration Set Base
protocol AppConfigurable {
    static var setAppState : AppConfiguration { get }
}



