import Foundation

/// `TypedDate` is a structure for handling dates in a type-safe manner.
public extension TypedDate {
    /// Initializes a `TypedDate` by specifying the year.
    /// - Parameters:
    ///   - year: The year component of the date.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of `TypedDate` with the year component.
    init(_ year: Year, calendar: Calendar = .current) where Components == Year {
        (date, components) = TypedDateNormalizer.make(year, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, day, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, day, hour, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, day, hour, minute, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, day, hour, minute, second, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(year, month, day, hour, minute, second, nanosecond, calendar: calendar)
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
        (date, components) = TypedDateNormalizer.make(
            year, month, day, hour, minute,
            Second(fractionalSecond.seconds), Nanosecond(fractionalSecond.nanoseconds),
            calendar: calendar
        )
    }
}

extension TypedDate {
    /// Dispatches on the metatype rather than casting the value: casting a tuple with `as` walks the runtime
    /// type metadata, and `modify`, `fill` and `erase` all come through here.
    init(_ components: Components, calendar: Calendar = .current) {
        switch Components.self {
        case is Year.Type:
            (date, self.components) = Self.erased(TypedDateNormalizer.make(Self.cast(components), calendar: calendar))
        case is (Year, Month).Type:
            let c: (Year, Month) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, calendar: calendar))
        case is (Year, Month, Day).Type:
            let c: (Year, Month, Day) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, c.2, calendar: calendar))
        case is (Year, Month, Day, Hour).Type:
            let c: (Year, Month, Day, Hour) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, c.2, c.3, calendar: calendar))
        case is (Year, Month, Day, Hour, Minute).Type:
            let c: (Year, Month, Day, Hour, Minute) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, c.2, c.3, c.4, calendar: calendar))
        case is (Year, Month, Day, Hour, Minute, Second).Type:
            let c: (Year, Month, Day, Hour, Minute, Second) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, c.2, c.3, c.4, c.5, calendar: calendar))
        case is (Year, Month, Day, Hour, Minute, Second, Nanosecond).Type:
            let c: (Year, Month, Day, Hour, Minute, Second, Nanosecond) = Self.cast(components)
            (date, self.components) = Self.erased(TypedDateNormalizer.make(c.0, c.1, c.2, c.3, c.4, c.5, c.6, calendar: calendar))
        default:
            fatalError(
                """
                Unexpected components: \(components)
                """
            )
        }
    }

    /// Only called after the `switch` above has matched `Components` against `T`, so both are the same type.
    private static func cast<T>(_ components: Components) -> T {
        unsafeBitCast(components, to: T.self)
    }

    private static func erased<T>(_ made: (Date, T)) -> (Date, Components) {
        (made.0, unsafeBitCast(made.1, to: Components.self))
    }
}

/// Builds the date from the units and reads the units back from it, so overflowing input (`Month(13)`, `Day(32)`)
/// is stored in its normalized form. Equal dates then behave the same in `modify`, `fill` and `erase`.
enum TypedDateNormalizer {
    static func make(_ year: Year, calendar: Calendar) -> (Date, Year) {
        if isGregorian(calendar) {
            return (calendar.date(from: DateComponents(year: year.value))!, year)
        }
        let (date, dc) = build(DateComponents(year: year.value), units: [.year], calendar: calendar)
        return (date, Year(dc.year ?? year.value))
    }

    /// In the Gregorian calendar, a month in 1...12 and a day in 1...28 never overflow, and the year, month and day
    /// read back unchanged even where midnight is skipped by a time zone change. Reading them back would only cost
    /// another calendar call. Hours and smaller units are always read back, because a skipped hour moves them.
    private static func isGregorian(_ calendar: Calendar) -> Bool {
        calendar.identifier == .gregorian || calendar.identifier == .iso8601
    }

    static func make(_ year: Year, _ month: Month, calendar: Calendar) -> (Date, (Year, Month)) {
        if isGregorian(calendar), (1...12).contains(month.value) {
            return (calendar.date(from: DateComponents(year: year.value, month: month.value))!, (year, month))
        }
        let (date, dc) = build(
            DateComponents(year: year.value, month: month.value),
            units: [.year, .month],
            calendar: calendar
        )
        return (date, (Year(dc.year ?? year.value), Month(dc.month ?? month.value)))
    }

