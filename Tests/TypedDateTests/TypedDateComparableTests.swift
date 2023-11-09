import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateComparableTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport.init(calendar: calendar)
    }

    @Test
    func compareYear() {
        let lhsDate = TypedDate(testSupport.year)
        let rhsDate = TypedDate(testSupport.year.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareMonth() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month)
        let rhsDate = TypedDate(testSupport.year, testSupport.month.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareDay() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareHour() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareMinute() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareSecond() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second.add(1))

        #expect(lhsDate < rhsDate)
    }

    @Test
    func compareNanosecond() {
        let lhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond)
        let rhsDate = TypedDate(testSupport.year, testSupport.month, testSupport.day, testSupport.hour, testSupport.minute, testSupport.second, testSupport.nanosecond.add(-10000))

        #expect(lhsDate > rhsDate)
    }
}
