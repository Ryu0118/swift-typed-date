import Foundation

package let allUnitNames = [
    Year.typeName,
    Month.typeName,
    Day.typeName,
    Hour.typeName,
    Minute.typeName,
    Second.typeName,
    Nanosecond.typeName
]

package extension TypedDateUnit {
    static var typeName: String {
        String(String(describing: Self.self))
    }
}

/// Representing a year.
public struct Year: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ year: Int) {
        self.value = year
    }
}

/// Representing a month.
public struct Month: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ month: Int) {
        self.value = month
    }
}

/// Representing a day.
public struct Day: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ day: Int) {
        self.value = day
    }
}

/// Representing a hour.
public struct Hour: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ hours: Int) {
        self.value = hours
    }
}

/// Representing a month.
public struct Minute: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}

/// Representing a second.
public struct Second: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ second: Int) {
        self.value = second
    }
}

/// Representing a nanosecond.
public struct Nanosecond: TypedDateUnit, Sendable {
    public let value: Int

    public init(_ nanosecond: Int) {
        self.value = nanosecond
    }
}

/// Representing a fractional second.
public struct FractionalSecond: Sendable {
    public let value: Double

    /// The whole seconds, rounded down, so `-1.5` is `-2` seconds plus `500_000_000` nanoseconds.
    public var seconds: Int {
        split.seconds
    }

    /// The fraction in nanoseconds, rounded to the nearest one. A fraction that rounds up to a whole second
    /// is carried into `seconds`.
    public var nanoseconds: Int {
        split.nanoseconds
    }

    public init(_ value: Double) {
        self.value = value
    }

    private var split: (seconds: Int, nanoseconds: Int) {
        let whole = value.rounded(.down)
        let nanoseconds = Int(((value - whole) * 1_000_000_000).rounded())
        return nanoseconds >= 1_000_000_000
            ? (Int(whole) + 1, nanoseconds - 1_000_000_000)
            : (Int(whole), nanoseconds)
    }
}
