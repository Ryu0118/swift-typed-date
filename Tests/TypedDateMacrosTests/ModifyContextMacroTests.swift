import Foundation
import XCTest
import MacroTesting
import TypedDateCore
@testable import TypedDateMacros

final class ModifyContextMacroTests: XCTestCase {
    override func invokeTest() {
        withMacroTesting(macros: ["ModifyContext": ModifyContextMacro.self]) {
            super.invokeTest()
        }
    }

    func testNanosecondExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {

                struct _NanosecondModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    public let day: (Day, (Day) -> Components)
                    public let hour: (Hour, (Hour) -> Components)
                    public let minute: (Minute, (Minute) -> Components)
                    public let second: (Second, (Second) -> Components)
                    public let nanosecond: (Nanosecond, (Nanosecond) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1, base.2, base.3, base.4, base.5, base.6) })
                self.month = (base.1, { month in (base.0, month, base.2, base.3, base.4, base.5, base.6) })
                self.day = (base.2, { day in (base.0, base.1, day, base.3, base.4, base.5, base.6) })
                self.hour = (base.3, { hour in (base.0, base.1, base.2, hour, base.4, base.5, base.6) })
                self.minute = (base.4, { minute in (base.0, base.1, base.2, base.3, minute, base.5, base.6) })
                self.second = (base.5, { second in (base.0, base.1, base.2, base.3, base.4, second, base.6) })
                self.nanosecond = (base.6, { nanosecond in (base.0, base.1, base.2, base.3, base.4, base.5, nanosecond) })
                    }
                }
            }
            """
        }
    }

    func testSecondExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {

                struct _SecondModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    public let day: (Day, (Day) -> Components)
                    public let hour: (Hour, (Hour) -> Components)
                    public let minute: (Minute, (Minute) -> Components)
                    public let second: (Second, (Second) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1, base.2, base.3, base.4, base.5) })
                self.month = (base.1, { month in (base.0, month, base.2, base.3, base.4, base.5) })
                self.day = (base.2, { day in (base.0, base.1, day, base.3, base.4, base.5) })
                self.hour = (base.3, { hour in (base.0, base.1, base.2, hour, base.4, base.5) })
                self.minute = (base.4, { minute in (base.0, base.1, base.2, base.3, minute, base.5) })
                self.second = (base.5, { second in (base.0, base.1, base.2, base.3, base.4, second) })
                    }
                }
            }
            """
        }
    }

    func testMinuteExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {

                struct _MinuteModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    public let day: (Day, (Day) -> Components)
                    public let hour: (Hour, (Hour) -> Components)
                    public let minute: (Minute, (Minute) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1, base.2, base.3, base.4) })
                self.month = (base.1, { month in (base.0, month, base.2, base.3, base.4) })
                self.day = (base.2, { day in (base.0, base.1, day, base.3, base.4) })
                self.hour = (base.3, { hour in (base.0, base.1, base.2, hour, base.4) })
                self.minute = (base.4, { minute in (base.0, base.1, base.2, base.3, minute) })
                    }
                }
            }
            """
        }
    }

    func testHourExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour)> {

                struct _HourModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    public let day: (Day, (Day) -> Components)
                    public let hour: (Hour, (Hour) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1, base.2, base.3) })
                self.month = (base.1, { month in (base.0, month, base.2, base.3) })
                self.day = (base.2, { day in (base.0, base.1, day, base.3) })
                self.hour = (base.3, { hour in (base.0, base.1, base.2, hour) })
                    }
                }
            }
            """
        }
    }

    func testDayExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month, Day)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day)> {

                struct _DayModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    public let day: (Day, (Day) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1, base.2) })
                self.month = (base.1, { month in (base.0, month, base.2) })
                self.day = (base.2, { day in (base.0, base.1, day) })
                    }
                }
            }
            """
        }
    }

    func testMonthExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year, Month)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month)> {

                struct _MonthModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    public let month: (Month, (Month) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base.0, { year in (year, base.1) })
                self.month = (base.1, { month in (base.0, month) })
                    }
                }
            }
            """
        }
    }

    func testYearExpansion() {
        assertMacro {
            """
            @ModifyContext
            public extension TypedDate<(Year)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year)> {

                struct _YearModifyContext {
                    private let base: Components
                    public let year: (Year, (Year) -> Components)
                    init(base: Components) {
                        self.base = base
                self.year = (base, { year in (year) })
                    }
                }
            }
            """
        }
    }
}
