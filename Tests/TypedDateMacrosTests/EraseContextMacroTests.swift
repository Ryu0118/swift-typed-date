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
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
                    }
                    public var month: (TypedDate<(Year, Month)>.Type, (Year, Month)) {
                        (TypedDate<(Year, Month)>.self, (base.0, base.1))
                    }
                    public var day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day)) {
                        (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                    }
                    public var hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour)) {
                        (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
                    }
                    public var minute: (TypedDate<(Year, Month, Day, Hour, Minute)>.Type, (Year, Month, Day, Hour, Minute)) {
                        (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
                    }
                    public var second: (TypedDate<(Year, Month, Day, Hour, Minute, Second)>.Type, (Year, Month, Day, Hour, Minute, Second)) {
                        (TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self, (base.0, base.1, base.2, base.3, base.4, base.5))
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
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {

                struct _SecondEraseContext {
                    private let base: Components
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
                    }
                    public var month: (TypedDate<(Year, Month)>.Type, (Year, Month)) {
                        (TypedDate<(Year, Month)>.self, (base.0, base.1))
                    }
                    public var day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day)) {
                        (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                    }
                    public var hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour)) {
                        (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
                    }
                    public var minute: (TypedDate<(Year, Month, Day, Hour, Minute)>.Type, (Year, Month, Day, Hour, Minute)) {
                        (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
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
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour, Minute)> {

                struct _MinuteEraseContext {
                    private let base: Components
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
                    }
                    public var month: (TypedDate<(Year, Month)>.Type, (Year, Month)) {
                        (TypedDate<(Year, Month)>.self, (base.0, base.1))
                    }
                    public var day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day)) {
                        (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
                    }
                    public var hour: (TypedDate<(Year, Month, Day, Hour)>.Type, (Year, Month, Day, Hour)) {
                        (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
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
            @EraseContext
            public extension TypedDate<(Year, Month, Day, Hour)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day, Hour)> {

                struct _HourEraseContext {
                    private let base: Components
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
                    }
                    public var month: (TypedDate<(Year, Month)>.Type, (Year, Month)) {
                        (TypedDate<(Year, Month)>.self, (base.0, base.1))
                    }
                    public var day: (TypedDate<(Year, Month, Day)>.Type, (Year, Month, Day)) {
                        (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
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
            @EraseContext
            public extension TypedDate<(Year, Month, Day)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month, Day)> {

                struct _DayEraseContext {
                    private let base: Components
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
                    }
                    public var month: (TypedDate<(Year, Month)>.Type, (Year, Month)) {
                        (TypedDate<(Year, Month)>.self, (base.0, base.1))
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
            @EraseContext
            public extension TypedDate<(Year, Month)> {}
            """
        } expansion: {
            """
            public extension TypedDate<(Year, Month)> {

                struct _MonthEraseContext {
                    private let base: Components
                    public var year: (TypedDate<Year>.Type, Year) {
                        (TypedDate<Year>.self, base.0)
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
