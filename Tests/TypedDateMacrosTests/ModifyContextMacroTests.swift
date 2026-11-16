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
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1, base.2, base.3, base.4, base.5, base.6)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month, base.2, base.3, base.4, base.5, base.6)
                            })
                    }
                    public var day: (Day, (Day) -> Components) {
                        (base.2, { [base] day in
                                (base.0, base.1, day, base.3, base.4, base.5, base.6)
                            })
                    }
                    public var hour: (Hour, (Hour) -> Components) {
                        (base.3, { [base] hour in
                                (base.0, base.1, base.2, hour, base.4, base.5, base.6)
                            })
                    }
                    public var minute: (Minute, (Minute) -> Components) {
                        (base.4, { [base] minute in
                                (base.0, base.1, base.2, base.3, minute, base.5, base.6)
                            })
                    }
                    public var second: (Second, (Second) -> Components) {
                        (base.5, { [base] second in
                                (base.0, base.1, base.2, base.3, base.4, second, base.6)
                            })
                    }
                    public var nanosecond: (Nanosecond, (Nanosecond) -> Components) {
                        (base.6, { [base] nanosecond in
                                (base.0, base.1, base.2, base.3, base.4, base.5, nanosecond)
                            })
                    }
                    init(base: Components) {
                        self.base = base
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
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1, base.2, base.3, base.4, base.5)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month, base.2, base.3, base.4, base.5)
                            })
                    }
                    public var day: (Day, (Day) -> Components) {
                        (base.2, { [base] day in
                                (base.0, base.1, day, base.3, base.4, base.5)
                            })
                    }
                    public var hour: (Hour, (Hour) -> Components) {
                        (base.3, { [base] hour in
                                (base.0, base.1, base.2, hour, base.4, base.5)
                            })
                    }
                    public var minute: (Minute, (Minute) -> Components) {
                        (base.4, { [base] minute in
                                (base.0, base.1, base.2, base.3, minute, base.5)
                            })
                    }
                    public var second: (Second, (Second) -> Components) {
                        (base.5, { [base] second in
                                (base.0, base.1, base.2, base.3, base.4, second)
                            })
                    }
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
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {

                struct _MinuteModifyContext {
                    private let base: Components
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1, base.2, base.3, base.4)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month, base.2, base.3, base.4)
                            })
                    }
                    public var day: (Day, (Day) -> Components) {
                        (base.2, { [base] day in
                                (base.0, base.1, day, base.3, base.4)
                            })
                    }
                    public var hour: (Hour, (Hour) -> Components) {
                        (base.3, { [base] hour in
                                (base.0, base.1, base.2, hour, base.4)
                            })
                    }
                    public var minute: (Minute, (Minute) -> Components) {
                        (base.4, { [base] minute in
                                (base.0, base.1, base.2, base.3, minute)
                            })
                    }
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
            @ModifyContext
            public extension TypedDate<(Year, Month, Day, Hour)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour)> {

                struct _HourModifyContext {
                    private let base: Components
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1, base.2, base.3)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month, base.2, base.3)
                            })
                    }
                    public var day: (Day, (Day) -> Components) {
                        (base.2, { [base] day in
                                (base.0, base.1, day, base.3)
                            })
                    }
                    public var hour: (Hour, (Hour) -> Components) {
                        (base.3, { [base] hour in
                                (base.0, base.1, base.2, hour)
                            })
                    }
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
            @ModifyContext
            public extension TypedDate<(Year, Month, Day)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day)> {

                struct _DayModifyContext {
                    private let base: Components
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1, base.2)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month, base.2)
                            })
                    }
                    public var day: (Day, (Day) -> Components) {
                        (base.2, { [base] day in
                                (base.0, base.1, day)
                            })
                    }
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
            @ModifyContext
            public extension TypedDate<(Year, Month)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month)> {

                struct _MonthModifyContext {
                    private let base: Components
                    public var year: (Year, (Year) -> Components) {
                        (base.0, { [base] year in
                                (year, base.1)
                            })
                    }
                    public var month: (Month, (Month) -> Components) {
                        (base.1, { [base] month in
                                (base.0, month)
                            })
                    }
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
            @ModifyContext
            public extension TypedDate<(Year)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year)> {

                struct _YearModifyContext {
                    private let base: Components
                    public var year: (Year, (Year) -> Components) {
                        (base, { [base] year in
                                (year)
                            })
                    }
                    init(base: Components) {
                        self.base = base
                    }
                }
            }
            """
        }
    }
}
