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
                    public var nanosecond: (Nanosecond) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, base.4, base.5, data)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
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
                    public var second: (Second) -> (Year, Month, Day, Hour, Minute, Second) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, base.4, data)
                        }
                    }
                    public var nanosecond: ((Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, base.4, data.0, data.1)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
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
                    public var minute: (Minute) -> (Year, Month, Day, Hour, Minute) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, data)
                        }
                    }
                    public var second: ((Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, data.0, data.1)
                        }
                    }
                    public var nanosecond: ((Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base.0, base.1, base.2, base.3, data.0, data.1, data.2)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
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
                    public var hour: (Hour) -> (Year, Month, Day, Hour) {
                        { [base] data in
                            (base.0, base.1, base.2, data)
                        }
                    }
                    public var minute: ((Hour, Minute)) -> (Year, Month, Day, Hour, Minute) {
                        { [base] data in
                            (base.0, base.1, base.2, data.0, data.1)
                        }
                    }
                    public var second: ((Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second) {
                        { [base] data in
                            (base.0, base.1, base.2, data.0, data.1, data.2)
                        }
                    }
                    public var nanosecond: ((Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base.0, base.1, base.2, data.0, data.1, data.2, data.3)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
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
                    public var day: (Day) -> (Year, Month, Day) {
                        { [base] data in
                            (base.0, base.1, data)
                        }
                    }
                    public var hour: ((Day, Hour)) -> (Year, Month, Day, Hour) {
                        { [base] data in
                            (base.0, base.1, data.0, data.1)
                        }
                    }
                    public var minute: ((Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute) {
                        { [base] data in
                            (base.0, base.1, data.0, data.1, data.2)
                        }
                    }
                    public var second: ((Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second) {
                        { [base] data in
                            (base.0, base.1, data.0, data.1, data.2, data.3)
                        }
                    }
                    public var nanosecond: ((Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base.0, base.1, data.0, data.1, data.2, data.3, data.4)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
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
                    public var month: (Month) -> (Year, Month) {
                        { [base] data in
                            (base, data)
                        }
                    }
                    public var day: ((Month, Day)) -> (Year, Month, Day) {
                        { [base] data in
                            (base, data.0, data.1)
                        }
                    }
                    public var hour: ((Month, Day, Hour)) -> (Year, Month, Day, Hour) {
                        { [base] data in
                            (base, data.0, data.1, data.2)
                        }
                    }
                    public var minute: ((Month, Day, Hour, Minute)) -> (Year, Month, Day, Hour, Minute) {
                        { [base] data in
                            (base, data.0, data.1, data.2, data.3)
                        }
                    }
                    public var second: ((Month, Day, Hour, Minute, Second)) -> (Year, Month, Day, Hour, Minute, Second) {
                        { [base] data in
                            (base, data.0, data.1, data.2, data.3, data.4)
                        }
                    }
                    public var nanosecond: ((Month, Day, Hour, Minute, Second, Nanosecond)) -> (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
                        { [base] data in
                            (base, data.0, data.1, data.2, data.3, data.4, data.5)
                        }
                    }
                    private let base: Components
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
            """
        }
    }
}

