import Foundation

@FillInContext
public extension TypedDate<Year> {
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
