import Testing
@testable import TypedDate
import TypedDateCore
import Foundation

@Suite
final class TypedDateTests {
    @Test(arguments: Calendar.Identifier.allCases)
    func testScopeNotNil(identifier: Calendar.Identifier) {
        let calendar = Calendar(identifier: identifier)
        dates(calendar: calendar).compactMap { $0 }.forEach {
            let nanosecond = $0.scope(to: \.nanosecond, calendar: calendar)
            #expect(nanosecond != nil)
            let second = $0.scope(to: \.second, calendar: calendar)
            #expect(second != nil)
            let minute = $0.scope(to: \.minute, calendar: calendar)
            #expect(minute != nil)
            let hour = $0.scope(to: \.hour, calendar: calendar)
            #expect(hour != nil)
            let day = $0.scope(to: \.day, calendar: calendar)
            #expect(day != nil)
            let month = $0.scope(to: \.month, calendar: calendar)
            #expect(month != nil)
            let year = $0.scope(to: \.year, calendar: calendar)
            #expect(year != nil)
        }
    }

    @Test(arguments: Calendar.Identifier.allCases)
    func testDateNotNil(identifier: Calendar.Identifier) {
        dates(calendar: Calendar(identifier: identifier)).forEach { date in
            #expect(date != nil)
        }
    }
}

func date(
    calendar: Calendar,
    year: Int? = nil,
    month: Int? = nil,
    day: Int? = nil,
    hour: Int? = nil,
    minute: Int? = nil,
    second: Int? = nil,
    nanosecond: Int? = nil
) -> Date? {
    DateComponents(
        calendar: .current,
        year: year,
        month: month,
        day: day,
        hour: hour,
        minute: minute,
        second: second,
        nanosecond: nanosecond
    ).date
}

func dates(calendar: Calendar) -> [Date?] {
    [
        date(calendar: calendar),
        date(calendar: calendar, year: 2023), date(calendar: calendar, month: 1), date(calendar: calendar, day: 1),
        date(calendar: calendar, minute: 1), date(calendar: calendar, second: 1), date(calendar: calendar, nanosecond: 1),
        date(calendar: calendar, year: 2023, month: 1, day: 31),
        date(calendar: calendar, year: 2023, month: 2, day: 28),
        date(calendar: calendar, year: 2024, month: 2, day: 29),
        date(calendar: calendar, year: 2023, month: 2, day: 30),
        date(calendar: calendar, year: 2023, month: 13, day: 1),
        date(calendar: calendar, hour: 23, minute: 59, second: 59),
        date(calendar: calendar, year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59),
        date(calendar: calendar, year: 3000, month: 1, day: 1),
        date(calendar: calendar, year: 1900, month: 1, day: 1),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 25, minute: 0, second: 0),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 60, second: 0),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 61),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 0, nanosecond: 500000000),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 0, nanosecond: 1_000_000_000),
        date(calendar: calendar, year: -1, month: 1, day: 1),
        date(calendar: calendar, year: 2023, month: -1, day: 1),
        date(calendar: calendar, year: 2023, month: 1, day: -1),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: -1, second: 0),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: 0, second: -1),
        date(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: -1)
    ]
}

extension Calendar.Identifier {
    public static var allCases: Set<Calendar.Identifier> {
        [
            .buddhist, .chinese, .coptic, .ethiopicAmeteAlem, .ethiopicAmeteMihret, .gregorian, .hebrew, .indian,
            .islamic, .islamicCivil, .islamicTabular, .islamicUmmAlQura, .iso8601, .japanese, .persian, .republicOfChina
        ]
    }
}
