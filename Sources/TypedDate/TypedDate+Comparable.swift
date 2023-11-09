import Foundation

extension TypedDate: Comparable {
    public static func == (lhs: TypedDate<Components>, rhs: TypedDate<Components>) -> Bool {
        lhs.date == rhs.date
    }

    public static func < (lhs: TypedDate<Components>, rhs: TypedDate<Components>) -> Bool {
        lhs.date < rhs.date
    }
}
