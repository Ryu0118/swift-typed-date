import Foundation
import XCTest
import MacroTesting
import TypedDateCore
@testable import TypedDateMacros

final class EraseContextMacroTests: XCTestCase {
    override func invokeTest() {
        withMacroTesting(macros: ["EraseContext": EraseContextMacro.self]) {
            super.invokeTest()
        }
    }

    func testNanosecondExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {

                struct _NanosecondEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    public let month: (TypedDate<(Year, Month)>.Type, (Year, Month))
                    public let day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day))
                    public let hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour))
                    public let minute: (TypedDate<(Year, Month, Day, Hour, Minute)>.Type, (Year, Month, Day, Hour, Minute))
                    public let second: (TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type, (Year, Month, Day, Hour, Minute, Second))
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
                day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
                minute = (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
                second = (TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self, (base.0, base.1, base.2, base.3, base.4, base.5))
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_NanosecondEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _NanosecondEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }

    func testSecondExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {

                struct _SecondEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    public let month: (TypedDate<(Year, Month)>.Type, (Year, Month))
                    public let day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day))
                    public let hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour))
                    public let minute: (TypedDate<(Year, Month, Day, Hour, Minute)>.Type, (Year, Month, Day, Hour, Minute))
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
                day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
                minute = (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_SecondEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _SecondEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }

    func testMinuteExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {

                struct _MinuteEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    public let month: (TypedDate<(Year, Month)>.Type, (Year, Month))
                    public let day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day))
                    public let hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour))
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
                day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_MinuteEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _MinuteEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }
    func testHourExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour)> {

                struct _HourEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    public let month: (TypedDate<(Year, Month)>.Type, (Year, Month))
                    public let day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day))
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
                day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_HourEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _HourEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }
    func testDayExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month, Day)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day)> {

                struct _DayEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    public let month: (TypedDate<(Year, Month)>.Type, (Year, Month))
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_DayEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _DayEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }
    func testMonthExpansion() {
        assertMacro {
            """
            @EraseContext
            public extension TypedDate<(Year, Month)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month)> {

                struct _MonthEraseContext {
                    private let base: Components
                    public let year: (TypedDate<Year>.Type, Year)
                    init(base: Components) {
                        self.base = base
                year = (TypedDate<Year>.self, base.0)
                    }
                }

                func erase<T>(
                          to keyPath: KeyPath<_MonthEraseContext, (TypedDate<T>.Type, T)>,
                          calendar: Calendar = .current
                 ) -> TypedDate<T> {
                          let context = _MonthEraseContext(base: components) [keyPath: keyPath]
                          return context.0.init(context.1, calendar: calendar)
                 }}
            """
        }
    }
}
