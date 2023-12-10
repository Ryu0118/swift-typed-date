import Foundation

/// The base protocol for typed date
public protocol TypedDateProtocol: Hashable, Codable, Equatable, Comparable {
    var date: Date { get }
}
