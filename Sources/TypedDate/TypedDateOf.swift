import Foundation

/// A convenience type alias that represents a `TypedDate` with only the year component.
public typealias TypedDateOfYear = TypedDate<Year>

/// A convenience type alias that represents a `TypedDate` with the year and month components.
public typealias TypedDateOfMonth = TypedDate<(Year, Month)>

/// A convenience type alias that represents a `TypedDate` with the year, month, and day components.
public typealias TypedDateOfDay = TypedDate<(Year, Month, Day)>

/// A convenience type alias that represents a `TypedDate` with the year, month, day, and hour components.
public typealias TypedDateOfHour = TypedDate<(Year, Month, Day, Hour)>

/// A convenience type alias that represents a `TypedDate` with the year, month, day, hour, and minute components.
public typealias TypedDateOfMinute = TypedDate<(Year, Month, Day, Hour, Minute)>

/// A convenience type alias that represents a `TypedDate` with the year, month, day, hour, minute, and second components.
public typealias TypedDateOfSecond = TypedDate<(Year, Month, Day, Hour, Minute, Second)>

/// A convenience type alias that represents a `TypedDate` with the year, month, day, hour, minute, second, and nanosecond components.
public typealias TypedDateOfNanosecond = TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>

public extension TypedDateOfYear {
    /// Returns a `TypedDate` instance that represents the current year, at the moment of access.
    static var now: Self {
        Date().scope(to: \.year)
    }
}

public extension TypedDateOfMonth {
    /// Returns a `TypedDate` instance that represents the current year and month, at the moment of access.
    static var now: Self {
        Date().scope(to: \.month)
    }
}

public extension TypedDateOfDay {
    /// Returns a `TypedDate` instance that represents the current year, month, and day, at the moment of access.
    static var now: Self {
        Date().scope(to: \.day)
    }
}

public extension TypedDateOfHour {
    /// Returns a `TypedDate` instance that represents the current year, month, day, and hour, at the moment of access.
    static var now: Self {
        Date().scope(to: \.hour)
    }
}

public extension TypedDateOfMinute {
    /// Returns a `TypedDate` instance that represents the current year, month, day, hour, and minute, at the moment of access.
    static var now: Self {
        Date().scope(to: \.minute)
    }
}

public extension TypedDateOfSecond {
    /// Returns a `TypedDate` instance that represents the current year, month, day, hour, minute, and second, at the moment of access.
    static var now: Self {
        Date().scope(to: \.second)
    }
}

public extension TypedDateOfNanosecond {
    /// Returns a `TypedDate` instance that represents the current year, month, day, hour, minute, second, and nanosecond, at the moment of access.
    static var now: Self {
        Date().scope(to: \.nanosecond)
    }
}
