import Foundation

public protocol TypedDateUnit {
}

public struct Year: TypedDateUnit {
    public let value: Int

    public init(_ year: Int) {
        self.value = year
    }
}

public struct Month: TypedDateUnit {
    public let value: Int

    public init(_ month: Int) {
        self.value = month
    }
}

public struct Day: TypedDateUnit {
    public let value: Int

    public init(_ day: Int) {
        self.value = day
    }
}

public struct Hour: TypedDateUnit {
    public let value: Int

    public init(_ hours: Int) {
        self.value = hours
    }
}

public struct Minute: TypedDateUnit {
    public let value: Int

    public init(_ value: Int) {
        self.value = value
    }
}

public struct Second: TypedDateUnit {
    public let value: Int

    public init(_ second: Int) {
        self.value = second
    }
}

public struct Nanosecond: TypedDateUnit {
    public let value: Int

    public init(_ nanosecond: Int) {
        self.value = nanosecond
    }
}

public struct FractionalSecond: TypedDateUnit {
    public let value: Double

    public var seconds: Int {
        Int(value)
    }
    public var nanoseconds: Int {
        Int((value - Double(seconds)) * 1_000_000_000)
    }

    public init(_ value: Double) {
        self.value = value
    }
}
