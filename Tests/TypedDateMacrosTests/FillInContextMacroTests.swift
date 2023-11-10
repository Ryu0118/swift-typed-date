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
                    public let nanosecond: (Nanosecond) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                nanosecond = { data in (base.0, base.1, base.2, base.3, base.4, base.5, data) }
                    }
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
                    public let second: (Second) -> (Year, Month, Day, Hour, Minute, Second)
                    public let nanosecond: ((Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                second = { data in (base.0, base.1, base.2, base.3, base.4, data) }
                nanosecond = { data in (base.0, base.1, base.2, base.3, base.4, data.0, data.1) }
                    }
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
                    public let minute: (Minute) -> (Year, Month, Day, Hour, Minute)
                    public let second: ((Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    public let nanosecond: ((Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                minute = { data in (base.0, base.1, base.2, base.3, data) }
                second = { data in (base.0, base.1, base.2, base.3, data.0, data.1) }
                nanosecond = { data in (base.0, base.1, base.2, base.3, data.0, data.1, data.2) }
                    }
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
                    public let hour: (Hour) -> (Year, Month, Day, Hour)
                    public let minute: ((Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    public let second: ((Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    public let nanosecond: ((Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                hour = { data in (base.0, base.1, base.2, data) }
                minute = { data in (base.0, base.1, base.2, data.0, data.1) }
                second = { data in (base.0, base.1, base.2, data.0, data.1, data.2) }
                nanosecond = { data in (base.0, base.1, base.2, data.0, data.1, data.2, data.3) }
                    }
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
                    public let day: (Day) -> (Year, Month, Day)
                    public let hour: ((Day, Hour)) -> (Year, Month, Day, Hour)
                    public let minute: ((Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    public let second: ((Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    public let nanosecond: ((Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                day = { data in (base.0, base.1, data) }
                hour = { data in (base.0, base.1, data.0, data.1) }
                minute = { data in (base.0, base.1, data.0, data.1, data.2) }
                second = { data in (base.0, base.1, data.0, data.1, data.2, data.3) }
                nanosecond = { data in (base.0, base.1, data.0, data.1, data.2, data.3, data.4) }
                    }
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
                    public let month: (Month) -> (Year, Month)
                    public let day: ((Month, Day)) -> (Year, Month, Day)
                    public let hour: ((Month, Day, Hour)) -> (Year, Month, Day, Hour)
                    public let minute: ((Month, Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute)
                    public let second: ((Month, Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second)
                    public let nanosecond: ((Month, Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond)
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                month = { data in (base, data) }
                day = { data in (base, data.0, data.1) }
                hour = { data in (base, data.0, data.1, data.2) }
                minute = { data in (base, data.0, data.1, data.2, data.3) }
                second = { data in (base, data.0, data.1, data.2, data.3, data.4) }
                nanosecond = { data in (base, data.0, data.1, data.2, data.3, data.4, data.5) }
                    }
                }}
            """
        }
    }
}

