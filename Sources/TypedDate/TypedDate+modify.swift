import Foundation

/// Extension for `TypedDate<Year>`. Allows for modifying the year component of a date.
@ModifyContext
public extension TypedDate<Year> {
    /// Modifies the year component of `TypedDate<Year>` with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: KeyPath to the year modify context.
    ///   - modify: Closure that takes an inout parameter of type T for modification.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with modified year component.
    func modifying<T>(
        _ keyPath: KeyPath<_YearModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _YearModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year component of `TypedDate<Year>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_YearModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year' and 'Month'.
@ModifyContext
public extension TypedDate<(Year, Month)> {
    /// Modifies the year and month components of `TypedDate<Year, Month>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_MonthModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _MonthModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year and month components of `TypedDate<Year, Month>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_MonthModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year', 'Month', and 'Day'.
@ModifyContext
public extension TypedDate<(Year, Month, Day)> {
    /// Modifies the year, month, and day components of `TypedDate<Year, Month, Day>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_DayModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _DayModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year, month, and day components of `TypedDate<Year, Month, Day>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_DayModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year', 'Month', 'Day', and 'Hour'.
@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour)> {
    /// Modifies the year, month, day, and hour components of `TypedDate<Year, Month, Day, Hour>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_HourModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _HourModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year, month, day, and hour components of `TypedDate<Year, Month, Day, Hour>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_HourModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year', 'Month', 'Day', 'Hour', and 'Minute'.
@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    /// Modifies the year, month, day, hour, and minute components of `TypedDate<Year, Month, Day, Hour, Minute>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_MinuteModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _MinuteModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year, month, day, hour, and minute components of `TypedDate<Year, Month, Day, Hour, Minute>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_MinuteModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year', 'Month', 'Day', 'Hour', 'Minute', and 'Second'.
@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    /// Modifies the year, month, day, hour, minute, and second components of `TypedDate<Year, Month, Day, Hour, Minute, Second>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_SecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _SecondModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year, month, day, hour, minute, and second components of `TypedDate<Year, Month, Day, Hour, Minute, Second>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_SecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}

/// Extension for `TypedDate` combining 'Year', 'Month', 'Day', 'Hour', 'Minute', 'Second', and 'Nanosecond'.
@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    /// Modifies the year, month, day, hour, minute, second, and nanosecond components of `TypedDate<Year, Month, Day, Hour, Minute, Second, Nanosecond>` with a provided modification closure.
    func modifying<T>(
        _ keyPath: KeyPath<_NanosecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _NanosecondModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates the year, month, day, hour, minute, second, and nanosecond components of `TypedDate<Year, Month, Day, Hour, Minute, Second, Nanosecond>` instance.
    mutating func modify<T>(
        _ keyPath: KeyPath<_NanosecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }
}
