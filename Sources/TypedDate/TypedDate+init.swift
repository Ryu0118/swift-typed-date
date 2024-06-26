import Foundation

/// `TypedDate` is a structure for handling dates in a type-safe manner.
public extension TypedDate {
    /// Initializes a `TypedDate` by specifying the year.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year component.
    init(_ year: Year, calendar: Calendar = .current) where Components == Year {
        self.components = year
        self.date = DateComponents(
            calendar: calendar,
            year: year.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year and month.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year and month components.
    init(
        _ year: Year,
        _ month: Month,
        calendar: Calendar = .current
    )  where Components == (Year, Month) {
        self.components = (year, month)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, and day.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, and day components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day) {
        self.components = (year, month, day)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, day, and hour.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - hour: The hour component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, day, and hour components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour) {
        self.components = (year, month, day, hour)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, day, hour, and minute.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - hour: The hour component of the date.
    ///   - minute: The minute component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, day, hour, and minute components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute) {
        self.components = (year, month, day, hour, minute)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, day, hour, minute, and second.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - hour: The hour component of the date.
    ///   - minute: The minute component of the date.
    ///   - second: The second component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, day, hour, minute, and second components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ second: Second,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second) {
        self.components = (year, month, day, hour, minute, second)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: second.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, day, hour, minute, second, and nanosecond.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - hour: The hour component of the date.
    ///   - minute: The minute component of the date.
    ///   - second: The second component of the date.
    ///   - nanosecond: The nanosecond component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, day, hour, minute, second, and nanosecond components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ second: Second,
        _ nanosecond: Nanosecond,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
        self.components = (year, month, day, hour, minute, second, nanosecond)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: second.value,
            nanosecond: nanosecond.value
        ).date!
    }

    /// Initializes a `TypedDate` by specifying the year, month, day, hour, minute, and fractional second.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - month: The month component of the date.
    ///   - day: The day component of the date.
    ///   - hour: The hour component of the date.
    ///   - minute: The minute component of the date.
    ///   - fractionalSecond: The fractional second component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year, month, day, hour, minute, and fractional second components.
    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ fractionalSecond: FractionalSecond,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
        self.components = (year, month, day, hour, minute, Second(fractionalSecond.seconds), Nanosecond(fractionalSecond.nanoseconds))
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: components.5.value,
            nanosecond: components.6.value
        ).date!
    }
}

extension TypedDate {
    init(_ components: Components, calendar: Calendar = .current) {
        switch components {
        case let components as Year:
            self.date = DateComponents(
                calendar: calendar,
                year: components.value
            ).date!
            self.components = Year(date.year(calendar: calendar) ?? components.value) as! Components
        case let components as (Year, Month):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value)
            ) as! Components
        case let components as (Year, Month, Day):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value),
                Day(date.day(calendar: calendar) ?? components.2.value)
            ) as! Components
        case let components as (Year, Month, Day, Hour):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value),
                Day(date.day(calendar: calendar) ?? components.2.value),
                Hour(date.hour(calendar: calendar) ?? components.3.value)
            ) as! Components
        case let components as (Year, Month, Day, Hour, Minute):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value),
                Day(date.day(calendar: calendar) ?? components.2.value),
                Hour(date.hour(calendar: calendar) ?? components.3.value),
                Minute(date.minute(calendar: calendar) ?? components.4.value)
            ) as! Components
        case let components as (Year, Month, Day, Hour, Minute, Second):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value,
                second: components.5.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value),
                Day(date.day(calendar: calendar) ?? components.2.value),
                Hour(date.hour(calendar: calendar) ?? components.3.value),
                Minute(date.minute(calendar: calendar) ?? components.4.value),
                Second(date.second(calendar: calendar) ?? components.5.value)
            ) as! Components
        case let components as (Year, Month, Day, Hour, Minute, Second, Nanosecond):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value,
                second: components.5.value,
                nanosecond: components.6.value
            ).date!
            self.components = (
                Year(date.year(calendar: calendar) ?? components.0.value),
                Month(date.month(calendar: calendar) ?? components.1.value),
                Day(date.day(calendar: calendar) ?? components.2.value),
                Hour(date.hour(calendar: calendar) ?? components.3.value),
                Minute(date.minute(calendar: calendar) ?? components.4.value),
                Second(date.second(calendar: calendar) ?? components.5.value),
                Nanosecond(date.nanosecond(calendar: calendar) ?? components.6.value)
            ) as! Components

        default:
            fatalError(
                """
                Unexpected components: \(components)
                """
            )
        }
    }
}
