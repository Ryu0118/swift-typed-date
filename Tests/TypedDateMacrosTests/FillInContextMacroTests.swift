import Foundation
import XCTest
import MacroTesting
import TypedDateCore
@testable import TypedDateMacros

final class FillInContextMacroTests: XCTestCase {
    override func invokeTest() {
        withMacroTesting(macros: ["FillInContext": FillInContextMacro.self]) {
            super.invokeTest()
        }
    }

    func testSecondExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {

                struct _SecondFillInContext {
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        (Nanosecond) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base.0, base.1, base.2, base.3, base.4, base.5, data) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_SecondFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _SecondFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }

    func testMinuteExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {

                struct _MinuteFillInContext {
                    public let second: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type,
                        (Second) -> (Year, Month, Day, Hour, Minute, Second)
                    )
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        ((Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                second = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self,
                    { data in (base.0, base.1, base.2, base.3, base.4, data) }
                )
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base.0, base.1, base.2, base.3, base.4, data.0, data.1) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_MinuteFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _MinuteFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }
    func testHourExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<(Year, Month, Day, Hour)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour)> {

                struct _HourFillInContext {
                    public let minute: (
                        TypedDate<(Year, Month, Day, Hour, Minute)>.Type,
                        (Minute) -> (Year, Month, Day, Hour, Minute)
                    )
                    public let second: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type,
                        ((Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    )
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        ((Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                minute = (
                    TypedDate<(Year, Month, Day, Hour, Minute)>.self,
                    { data in (base.0, base.1, base.2, base.3, data) }
                )
                second = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self,
                    { data in (base.0, base.1, base.2, base.3, data.0, data.1) }
                )
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base.0, base.1, base.2, base.3, data.0, data.1, data.2) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_HourFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _HourFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }
    func testDayExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<(Year, Month, Day)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day)> {

                struct _DayFillInContext {
                    public let hour: (
                        TypedDate<(Year, Month, Day, Hour)>.Type,
                        (Hour) -> (Year, Month, Day, Hour)
                    )
                    public let minute: (
                        TypedDate<(Year, Month, Day, Hour, Minute)>.Type,
                        ((Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    )
                    public let second: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type,
                        ((Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    )
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        ((Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                hour = (
                    TypedDate<(Year, Month, Day, Hour)>.self,
                    { data in (base.0, base.1, base.2, data) }
                )
                minute = (
                    TypedDate<(Year, Month, Day, Hour, Minute)>.self,
                    { data in (base.0, base.1, base.2, data.0, data.1) }
                )
                second = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self,
                    { data in (base.0, base.1, base.2, data.0, data.1, data.2) }
                )
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base.0, base.1, base.2, data.0, data.1, data.2, data.3) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_DayFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _DayFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }
    func testMonthExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<(Year, Month)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month)> {

                struct _MonthFillInContext {
                    public let day: (
                        TypedDate<(Year, Month, Day)>.Type,
                        (Day) -> (Year, Month, Day)
                    )
                    public let hour: (
                        TypedDate<(Year, Month, Day, Hour)>.Type,
                        ((Day, Hour)) -> (Year, Month, Day, Hour)
                    )
                    public let minute: (
                        TypedDate<(Year, Month, Day, Hour, Minute)>.Type,
                        ((Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    )
                    public let second: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type,
                        ((Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    )
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        ((Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                day = (
                    TypedDate<(Year, Month, Day)>.self,
                    { data in (base.0, base.1, data) }
                )
                hour = (
                    TypedDate<(Year, Month, Day, Hour)>.self,
                    { data in (base.0, base.1, data.0, data.1) }
                )
                minute = (
                    TypedDate<(Year, Month, Day, Hour, Minute)>.self,
                    { data in (base.0, base.1, data.0, data.1, data.2) }
                )
                second = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self,
                    { data in (base.0, base.1, data.0, data.1, data.2, data.3) }
                )
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base.0, base.1, data.0, data.1, data.2, data.3, data.4) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_MonthFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _MonthFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }

    func testYearExpansion() {
        assertMacro {
            """
            @FillInContext
            public extension TypedDate<Year> {}
            """
        } expansion: {
            """
            public extension TypedDate<Year> {

                struct _YearFillInContext {
                    public let month: (
                        TypedDate<(Year, Month)>.Type,
                        (Month) -> (Year, Month)
                    )
                    public let day: (
                        TypedDate<(Year, Month, Day)>.Type,
                        ((Month, Day)) -> (Year, Month, Day)
                    )
                    public let hour: (
                        TypedDate<(Year, Month, Day, Hour)>.Type,
                        ((Month, Day, Hour)) -> (Year, Month, Day, Hour)
                    )
                    public let minute: (
                        TypedDate<(Year, Month, Day, Hour, Minute)>.Type,
                        ((Month, Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    )
                    public let second: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type,
                        ((Month, Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    )
                    public let nanosecond: (
                        TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.Type,
                        ((Month, Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    )
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                month = (
                    TypedDate<(Year, Month)>.self,
                    { data in (base, data) }
                )
                day = (
                    TypedDate<(Year, Month, Day)>.self,
                    { data in (base, data.0, data.1) }
                )
                hour = (
                    TypedDate<(Year, Month, Day, Hour)>.self,
                    { data in (base, data.0, data.1, data.2) }
                )
                minute = (
                    TypedDate<(Year, Month, Day, Hour, Minute)>.self,
                    { data in (base, data.0, data.1, data.2, data.3) }
                )
                second = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self,
                    { data in (base, data.0, data.1, data.2, data.3, data.4) }
                )
                nanosecond = (
                    TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self,
                    { data in (base, data.0, data.1, data.2, data.3, data.4, data.5) }
                )
                    }
                }

                func fill<T, U>(
                          to keyPath: KeyPath<_YearFillInContext, (TypedDate<T>.Type, (U) -> T)>,
                          arguments: U,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _YearFillInContext(base: components)
                          let (_, transform) = context[keyPath: keyPath]
                          return .init(transform(arguments), calendar: calendar)
                 }}
            """
        }
    }
}

