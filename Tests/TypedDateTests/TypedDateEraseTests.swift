import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateEraseTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func testMonthErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
    }

    @Test
    func testDayErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
    }

    @Test
    func testHourErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
    }

    @Test
    func testMinuteErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
    }

    @Test
    func testSecondErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.minute, calendar: calendar))
    }

    @Test
    func testNanoSecondErasedDate() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.minute, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.second, calendar: calendar))
    }
}
