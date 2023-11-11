import Foundation

extension TypedDate: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let date = try container.decode(Date.self, forKey: .date)
        let calendar = Calendar.current

        switch Components.self {
        case is (Year).Type:
            let dc = calendar.dateComponents([.year], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = Year(year) as! Components

        case is (Year, Month).Type:
            let dc = calendar.dateComponents([.year, .month], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = (Year(year), Month(month)) as! Components

        case is (Year, Month, Day).Type:
            let dc = calendar.dateComponents([.year, .month, .day], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month,
                  let day = dc.day
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = (Year(year), Month(month), Day(day)) as! Components

        case is (Year, Month, Day, Hour).Type:
            let dc = calendar.dateComponents([.year, .month, .day, .hour], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month,
                  let day = dc.day,
                  let hour = dc.hour
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = (Year(year), Month(month), Day(day), Hour(hour)) as! Components

        case is (Year, Month, Day, Hour, Minute).Type:
            let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month,
                  let day = dc.day,
                  let hour = dc.hour,
                  let minute = dc.minute
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute)) as! Components

        case is (Year, Month, Day, Hour, Minute, Second).Type:
            let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month,
                  let day = dc.day,
                  let hour = dc.hour,
                  let minute = dc.minute,
                  let second = dc.second
            else {
                throw TypedDateDecodingError.invalidDate
            }
            self.date = date
            self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute), Second(second)) as! Components

        case is (Year, Month, Day, Hour, Minute, Second, Nanosecond).Type:
            let dc = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .nanosecond], from: date)
            guard let date = calendar.date(from: dc),
                  let year = dc.year,
                  let month = dc.month,
                  let day = dc.day,
                  let hour = dc.hour,
                  let minute = dc.minute,
                  let second = dc.second
            else {
                throw TypedDateDecodingError.invalidDate
            }
            let nanosecond = dc.nanosecond ?? 0
            self.date = date
            self.components = (Year(year), Month(month), Day(day), Hour(hour), Minute(minute), Second(second), Nanosecond(nanosecond)) as! Components

        default: throw TypedDateDecodingError.invalidComponents
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(date, forKey: .date)
    }

    public enum CodingKeys: CodingKey {
        case date
    }
}

public enum TypedDateDecodingError: Error {
    case invalidDate
    case invalidComponents
}
