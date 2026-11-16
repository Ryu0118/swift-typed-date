import Foundation
import Testing
@testable import TypedDate

/// Components that overflow (`Month(13)`, `Day(32)`, `Nanosecond(1_500_000_000)`) describe the same instant as their
/// normalized form, so they must behave the same everywhere, not only in `==`.
@Suite
struct TypedDateNormalizationTests {
    let calendar = Calendar(identifier: .gregorian)

    @Test
    func overflowedDayModifiesLikeTheNormalizedDate() {
        let overflowed = TypedDate(Year(2023), Month(1), Day(32), calendar: calendar)
        let normalized = TypedDate(Year(2023), Month(2), Day(1), calendar: calendar)

        #expect(overflowed == normalized)
        #expect(overflowed.add(\.month, 1, calendar: calendar) == normalized.add(\.month, 1, calendar: calendar))
        #expect(overflowed.add(\.month, 1, calendar: calendar) == TypedDate(Year(2023), Month(3), Day(1), calendar: calendar))
    }

    @Test
    func overflowedMonthErasesToTheCarriedYear() {
        let overflowed = TypedDate(Year(2023), Month(13), calendar: calendar)

        #expect(overflowed.erase(to: \.year, calendar: calendar) == TypedDate(Year(2024), calendar: calendar))
    }

    @Test
    func overflowedHourFillsLikeTheNormalizedDate() {
        let overflowed = TypedDate(Year(2023), Month(12), Day(31), Hour(24), calendar: calendar)
        let normalized = TypedDate(Year(2024), Month(1), Day(1), Hour(0), calendar: calendar)

        #expect(
            overflowed.fill(to: \.minute, arguments: Minute(30), calendar: calendar)
                == normalized.fill(to: \.minute, arguments: Minute(30), calendar: calendar)
        )
    }

    @Test
    func storedComponentsAreNormalized() {
        let date = TypedDate(Year(2023), Month(14), Day(0), calendar: calendar)

        #expect(date.components.0.value == 2024)
        #expect(date.components.1.value == 1)
        #expect(date.components.2.value == 31)
    }

    @Test
    func addingNanosecondsAccumulates() {
        var date = TypedDate(Year(2023), Month(11), Day(10), Hour(3), Minute(50), Second(10), Nanosecond(0), calendar: calendar)
        for _ in 0..<1_000 {
            date = date.add(\.nanosecond, 1, calendar: calendar)
        }

        #expect(date.components.5.value == 10)
        #expect(date.components.6.value == 1_000)
    }

    @Test(arguments: [5, 500, 111_111_164, 999_999_999])
    func nanosecondIsKeptExactly(nanosecond: Int) {
        let date = TypedDate(Year(2023), Month(11), Day(10), Hour(3), Minute(50), Second(10), Nanosecond(nanosecond), calendar: calendar)

        #expect(date.components.5.value == 10)
        #expect(date.components.6.value == nanosecond)
    }

    @Test
    func overflowedNanosecondCarriesIntoSecond() {
        let date = TypedDate(Year(2023), Month(11), Day(10), Hour(3), Minute(50), Second(10), Nanosecond(1_500_000_000), calendar: calendar)

        #expect(date.components.5.value == 11)
        #expect(date.components.6.value == 500_000_000)
        #expect(date == TypedDate(Year(2023), Month(11), Day(10), Hour(3), Minute(50), Second(11), Nanosecond(500_000_000), calendar: calendar))
    }

    @Test
    func negativeNanosecondBorrowsFromSecond() {
        let date = TypedDate(Year(2023), Month(11), Day(10), Hour(3), Minute(50), Second(10), Nanosecond(-1), calendar: calendar)

        #expect(date.components.5.value == 9)
        #expect(date.components.6.value == 999_999_999)
    }

    @Test
    func dayIsKeptWhereMidnightIsSkipped() {
        // Clocks in São Paulo jumped from 00:00 to 01:00 on 2018-11-04, so that day has no midnight
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "America/Sao_Paulo")!
        let date = TypedDate(Year(2018), Month(11), Day(4), calendar: calendar)

        #expect(calendar.dateComponents([.year, .month, .day], from: date.date) == DateComponents(year: 2018, month: 11, day: 4))
        #expect(date.components.2.value == 4)
        #expect(date.add(\.day, 1, calendar: calendar).day(calendar: calendar) == 5)
    }

    @Test
    func nonGregorianCalendarIsNormalized() {
        // The Hebrew calendar has 13 months in a leap year, so month 13 overflows only in common years
        let calendar = Calendar(identifier: .hebrew)
        let date = TypedDate(Year(5784), Month(1), Day(31), calendar: calendar)

        #expect(date.components.2.value == calendar.component(.day, from: date.date))
        #expect(date.components.1.value == calendar.component(.month, from: date.date))
    }

    @Test
    func modifyingCarriesAcrossUnits() {
        let date = TypedDate(Year(2023), Month(12), Day(31), Hour(23), Minute(59), Second(59), calendar: calendar)
        let next = date.add(\.second, 1, calendar: calendar)

        #expect(next == TypedDate(Year(2024), Month(1), Day(1), Hour(0), Minute(0), Second(0), calendar: calendar))
        #expect(next.components.0.value == 2024)
        #expect(next.components.5.value == 0)
    }
}

@Suite
struct FractionalSecondTests {
    @Test
    func negativeValueFloorsTheSeconds() {
        let value = FractionalSecond(-1.5)

        #expect(value.seconds == -2)
        #expect(value.nanoseconds == 500_000_000)
    }

    @Test
    func nanosecondsAreRoundedNotTruncated() {
        for millisecond in 0..<1_000 {
            let value = FractionalSecond(10 + Double(millisecond) / 1_000)
            #expect(value.seconds == 10)
            #expect(value.nanoseconds == millisecond * 1_000_000)
        }
    }

    @Test
    func roundingUpToAWholeSecondCarries() {
        let value = FractionalSecond(9.9999999996)

        #expect(value.seconds == 10)
        #expect(value.nanoseconds == 0)
    }

    @Test
    func wholeSeconds() {
        #expect(FractionalSecond(0).seconds == 0)
        #expect(FractionalSecond(0).nanoseconds == 0)
        #expect(FractionalSecond(59).seconds == 59)
        #expect(FractionalSecond(59).nanoseconds == 0)
    }
}
