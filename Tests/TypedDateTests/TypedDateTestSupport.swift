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
    let nanosecond = Nanosecond(9999990)

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
}
