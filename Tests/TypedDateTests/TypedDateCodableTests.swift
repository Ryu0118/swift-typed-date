import Foundation
import Testing
@testable import TypedDate

@Suite
struct TypedDateCodableTests {
    let calendar: Calendar
    let testSupport: TypedDateTestSupport

    init() {
        calendar = Calendar(identifier: .gregorian)
        testSupport = TypedDateTestSupport.init(calendar: calendar)
    }

    @Test
    func testCodable() throws {
        let typedDate = testSupport.generateTypedNanosecondDate()
        let jsonEncoder = JSONEncoder()
        let data = try jsonEncoder.encode(typedDate)
        let decoded1 = try JSONDecoder().decode(TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>.self, from: data)
        testSupport.assertTypedDate(for: decoded1)
        let decoded2 = try JSONDecoder().decode(TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self, from: data)
        testSupport.assertTypedDate(for: decoded2)
        let decoded3 = try JSONDecoder().decode(TypedDate<(Year, Month, Day, Hour, Minute)>.self, from: data)
        testSupport.assertTypedDate(for: decoded3)
        let decoded4 = try JSONDecoder().decode(TypedDate<(Year, Month, Day, Hour)>.self, from: data)
        testSupport.assertTypedDate(for: decoded4)
        let decoded5 = try JSONDecoder().decode(TypedDate<(Year, Month, Day)>.self, from: data)
        testSupport.assertTypedDate(for: decoded5)
        let decoded6 = try JSONDecoder().decode(TypedDate<(Year, Month)>.self, from: data)
        testSupport.assertTypedDate(for: decoded6)
        let decoded7 = try JSONDecoder().decode(TypedDate<(Year, Month)>.self, from: data)
        testSupport.assertTypedDate(for: decoded7)
        let decoded8 = try JSONDecoder().decode(TypedDate<(Year)>.self, from: data)
        testSupport.assertTypedDate(for: decoded8)
    }
}
