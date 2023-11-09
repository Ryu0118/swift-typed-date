import Foundation

@EraseContext
public extension TypedDate<(Year, Month)> {}

@EraseContext
public extension TypedDate<(Year, Month, Day)> {}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour)> {}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}

@EraseContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {}
