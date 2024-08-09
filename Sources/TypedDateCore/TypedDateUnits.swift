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

    public var seconds: Int {
        Int(value)
    }
    public var nanoseconds: Int {
        Int((value - floor(value)) * 1_000_000_000)
    }

    public init(_ value: Double) {
        self.value = value
    }
}
