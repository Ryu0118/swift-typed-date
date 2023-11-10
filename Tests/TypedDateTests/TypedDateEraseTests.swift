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
        let typedDate = testSupport.generateTypedMonthDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
    }

    @Test
    func testDayErasedDate() {
        let typedDate = testSupport.generateTypedDayDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
    }

    @Test
    func testHourErasedDate() {
        let typedDate = testSupport.generateTypedHourDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
    }

    @Test
    func testMinuteErasedDate() {
        let typedDate = testSupport.generateTypedMinuteDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
    }

    @Test
    func testSecondErasedDate() {
        let typedDate = testSupport.generateTypedNanosecondDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.minute, calendar: calendar))
    }

    @Test
    func testNanoSecondErasedDate() {
        let typedDate = testSupport.generateTypedNanosecondDate()
        testSupport.assertTypedDate(for: typedDate)
        testSupport.assertTypedDate(for: typedDate.erase(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.hour, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.minute, calendar: calendar))
        testSupport.assertTypedDate(for: typedDate.erase(to: \.second, calendar: calendar))
    }
}