    static func make(_ year: Year, _ month: Month, _ day: Day, calendar: Calendar) -> (Date, (Year, Month, Day)) {
        if isGregorian(calendar), (1...12).contains(month.value), (1...28).contains(day.value) {
            let date = calendar.date(from: DateComponents(year: year.value, month: month.value, day: day.value))!
            return (date, (year, month, day))
        }
        let (date, dc) = build(
            DateComponents(year: year.value, month: month.value, day: day.value),
            units: [.year, .month, .day],
            calendar: calendar
        )
        return (date, (Year(dc.year ?? year.value), Month(dc.month ?? month.value), Day(dc.day ?? day.value)))
    }

    static func make(
        _ year: Year, _ month: Month, _ day: Day, _ hour: Hour,
        calendar: Calendar
    ) -> (Date, (Year, Month, Day, Hour)) {
        let (date, dc) = build(
            DateComponents(year: year.value, month: month.value, day: day.value, hour: hour.value),
            units: [.year, .month, .day, .hour],
            calendar: calendar
        )
        return (
            date,
            (Year(dc.year ?? year.value), Month(dc.month ?? month.value), Day(dc.day ?? day.value), Hour(dc.hour ?? hour.value))
        )
    }

    static func make(
        _ year: Year, _ month: Month, _ day: Day, _ hour: Hour, _ minute: Minute,
        calendar: Calendar
    ) -> (Date, (Year, Month, Day, Hour, Minute)) {
        let (date, dc) = build(
            DateComponents(year: year.value, month: month.value, day: day.value, hour: hour.value, minute: minute.value),
            units: [.year, .month, .day, .hour, .minute],
            calendar: calendar
        )
        return (
            date,
            (
                Year(dc.year ?? year.value),
                Month(dc.month ?? month.value),
                Day(dc.day ?? day.value),
                Hour(dc.hour ?? hour.value),
                Minute(dc.minute ?? minute.value)
            )
        )
    }

    static func make(
        _ year: Year, _ month: Month, _ day: Day, _ hour: Hour, _ minute: Minute, _ second: Second,
        calendar: Calendar
    ) -> (Date, (Year, Month, Day, Hour, Minute, Second)) {
        let (date, dc) = build(
            DateComponents(
                year: year.value, month: month.value, day: day.value,
                hour: hour.value, minute: minute.value, second: second.value
            ),
            units: [.year, .month, .day, .hour, .minute, .second],
            calendar: calendar
        )
        return (
            date,
            (
                Year(dc.year ?? year.value),
                Month(dc.month ?? month.value),
                Day(dc.day ?? day.value),
                Hour(dc.hour ?? hour.value),
                Minute(dc.minute ?? minute.value),
                Second(dc.second ?? second.value)
            )
        )
    }

    /// `Date` is a `Double`, so reading the nanosecond back from it is off by up to a few hundred nanoseconds
    /// (and can round up into the next second). The nanosecond is carried into the second by integer arithmetic
    /// instead, and the other units are read back from the date without it.
    static func make(
        _ year: Year, _ month: Month, _ day: Day, _ hour: Hour, _ minute: Minute, _ second: Second, _ nanosecond: Nanosecond,
        calendar: Calendar
    ) -> (Date, (Year, Month, Day, Hour, Minute, Second, Nanosecond)) {
        let perSecond = 1_000_000_000
        let carry = nanosecond.value >= 0
            ? nanosecond.value / perSecond
            : -((-nanosecond.value - 1) / perSecond + 1)
        let nanosecond = nanosecond.value - carry * perSecond
        let (wholeSecond, normalized) = make(year, month, day, hour, minute, Second(second.value + carry), calendar: calendar)
        let date = nanosecond == 0
            ? wholeSecond
            : calendar.date(
                from: DateComponents(
                    year: normalized.0.value, month: normalized.1.value, day: normalized.2.value,
                    hour: normalized.3.value, minute: normalized.4.value, second: normalized.5.value,
                    nanosecond: nanosecond
                )
            )!
        return (
            date,
            (normalized.0, normalized.1, normalized.2, normalized.3, normalized.4, normalized.5, Nanosecond(nanosecond))
        )
    }

    private static func build(
        _ components: DateComponents,
        units: Set<Calendar.Component>,
        calendar: Calendar
    ) -> (Date, DateComponents) {
        let date = calendar.date(from: components)!
        return (date, calendar.dateComponents(units, from: date))
    }
}
