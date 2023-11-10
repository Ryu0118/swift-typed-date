import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateEquatableTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport.init(calendar: calendar)
    }

    @Test
    func equalYear() {
        let lhsDate = testSupport.generateTypedYearDate()
        let rhsDate = testSupport.generateTypedYearDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalMonth() {
        let lhsDate = testSupport.generateTypedMonthDate()
        let rhsDate = testSupport.generateTypedMonthDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalDay() {
        let lhsDate = testSupport.generateTypedDayDate()
        let rhsDate = testSupport.generateTypedDayDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalHour() {
        let lhsDate = testSupport.generateTypedHourDate()
        let rhsDate = testSupport.generateTypedHourDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalMinute() {
        let lhsDate = testSupport.generateTypedMinuteDate()
        let rhsDate = testSupport.generateTypedMinuteDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalSecond() {
        let lhsDate = testSupport.generateTypedSecondDate()
        let rhsDate = testSupport.generateTypedSecondDate()

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalNanosecond() {
        let lhsDate = testSupport.generateTypedNanosecondDate()
        let rhsDate = testSupport.generateTypedNanosecondDate()

        #expect(lhsDate == rhsDate)
    }
}
