import Foundation

extension TypedDate: Hashable {
    /// `==` compares only `date`, and each `Components` is a separate type, so `date` is all the hash needs.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(date)
    }
}
