import Testing
@testable import TypedDate
import TypedDateCore
import Foundation

@Suite
struct TypedDateAddTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport.init(calendar: calendar)
    }

    @Test
    func addYear() {
        let typedDate = testSupport.generateTypedYearDate().add(\.year, 1)

        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
    }

    @Test
    func addMonth() {
        let typedDate = testSupport.generateTypedMonthDate().add(\.month, 1)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(1))
    }

    @Test
    func addHour() {
        let typedDate = testSupport.generateTypedHourDate().add(\.hour, 1)
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.add(1))
    }

    @Test
    func addMinute() {
        let typedDate = testSupport.generateTypedMinuteDate().add(\.minute, 1)
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.add(1))
    }

    @Test
    func addSecond() {
        let typedDate = testSupport.generateTypedSecondDate().add(\.second, 1)
        #expect(typedDate.second(calendar: calendar) == testSupport.second.add(1))
    }
}
