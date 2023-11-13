import Foundation

extension TypedDate: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(date)
        switch Components.self {
        case is (Year).Type:
            hasher.combine(1)

        case is (Year, Month).Type:
            hasher.combine(2)

        case is (Year, Month, Day).Type:
            hasher.combine(3)

        case is (Year, Month, Day, Hour).Type:
            hasher.combine(4)

        case is (Year, Month, Day, Hour, Minute).Type:
            hasher.combine(5)

        case is (Year, Month, Day, Hour, Minute, Second).Type:
            hasher.combine(6)

        case is (Year, Month, Day, Hour, Minute, Second, Nanosecond).Type:
            hasher.combine(6)

        default: hasher.combine(7)
        }
    }
}
