import Foundation

public extension TypedDate {
    init(_ year: Year, calendar: Calendar = .current) where Components == Year {
        self.components = year
        self.date = DateComponents(
            calendar: calendar,
            year: year.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        calendar: Calendar = .current
    )  where Components == (Year, Month) {
        self.components = (year, month)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day) {
        self.components = (year, month, day)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour) {
        self.components = (year, month, day, hour)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute) {
        self.components = (year, month, day, hour, minute)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ second: Second,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second) {
        self.components = (year, month, day, hour, minute, second)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: second.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ second: Second,
        _ nanosecond: Nanosecond,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
        self.components = (year, month, day, hour, minute, second, nanosecond)
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: second.value,
            nanosecond: nanosecond.value
        ).date!
    }

    init(
        _ year: Year,
        _ month: Month,
        _ day: Day,
        _ hour: Hour,
        _ minute: Minute,
        _ fractionalSecond: FractionalSecond,
        calendar: Calendar = .current
    )  where Components == (Year, Month, Day, Hour, Minute, Second, Nanosecond) {
        self.components = (year, month, day, hour, minute, Second(fractionalSecond.seconds), Nanosecond(fractionalSecond.nanoseconds))
        self.date = DateComponents(
            calendar: calendar,
            year: year.value,
            month: month.value,
            day: day.value,
            hour: hour.value,
            minute: minute.value,
            second: components.5.value,
            nanosecond: components.6.value
        ).date!
    }
}

extension TypedDate {
    init(_ components: Components, calendar: Calendar = .current) {
        self.components = components

        switch components {
        case let components as Year:
            self.date = DateComponents(
                calendar: calendar,
                year: components.value
            ).date!
        case let components as (Year, Month):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value
            ).date!
        case let components as (Year, Month, Day):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value
            ).date!
        case let components as (Year, Month, Day, Hour):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value
            ).date!
        case let components as (Year, Month, Day, Hour, Minute):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value
            ).date!
        case let components as (Year, Month, Day, Hour, Minute, Second):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value,
                second: components.5.value
            ).date!
        case let components as (Year, Month, Day, Hour, Minute, Second, Nanosecond):
            self.date = DateComponents(
                calendar: calendar,
                year: components.0.value,
                month: components.1.value,
                day: components.2.value,
                hour: components.3.value,
                minute: components.4.value,
                second: components.5.value,
                nanosecond: components.6.value
            ).date!

        default:
            fatalError(
                """
                Unexpected components: \(components)
                """
            )
        }
    }
}
