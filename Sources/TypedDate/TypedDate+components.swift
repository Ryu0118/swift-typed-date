import Foundation


public extension TypedDate<Year> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.value
    }
}

public extension TypedDate<(Year, Month)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }
}

public extension TypedDate<(Year, Month, Day)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }
}

public extension TypedDate<(Year, Month, Day, Hour)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }

    func second(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date).minute ?? components.5.value
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    func year(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.year], from: date).year ?? components.0.value
    }

    func month(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.month], from: date).month ?? components.1.value
    }

    func day(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.day], from: date).day ?? components.2.value
    }

    func hour(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.hour], from: date).hour ?? components.3.value
    }

    func minute(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.minute], from: date).minute ?? components.4.value
    }

    func second(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.second], from: date).minute ?? components.5.value
    }

    func nanosecond(calendar: Calendar = .current) -> Int {
        calendar.dateComponents([.nanosecond], from: date).nanosecond ?? components.6.value
    }
}
