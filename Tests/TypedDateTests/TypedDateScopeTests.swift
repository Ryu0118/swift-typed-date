import Testing
@testable import TypedDate
import TypedDateCore
import Foundation

@Suite
struct TypedDateScopeTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport(calendar: calendar)
    }

    @Test
    func testScope() throws {
        let generatedDate = testSupport.generateDate()
        let date = try #require(generatedDate)
        testSupport.assertTypedDate(for: date.scope(to: \.year, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.month, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.day, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.hour, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.minute, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.second, calendar: calendar))
        testSupport.assertTypedDate(for: date.scope(to: \.nanosecond, calendar: calendar))
    }

    @Test(arguments: Calendar.Identifier.allCases)
    func testScopeNotNil(identifier: Calendar.Identifier) {
        let calendar = Calendar(identifier: identifier)
        testSupport.dates(calendar: calendar).compactMap { $0 }.forEach {
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
        testSupport.dates(calendar: Calendar(identifier: identifier)).forEach { date in
            #expect(date != nil)
        }
    }
}
