import Foundation

@EraseContext
public extension TypedDate<(Year, Month)> {
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
    func erase<T>(
        to keyPath: KeyPath<_NanosecondEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _NanosecondEraseContext(base: components) [keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}
