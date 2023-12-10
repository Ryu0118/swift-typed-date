import Foundation

/// The base protocol for typed date
public protocol TypedDateProtocol: Hashable, Codable, Equatable {
    var date: Date { get }
}
