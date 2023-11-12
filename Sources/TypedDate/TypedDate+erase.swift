import Foundation

@EraseContext
public extension TypedDate<(Year, Month)> {
    /// Type erase TypedDate<(Year, Month)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_MonthEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MonthEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

@EraseContext
public extension TypedDate<(Year, Month, Day)> {
    /// Type erase TypedDate<(Year, Month, Day)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_DayEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _DayEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour)> {
    /// Type erase TypedDate<(Year, Month, Day, Hour)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_HourEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _HourEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    /// Type erase TypedDate<(Year, Month, Day, Hour, Minute)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_MinuteEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MinuteEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    /// Type erase TypedDate<(Year, Month, Day, Hour, Minute, Second)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_SecondEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _SecondEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    /// Type erase TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> to the specified type.
    /// - Parameters:
    ///   - keyPath: Type erase up to the component of Date specified by KeyPath
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: type-erased instance
    func erase<T>(
        to keyPath: KeyPath<_NanosecondEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _NanosecondEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}
