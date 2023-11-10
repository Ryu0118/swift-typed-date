import Foundation
import Testing
@testable import TypedDate

struct TypedDateTestSupport {
    let year = Year(2023)
    let month = Month(11)
    let day = Day(10)
    let hour = Hour(3)
    let minute = Minute(50)
    let second = Second(10)
    let nanosecond = Nanosecond(111111164)
    let fractionalSecond = FractionalSecond(10.111111164)

    let calendar: Calendar

    init(calendar: Calendar) {
        self.calendar = calendar
    }

    func assertTypedDate(for typedDate: TypedDate<(Year)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(calendar.dateComponents([.month], from: typedDate.date).month == 1)
        #expect(calendar.dateComponents([.day], from: typedDate.date).day == 1)
        #expect(calendar.dateComponents([.hour], from: typedDate.date).hour == 0)
        #expect(calendar.dateComponents([.minute], from: typedDate.date).minute == 0)
        #expect(calendar.dateComponents([.second], from: typedDate.date).second == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(calendar.dateComponents([.day], from: typedDate.date).day == 1)
        #expect(calendar.dateComponents([.hour], from: typedDate.date).hour == 0)
        #expect(calendar.dateComponents([.minute], from: typedDate.date).minute == 0)
        #expect(calendar.dateComponents([.second], from: typedDate.date).second == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month, Day)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(typedDate.day(calendar: calendar) == day.value)
        #expect(calendar.dateComponents([.hour], from: typedDate.date).hour == 0)
        #expect(calendar.dateComponents([.minute], from: typedDate.date).minute == 0)
        #expect(calendar.dateComponents([.second], from: typedDate.date).second == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month, Day, Hour)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(typedDate.day(calendar: calendar) == day.value)
        #expect(typedDate.hour(calendar: calendar) == hour.value)
        #expect(calendar.dateComponents([.minute], from: typedDate.date).minute == 0)
        #expect(calendar.dateComponents([.second], from: typedDate.date).second == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month, Day, Hour, Minute)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(typedDate.day(calendar: calendar) == day.value)
        #expect(typedDate.hour(calendar: calendar) == hour.value)
        #expect(typedDate.minute(calendar: calendar) == minute.value)
        #expect(calendar.dateComponents([.second], from: typedDate.date).second == 0)
        #expect(calendar.dateComponents([.nanosecond], from: typedDate.date).nanosecond == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month, Day, Hour, Minute, Second)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(typedDate.day(calendar: calendar) == day.value)
        #expect(typedDate.hour(calendar: calendar) == hour.value)
        #expect(typedDate.minute(calendar: calendar) == minute.value)
        #expect(typedDate.second(calendar: calendar) == second.value)
        #expect(calendar.dateComponents([.nanosecond], from: typedDate.date).nanosecond == 0)
    }

    func assertTypedDate(for typedDate: TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>) {
        #expect(typedDate.year(calendar: calendar) == year.value)
        #expect(typedDate.month(calendar: calendar) == month.value)
        #expect(typedDate.day(calendar: calendar) == day.value)
        #expect(typedDate.hour(calendar: calendar) == hour.value)
        #expect(typedDate.minute(calendar: calendar) == minute.value)
        #expect(typedDate.second(calendar: calendar) == second.value)
        #expect(typedDate.nanosecond(calendar: calendar) == nanosecond.value)
    }

    func dates(calendar: Calendar) -> [Date?] {
        [
            generateDate(calendar: calendar),
            generateDate(calendar: calendar, year: 2023), generateDate(calendar: calendar, month: 1), generateDate(calendar: calendar, day: 1),
            generateDate(calendar: calendar, minute: 1), generateDate(calendar: calendar, second: 1), generateDate(calendar: calendar, nanosecond: 1),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 31),
            generateDate(calendar: calendar, year: 2023, month: 2, day: 28),
            generateDate(calendar: calendar, year: 2024, month: 2, day: 29),
            generateDate(calendar: calendar, year: 2023, month: 2, day: 30),
            generateDate(calendar: calendar, year: 2023, month: 13, day: 1),
            generateDate(calendar: calendar, hour: 23, minute: 59, second: 59),
            generateDate(calendar: calendar, year: 2023, month: 12, day: 31, hour: 23, minute: 59, second: 59),
            generateDate(calendar: calendar, year: 3000, month: 1, day: 1),
            generateDate(calendar: calendar, year: 1900, month: 1, day: 1),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 25, minute: 0, second: 0),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 60, second: 0),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 61),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 0, nanosecond: 500000000),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 12, minute: 0, second: 0, nanosecond: 1_000_000_000),
            generateDate(calendar: calendar, year: -1, month: 1, day: 1),
            generateDate(calendar: calendar, year: 2023, month: -1, day: 1),
            generateDate(calendar: calendar, year: 2023, month: 1, day: -1),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: -1, second: 0),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: 0, second: -1),
            generateDate(calendar: calendar, year: 2023, month: 1, day: 1, hour: 0, minute: 0, second: 0, nanosecond: -1)
        ]
    }

    func generateTypedNanosecondDate() -> TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
        TypedDate(year, month, day, hour, minute, second, nanosecond, calendar: calendar)
    }

    func generateTypedSecondDate() -> TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
        TypedDate(year, month, day, hour, minute, second, calendar: calendar)
    }

    func generateTypedMinuteDate() -> TypedDate<(Year, Month, Day, Hour, Minute)> {
        TypedDate(year, month, day, hour, minute, calendar: calendar)
    }

    func generateTypedHourDate() -> TypedDate<(Year, Month, Day, Hour)> {
        TypedDate(year, month, day, hour, calendar: calendar)
    }

    func generateTypedDayDate() -> TypedDate<(Year, Month, Day)> {
        TypedDate(year, month, day, calendar: calendar)
    }

    func generateTypedMonthDate() -> TypedDate<(Year, Month)> {
        TypedDate(year, month, calendar: calendar)
    }

    func generateTypedYearDate() -> TypedDate<(Year)> {
        TypedDate(year, calendar: calendar)
    }

    func generateDate() -> Date? {
        generateDate(
           calendar: calendar,
           year: year.value,
           month: month.value,
           day: day.value,
           hour: hour.value,
           minute: minute.value,
           second: second.value,
           nanosecond: nanosecond.value
       )
    }

    func generateDate(
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
}

extension Calendar.Identifier {
    static var allCases: Set<Calendar.Identifier> {
        [
            .buddhist, .chinese, .coptic, .ethiopicAmeteAlem, .ethiopicAmeteMihret, .gregorian, .hebrew, .indian,
            .islamic, .islamicCivil, .islamicTabular, .islamicUmmAlQura, .iso8601, .japanese, .persian, .republicOfChina
        ]
    }
}
