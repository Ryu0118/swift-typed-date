import Foundation

extension Date {
    /// Returns a `TypedDate<T>` representing the specified date components.
    ///
    /// - Parameters:
    ///   - keyPath: A key path to the specific date component.
    ///   - calendar: The calendar used for date calculations. Defaults to the current calendar.
    /// - Returns: A `TypedDate<T>` representing the specified date components.
    @_disfavoredOverload
    public func scope<T>(
        to keyPath: KeyPath<_TypedDateContext, TypedDate<T>?>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        scope(to: keyPath, calendar: calendar)!
    }

    // To test that this method does not become nil, a @_disfavoredOverload attribute is given to the public method.
    func scope<T>(
        to keyPath: KeyPath<_TypedDateContext, TypedDate<T>?>,
        calendar: Calendar = .current
    ) -> TypedDate<T>? {
        _TypedDateContext(date: self, calendar: calendar)[keyPath: keyPath]
    }
}

public final class _TypedDateContext {
    private let date: Date
    private let calendar: Calendar

    public lazy var year: TypedDate<(Year)>? = .init(date: date, calendar: calendar)
    public lazy var month: TypedDate<(Year, Month)>? = .init(date: date, calendar: calendar)
    public lazy var day: TypedDate<(Year, Month, Day)>? = .init(date: date, calendar: calendar)
    public lazy var hour: TypedDate<(Year, Month, Day, Hour)>? = .init(date: date, calendar: calendar)
    public lazy var minute: TypedDate<(Year, Month, Day, Hour, Minute)>? = .init(date: date, calendar: calendar)
    public lazy var second: TypedDate<(Year, Month, Day, Hour, Minute, Second)>? = .init(date: date, calendar: calendar)
    public lazy var nanosecond: TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>? = .init(date: date, calendar: calendar)

    public init(date: Date, calendar: Calendar) {
        self.date = date
        self.calendar = calendar
    }
}

extension TypedDate {
    init?(
        date: Date,
        calendar: Calendar
    ) where Components == Year {
        let dc = calendar.dateComponents([.year], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year
        else {
            return nil
        }
        self.date = date
        self.components = Year(year)
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month) {
        let dc = calendar.dateComponents([.year, .month], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month
        else {
            return nil
        }
        self.date = date
        self.components = (Year(year), Month(month))
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month, Day) {
        let dc = calendar.dateComponents([.year, .month, .day], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month,
              let day = dc.day
        else {
            return nil
        }
        self.date = date
        self.components = (Year(year), Month(month), Day(day))
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month, Day, Hour) {
        let dc = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month,
              let day = dc.day,
              let hour = dc.hour
        else {
            return nil
        }
        self.date = date
        self.components = (Year(year), Month(month), Day(day), Hour(hour))
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month, Day, Hour, Minute) {
        let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month,
              let day = dc.day,
              let hour = dc.hour,
              let minute = dc.minute
        else {
            return nil
        }
        self.date = date
        self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute))
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month, Day, Hour, Minute, Second) {
        let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month,
              let day = dc.day,
              let hour = dc.hour,
              let minute = dc.minute,
              let second = dc.second
        else {
            return nil
        }
        self.date = date
        self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute), Second(second))
    }

    init?(
        date: Date,
        calendar: Calendar
    ) where Components == (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
        let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)
        guard let date = calendar.date(from: dc),
              let year = dc.year,
              let month = dc.month,
              let day = dc.day,
              let hour = dc.hour,
              let minute = dc.minute,
              let second = dc.second
        else {
            return nil
        }
        let nanosecond = dc.nanosecond ?? 0
        self.date = date
        self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute), Second(second), Nanosecond(nanosecond))
    }
}
