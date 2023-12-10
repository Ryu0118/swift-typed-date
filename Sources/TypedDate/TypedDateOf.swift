import Foundation

public typealias TypedDateOfYear = TypedDate<Year>
public typealias TypedDateOfMonth = TypedDate<(Year, Month)>
public typealias TypedDateOfDay = TypedDate<(Year, Month, Day)>
public typealias TypedDateOfHour = TypedDate<(Year, Month, Day, Hour)>
public typealias TypedDateOfMinute = TypedDate<(Year, Month, Day, Hour, Minute)>
public typealias TypedDateOfSecond = TypedDate<(Year, Month, Day, Hour, Minute, Second)>
public typealias TypedDateOfNanosecond = TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>
