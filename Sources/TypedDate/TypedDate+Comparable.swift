import Foundation

extension TypedDate: Comparable {
    public static func == (lhs: TypedDate<Components>, rhs: TypedDate<Components>) -> Bool {
        switch (lhs.components, rhs.components) {
        case let (lhsDate as TypedDate<Year>, rhsDate as TypedDate<Year>):
            return lhsDate.year() == rhsDate.year()

        case let (lhsDate as TypedDate<(Year, Month)>, rhsDate as TypedDate<(Year, Month)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()

        case let (lhsDate as TypedDate<(Year, Month, Day)>, rhsDate as TypedDate<(Year, Month, Day)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()
                && lhsDate.day() == rhsDate.day()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour)>, rhsDate as TypedDate<(Year, Month, Day, Hour)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()
                && lhsDate.day() == rhsDate.day()
                && lhsDate.hour() == rhsDate.hour()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()
                && lhsDate.day() == rhsDate.day()
                && lhsDate.hour() == rhsDate.hour()
                && lhsDate.minute() == rhsDate.minute()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()
                && lhsDate.day() == rhsDate.day()
                && lhsDate.hour() == rhsDate.hour()
                && lhsDate.minute() == rhsDate.minute()
                && lhsDate.second() == rhsDate.second()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>):
            return lhsDate.year() == rhsDate.year()
                && lhsDate.month() == rhsDate.month()
                && lhsDate.day() == rhsDate.day()
                && lhsDate.hour() == rhsDate.hour()
                && lhsDate.minute() == rhsDate.minute()
                && lhsDate.second() == rhsDate.second()
                && lhsDate.nanosecond() == rhsDate.nanosecond()

        default:
            runtimeWarning(
                """
                Comparison failed: 'TypedDate' instances can only be compared if their 'Components' types are identical.
                """
            )
            return lhs.date < rhs.date
        }
    }

    public static func < (lhs: TypedDate<Components>, rhs: TypedDate<Components>) -> Bool {
        switch (lhs.components, rhs.components) {
        case let (lhsDate as TypedDate<Year>, rhsDate as TypedDate<Year>):
            return lhsDate.year() < rhsDate.year()

        case let (lhsDate as TypedDate<(Year, Month)>, rhsDate as TypedDate<(Year, Month)>):
            return lhsDate.year() < rhsDate.year() 
                && lhsDate.month() < rhsDate.month()

        case let (lhsDate as TypedDate<(Year, Month, Day)>, rhsDate as TypedDate<(Year, Month, Day)>):
            return lhsDate.year() < rhsDate.year() 
                && lhsDate.month() < rhsDate.month()
                && lhsDate.day() < rhsDate.day()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour)>, rhsDate as TypedDate<(Year, Month, Day, Hour)>):
            return lhsDate.year() < rhsDate.year()
                && lhsDate.month() < rhsDate.month()
                && lhsDate.day() < rhsDate.day()
                && lhsDate.hour() < rhsDate.hour()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute)>):
            return lhsDate.year() < rhsDate.year()
                && lhsDate.month() < rhsDate.month()
                && lhsDate.day() < rhsDate.day()
                && lhsDate.hour() < rhsDate.hour()
                && lhsDate.minute() < rhsDate.minute()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second)>):
            return lhsDate.year() < rhsDate.year()
                && lhsDate.month() < rhsDate.month()
                && lhsDate.day() < rhsDate.day()
                && lhsDate.hour() < rhsDate.hour()
                && lhsDate.minute() < rhsDate.minute()
                && lhsDate.second() < rhsDate.second()

        case let (lhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>, rhsDate as TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>):
            return lhsDate.year() < rhsDate.year()
                && lhsDate.month() < rhsDate.month()
                && lhsDate.day() < rhsDate.day()
                && lhsDate.hour() < rhsDate.hour()
                && lhsDate.minute() < rhsDate.minute()
                && lhsDate.second() < rhsDate.second()
                && lhsDate.nanosecond() < rhsDate.nanosecond()

        default:
            runtimeWarning(
                """
                Comparison failed: 'TypedDate' instances can only be compared if their 'Components' types are identical.
                """
            )
            return lhs.date < rhs.date
        }
    }
}
