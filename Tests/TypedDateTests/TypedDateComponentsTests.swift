import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateComponentsTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func year() {
        let typedDate = testSupport.generateTypedYearDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
    }

    @Test
    func month() {
        let typedDate = testSupport.generateTypedMonthDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
    }

    @Test
    func day() {
        let typedDate = testSupport.generateTypedDayDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
        #expect(typedDate.day(calendar: calendar) == testSupport.day.value)
    }

    @Test
    func hour() {
        let typedDate = testSupport.generateTypedHourDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
        #expect(typedDate.day(calendar: calendar) == testSupport.day.value)
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.value)
    }

    @Test
    func minute() {
        let typedDate = testSupport.generateTypedMinuteDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
        #expect(typedDate.day(calendar: calendar) == testSupport.day.value)
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.value)
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.value)
    }

    @Test
    func second() {
        let typedDate = testSupport.generateTypedSecondDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
        #expect(typedDate.day(calendar: calendar) == testSupport.day.value)
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.value)
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.value)
        #expect(typedDate.second(calendar: calendar) == testSupport.second.value)
    }

    @Test
    func nanosecond() {
        let typedDate = testSupport.generateTypedNanosecondDate()
        #expect(typedDate.year(calendar: calendar) == testSupport.year.value)
        #expect(typedDate.month(calendar: calendar) == testSupport.month.value)
        #expect(typedDate.day(calendar: calendar) == testSupport.day.value)
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.value)
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.value)
        #expect(typedDate.second(calendar: calendar) == testSupport.second.value)
        #expect(typedDate.nanosecond(calendar: calendar) == testSupport.nanosecond.value)
    }
}
