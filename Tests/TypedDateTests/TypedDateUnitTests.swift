import Foundation
import Testing
@testable import TypedDate

/// Units fall back to the standard library's `BinaryInteger` / `Strideable` defaults unless they override them.
/// Those defaults call each other (`<` uses `distance(to:)`, and `distance(to:)` uses `<`), which overflows the stack.
@Suite
struct TypedDateUnitTests {
    @Test
    func lessThan() {
        #expect(Year(2023) < Year(2024))
        #expect(!(Year(2024) < Year(2023)))
        #expect(!(Year(2024) < Year(2024)))
        #expect(Month(1) < Month(12))
        #expect(Day(1) < Day(31))
        #expect(Hour(0) < Hour(23))
        #expect(Minute(0) < Minute(59))
        #expect(Second(0) < Second(59))
        #expect(Nanosecond(0) < Nanosecond(999_999_999))
    }

    @Test
    func lessThanWithNegativeValues() {
        #expect(Year(-1) < Year(0))
        #expect(!(Year(0) < Year(-1)))
    }

    @Test
    func comparisonOperatorsDerivedFromLessThan() {
        #expect(Year(2024) > Year(2023))
        #expect(Year(2024) >= Year(2024))
        #expect(Year(2023) <= Year(2024))
        #expect(max(Year(2023), Year(2024)) == Year(2024))
        #expect([Year(2025), Year(2023), Year(2024)].sorted() == [Year(2023), Year(2024), Year(2025)])
    }

    @Test
    func distance() {
        #expect(Year(2023).distance(to: Year(2025)) == 2)
        #expect(Year(2025).distance(to: Year(2023)) == -2)
        #expect(Month(3).distance(to: Month(3)) == 0)
        #expect(Nanosecond(0).distance(to: Nanosecond(10)) == 10)
    }

    @Test
    func advanced() {
        #expect(Year(2023).advanced(by: 2) == Year(2025))
        #expect(Day(10).advanced(by: -3) == Day(7))
    }

    @Test
    func range() {
        #expect(Array(Month(1)...Month(3)) == [Month(1), Month(2), Month(3)])
        #expect((Year(2020)..<Year(2024)).count == 4)
        #expect((Year(2020)...Year(2024)).contains(Year(2022)))
    }

    @Test
    func description() {
        #expect(Year(2024).description == "2024")
        #expect(Year(-5).description == "-5")
        #expect(Year(0).description == "0")
        #expect(String(describing: Month(12)) == "12")
        #expect(String(describing: Day(31)) == "31")
        #expect("\(Hour(23)):\(Minute(5))" == "23:5")
        #expect(String(describing: Second(59)) == "59")
        #expect(String(describing: Nanosecond(999_999_999)) == "999999999")
    }

    @Test
    func describingTypedDateDoesNotRecurse() {
        // swift-testing renders test arguments with String(describing:), which walks into the units
        let date = TypedDate(Year(2024), Month(2), Day(29), calendar: Calendar(identifier: .gregorian))
        #expect(!String(describing: date).isEmpty)
        #expect(!String(reflecting: date).isEmpty)
    }

    @Test(arguments: [Year(2023), Year(2024)])
    func unitAsTestArgument(year: Year) {
        #expect(year.value == 2023 || year.value == 2024)
    }
}
