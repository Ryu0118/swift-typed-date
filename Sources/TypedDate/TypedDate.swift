import Foundation

/// A `TypedDate` struct that encapsulates a `Date` object with associated date components.
/// This struct provides a type-safe way to handle dates with specific components,
/// such as year, month, day, etc. The `Components` type parameter defines the date components
/// associated with this `TypedDate`.
public struct TypedDate<Components: Sendable>: TypedDateProtocol, Sendable {
    /// The underlying `Date` object.
    /// This property stores the actual date value represented by the `TypedDate` instance.
    public let date: Date

    /// The components associated with the `TypedDate`.
    /// These components are of the type specified by the `Components` generic parameter,
    /// and they represent various aspects of the date, such as year, month, day, etc.
    let components: Components
}
