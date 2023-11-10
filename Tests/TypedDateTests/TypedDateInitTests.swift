import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateInitTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        self.calendar = Calendar(identifier: .gregorian)
        self.testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func year() {
        let typedDate = testSupport.generateTypedYearDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func month() {
        let typedDate = testSupport.generateTypedMonthDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func day() {
        let typedDate = testSupport.generateTypedDayDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func hour() {
        let typedDate = testSupport.generateTypedHourDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func minute() {
        let typedDate = testSupport.generateTypedMinuteDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func second() {
        let typedDate = testSupport.generateTypedSecondDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func nanosecond() {
        let typedDate = testSupport.generateTypedNanosecondDate()
        testSupport.assertTypedDate(for: typedDate)
    }

    @Test
    func fractionalSecond() {
        let typedDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.fractionalSecond, calendar: calendar)
        testSupport.assertTypedDate(for: typedDate)
    }
}
