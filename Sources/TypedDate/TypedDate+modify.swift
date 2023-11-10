import Foundation

@ModifyContext
public extension TypedDate<Year> {}

@ModifyContext
public extension TypedDate<(Year, Month)> {}

@ModifyContext
public extension TypedDate<(Year, Month, Day)> {}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour)> {}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute)> {}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {}

@ModifyContext
public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {}
