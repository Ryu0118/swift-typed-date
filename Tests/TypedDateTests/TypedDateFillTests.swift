import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateFillTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        self.calendar = Calendar(identifier: .gregorian)
        self.testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func testFillInYearDate() {
        let typedDate = TypedDate(testSupport.year)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.month,
                arguments: (testSupport.month)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.day,
                arguments: (testSupport.month, testSupport.day)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.hour,
                arguments: (testSupport.month, testSupport.day, testSupport.hour)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.minute,
                arguments: (testSupport.month, testSupport.day, testSupport.hour, testSupport.minute)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.second,
                arguments: (testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)
            )
        )
    }

    @Test
    func testFillInMonthDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.day,
                arguments: (testSupport.day)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.hour,
                arguments: (testSupport.day, testSupport.hour)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.minute,
                arguments: (testSupport.day, testSupport.hour, testSupport.minute)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.second,
                arguments: (testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)
            )
        )
    }

    @Test
    func testFillInDayDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.hour,
                arguments: ( testSupport.hour)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.minute,
                arguments: (testSupport.hour, testSupport.minute)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.second,
                arguments: (testSupport.hour, testSupport.minute, testSupport.second)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)
            )
        )
    }

    @Test
    func testFillInHourDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.minute,
                arguments: (testSupport.minute)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.second,
                arguments: (testSupport.minute, testSupport.second)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.minute, testSupport.second, testSupport.nanosecond)
            )
        )
    }

    @Test
    func testFillInMinuteDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.second,
                arguments: (testSupport.second)
            )
        )
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.second, testSupport.nanosecond)
            )
        )
    }

    @Test
    func testFillInSecondDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)
        testSupport.assertTypedDate(
            for: typedDate.fill(
                to: \.nanosecond,
                arguments: (testSupport.nanosecond)
            )
        )
    }
}
