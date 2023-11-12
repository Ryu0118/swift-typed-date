import Foundation

/// `TypedDate<Year>` extension. This allows you to get the year component of a date.
public extension TypedDate<Year> {
    /// Returns the year component of `TypedDate<Year>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.value
    }
}

/// `TypedDate<(Year, Month)>` extension. This allows you to get the year and month components of a date.
public extension TypedDate<(Year, Month)> {
    /// Returns the year component of `TypedDate<(Year, Month)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }
}

/// `TypedDate<(Year, Month, Day)>` extension. This allows you to get the year, month, and day components of a date.
public extension TypedDate<(Year, Month, Day)> {
    /// Returns the year component of `TypedDate<(Year, Month, Day)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month, Day)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    /// Returns the day component of `TypedDate<(Year, Month, Day)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }
}

/// `TypedDate<(Year, Month, Day, Hour)>` extension. This allows you to get the year, month, day, and hour components of a date.
public extension TypedDate<(Year, Month, Day, Hour)> {
    /// Returns the year component of `TypedDate<(Year, Month, Day, Hour)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month, Day, Hour)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    /// Returns the day component of `TypedDate<(Year, Month, Day, Hour)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    /// Returns the hour component of `TypedDate<(Year, Month, Day, Hour)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }
}

/// `TypedDate<(Year, Month, Day, Hour, Minute)>` extension. This allows you to get the year, month, day, hour, and minute components of a date.
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    /// Returns the year component of `TypedDate<(Year, Month, Day, Hour, Minute)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month, Day, Hour, Minute)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    /// Returns the day component of `TypedDate<(Year, Month, Day, Hour, Minute)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    /// Returns the hour component of `TypedDate<(Year, Month, Day, Hour, Minute)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    /// Returns the minute component of `TypedDate<(Year, Month, Day, Hour, Minute)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }
}

/// `TypedDate<(Year, Month, Day, Hour, Minute, Second)>` extension. This allows you to get the year, month, day, hour, minute, and second components of a date.
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    /// Returns the year component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    /// Returns the day component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    /// Returns the hour component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    /// Returns the minute component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }

    /// Returns the second component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: The second component as an Int.
    func second(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date).second ?? components.5.value
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    /// Returns the year component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the year component of the date as an integer value.
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    /// Returns the month component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the month component of the date as an integer value.
    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    /// Returns the day component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the day component of the date as an integer value.
    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    /// Returns the hour component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the hour component of the date as an integer value.
    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    /// Returns the minute component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the minute component of the date as an integer value.
    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }

    /// Returns the second component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the second component of the date as an integer value.
    func second(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date).second ?? components.5.value
    }

    /// Returns the nanosecond component of `TypedDate<(Year, Month, Day, Hour, Minute, Second)>`.
    /// - Parameter calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Returns the nanosecond component of the date as an integer value.
    func nanosecond(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.nanosecond], from: date).nanosecond ?? components.6.value
    }
}
