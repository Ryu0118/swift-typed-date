import Foundation

@FillInContext
public extension TypedDate<Year> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_YearFillInContext,(U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _YearFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}

@FillInContext
public extension TypedDate<(Year, Month)> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_MonthFillInContext,(U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MonthFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}

@FillInContext
public extension TypedDate<(Year, Month, Day)> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_DayFillInContext, (U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _DayFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}

@FillInContext
public extension TypedDate<(Year, Month, Day, Hour)> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_HourFillInContext, (U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _HourFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}

@FillInContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_MinuteFillInContext, (U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MinuteFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}

@FillInContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    /// Fill in missing Date components
    ///
    /// - Parameters:
    ///   - to: KeyPath for specifying components of a Date.
    ///   - arguments: Tuple of Components of Date to be filled.
    ///   - calendar: Calendar used for date calculations, defaults to the current calendar.
    /// - Returns: Instance of TypedDate with more Date Components.
    func fill<T, U>(
        to keyPath: KeyPath<_SecondFillInContext, (U) -> T>,
        arguments: U,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _SecondFillInContext(base: components)
        let transform = context[keyPath: keyPath]
        return .init(transform(arguments), calendar: calendar)
    }
}
