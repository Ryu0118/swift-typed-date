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
        let lhsDate = TypedDate(testSupport.year)
        let rhsDate = TypedDate(testSupport.year)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalMonth() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month)
        let rhsDate = TypedDate(testSupport.year, testSupport.month)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalDay() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalHour() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalMinute() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalSecond() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)

        #expect(lhsDate == rhsDate)
    }

    @Test
    func equalNanosecond() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)

        #expect(lhsDate == rhsDate)
    }
}
