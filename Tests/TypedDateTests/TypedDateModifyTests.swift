import Testing
@testable import TypedDate
import TypedDateCore
import Foundation

@Suite
struct TypedDateModifyTests {
    let testSupport: TypedDateTestSupport
    let calendar: Calendar

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func testNanosecondModify() {
        let typedDate = testSupport.generateTypedNanosecondDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
            .modifying(\.hour) { $0 += 4 }
            .modifying(\.minute) { $0 += 5 }
            .modifying(\.second) { $0 += 6 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
        #expect(typedDate.day(calendar: calendar) == testSupport.day.add(3))
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.add(4))
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.add(5))
        #expect(typedDate.second(calendar: calendar) == testSupport.second.add(6))
        #expect(typedDate.nanosecond(calendar: calendar) == testSupport.nanosecond)
    }

    @Test
    func testSecondModify() {
        let typedDate = testSupport.generateTypedSecondDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
            .modifying(\.hour) { $0 += 4 }
            .modifying(\.minute) { $0 += 5 }
            .modifying(\.second) { $0 += 6 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
        #expect(typedDate.day(calendar: calendar) == testSupport.day.add(3))
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.add(4))
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.add(5))
        #expect(typedDate.second(calendar: calendar) == testSupport.second.add(6))
    }

    @Test
    func testMinuteModify() {
        let typedDate = testSupport.generateTypedMinuteDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
            .modifying(\.hour) { $0 += 4 }
            .modifying(\.minute) { $0 += 5 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
        #expect(typedDate.day(calendar: calendar) == testSupport.day.add(3))
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.add(4))
        #expect(typedDate.minute(calendar: calendar) == testSupport.minute.add(5))
    }

    @Test
    func testHourModify() {
        let typedDate = testSupport.generateTypedHourDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
            .modifying(\.hour) { $0 += 4 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
        #expect(typedDate.day(calendar: calendar) == testSupport.day.add(3))
        #expect(typedDate.hour(calendar: calendar) == testSupport.hour.add(4))
    }

    @Test
    func testDayModify() {
        let typedDate = testSupport.generateTypedDayDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
        #expect(typedDate.day(calendar: calendar) == testSupport.day.add(3))
    }

    @Test
    func testMonthModify() {
        let typedDate = testSupport.generateTypedMonthDate()
            .modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
        #expect(typedDate.month(calendar: calendar) == testSupport.month.add(-2))
    }

    @Test
    func testYearModify() {
        let typedDate = testSupport.generateTypedYearDate()
            .modifying(\.year) { $0 += 1 }
        #expect(typedDate.year(calendar: calendar) == testSupport.year.add(1))
    }
}
