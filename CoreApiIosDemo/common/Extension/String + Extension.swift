import Foundation

extension String {
    
    static func isNilOrEmpty(string: String?) -> Bool {
        guard let value = string else { return true }
        return value.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
