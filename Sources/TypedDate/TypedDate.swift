import Foundation

public struct TypedDate<Components: Sendable>: Sendable {
    public let date: Date

    package let components: Components
}
