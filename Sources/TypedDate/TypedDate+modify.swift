import Foundation

@ModifyContext
public extension TypedDate<Year> {
    /// Modifies a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_YearModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _YearModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component  of  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_YearModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_YearModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MonthModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _MonthModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MonthModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MonthModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month, Day)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_DayModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _DayModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_DayModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_DayModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_HourModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _HourModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_HourModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_HourModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MinuteModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _MinuteModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MinuteModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_MinuteModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_SecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _SecondModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_SecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_SecondModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    /// Modifies a specific date component  with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func modifying<T: TypedDateUnit>(
        _ keyPath: KeyPath<_NanosecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) -> TypedDate<Components> {
        let context = _NanosecondModifyContext(base: components)
        var (target, transform) = context[keyPath: keyPath]
        modify(&target)
        return .init(transform(target), calendar: calendar)
    }

    /// Mutates  a specific date component with a provided modification closure.
    /// - Parameters:
    ///   - keyPath: Specify the Components of the Date you want to change by keyPath.
    ///   - modify: Closure to change the value.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    mutating func modify<T: TypedDateUnit>(
        _ keyPath: KeyPath<_NanosecondModifyContext, (T, (T) -> Components)>,
        calendar: Calendar = .current,
        modify: (inout T) -> Void
    ) {
        self = modifying(keyPath, calendar: calendar, modify: modify)
    }

    /// Adds a specific value to a date component.
    /// - Parameters:
    ///   - keyPath: A KeyPath specifying the date component to be modified.
    ///   - value: The value to be added.
    ///   - calendar: The calendar used for date calculations, defaults to the current calendar.
    /// - Returns: A new `TypedDate<Components>` instance with the modified component.
    func add<T: TypedDateUnit>(
        _ keyPath: KeyPath<_NanosecondModifyContext, (T, (T) -> Components)>,
        _ value: T,
        calendar: Calendar = .current
    ) -> TypedDate<Components> {
        modifying(keyPath, calendar: calendar, modify: { $0 += value })
    }
}
