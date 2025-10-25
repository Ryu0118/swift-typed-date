# TypedDate

  ![Language:Swift](https://img.shields.io/static/v1?label=Language&message=Swift&color=orange&style=flat-square)
  ![License:MIT](https://img.shields.io/static/v1?label=License&message=MIT&color=blue&style=flat-square)
  [![Latest Release](https://img.shields.io/github/v/release/Ryu0118/swift-typed-date?style=flat-square)](https://github.com/Ryu0118/swift-typed-date/releases/latest)
  [![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FRyu0118%2Fswift-typed-date%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Ryu0118/swift-typed-date)
  [![Twitter](https://img.shields.io/twitter/follow/ryu_hu03?style=social)](https://twitter.com/ryu_hu03)

TypedDate is a wrapper for Swift's Date that enhances date handling at the type level. It enables the construction of custom date structures, ranging from single components like year to combinations of year, month, day, time, etc., tailored to specific development requirements.

Key features of TypedDate include:

* **Explicit Clarity in Date Components**
<br>Allows developers to specify precisely which date components (year, month, day, etc.) they are working with, leading to a better understanding and less likelihood of inconsistencies.
* **Flexible Customization**
<br>Enables the creation of date objects with different levels of detail, from a simple year-only structure to more comprehensive ones including month, day, second, and nanosecond.
* **Modifiable Date Components**
<br>Provides methods for modifying individual components such as year, month or day.
* **Seamless Conversion**
<br>Enables effortless conversion between 'TypedDate' and Swift's standard Date object, adapting to different scenarios by filling in any missing components as needed.

## Usage
### Initialization
To initialize a TypedDate, you can use the following syntax:

```Swift
import TypedDate

TypedDate(Year(2023), Month(11), Day(12))
TypedDate(Year(2023), Month(11), Day(12), calendar: Calendar(identifier: .gregorian))
TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12), Second(1), Nanosecond(10000000))
TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12), FractionalSecond(5.12))
```
This will create a TypedDate instance representing the date 2023/11/12.
<br>Date has the following components available: Year, Month, Day, Hour, Minute, Second, and Nanosecond.

### Date to TypedDate conversion
To create a TypedDate from a Date, use `Date.scope(to:calendar:)`.
```Swift
let typedDate1: TypedDate<(Year, Month)> = Date().scope(to: \.month)
let typedDate2: TypedDate<(Year, Month, Day, Hour)> = Date().scope(to: \.hour)
let typedDate3: TypedDate<(Year, Month, Day, Hour, Minute)> = Date().scope(to: \.minute, calendar: Calendar(identifier: .gregorian))
let typedDate4: TypedDateOfYear = Date().scope(to: \.year)
let typedDate5: TypedDateOfDay = Date().scope(to: \.day)
```

### TypedDate to Date conversion
To convert from TypedDate to Date, use date property.
```Swift
typedDate.date // Date
```

### Fill
The fill method allows you to fill in a specific part of a date. For example:
```Swift
let typedDate = TypedDate(Year(2023), Month(11), Day(12))
// typedDate: TypedDate<(Year, Month, Day)>

typedDate.fill(
    to: \.second,
    arguments: (Hour(11), Minute(12), Second(10))
)
// TypedDate<(Year, Month, Day, Hour, Minute, Second)>

typedDate.fill(
    to: \.hour,
    arguments: (Hour(11)),
    calendar: Calendar(identifier: .gregorian)
)
// TypedDate<(Year, Month, Day, Hour)>
```
In this example, filledDate will represent the date 2023/11/12 11:12

### Erase
The erase method allows you to erase a specific part of a date. For example:

```Swift
let date = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12))
let erasedDate1: TypedDate<(Year, Month, Day)> = date.erase(to: \.day)
let erasedDate2: TypedDate<(Year, Month)> = date.erase(to: \.month)
let erasedDate2: TypedDate<(Year)> = date.erase(to: \.year, calendar: Calendar(identifier: .gregorian)
```
In this example, erasedDate will be erased up to date specified in keyPath.

### Modify
The modify method allows you to modify a specific part of a date. For example:
```Swift
let typedDate = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12))
// typedDate: 2023/11/12 11:12

let modifiedDate = typedDate.modifying(\.year) { $0 += 1 }
    .modifying(\.month) { $0 -= 2 }
    .modifying(\.day) { $0 += 3 }
    .modifying(\.hour) { $0 += 4 }
    .modifying(\.minute) { $0 += 5 }
    .add(\.year, 1)
    .add(\.month, -2)
    .add(\.day, 3)
    .add(\.hour, -2)
    .add(\.minute, -3)
// modifiedDate: 2025/07/18 13:14
```
or use `TypedDate.modify(_:calendar:modify:)` method
```Swift
var typedDate = TypedDate(Year(2023), Month(11))

typedDate.modify(\.year) { $0 += 1 }
// typedDate: 2024/11 
```

### Access to each date component
```Swift
let typedDate = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12), Second(1), Nanosecond(10000000))
typedDate.year() // 2023
typedDate.month(calendar: Calendar(identifier: .gregorian)) // 11
typedDate.day() // 12
typedDate.hour(calendar: Calendar(identifier: .gregorian)) // 11
typedDate.minute() // 12
typedDate.second(calendar: Calendar(identifier: .gregorian) // 1
typedDate.nanosecond() // 10000000
```

### Simplifying TypedDate with TypedDateOf〇〇 Aliases
This library includes the following typealias:
```Swift
public typealias TypedDateOfYear = TypedDate<Year>
public typealias TypedDateOfMonth = TypedDate<(Year, Month)>
public typealias TypedDateOfDay = TypedDate<(Year, Month, Day)>
public typealias TypedDateOfHour = TypedDate<(Year, Month, Day, Hour)>
public typealias TypedDateOfMinute = TypedDate<(Year, Month, Day, Hour, Minute)>
public typealias TypedDateOfSecond = TypedDate<(Year, Month, Day, Hour, Minute, Second)>
public typealias TypedDateOfNanosecond = TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)>
```

### Conformance to Standard Protocols
TypedDate conforms to the Comparable, Equatable, Hashable, and Codable protocols, which makes it even more powerful and convenient compared to traditional date handling:

#### **Comparable and Equatable**
These protocols allow for easy comparison of TypedDate instances. You can check if one date is equal to, less than, or greater than another date using standard comparison operators (==, <, >, etc.). This is much more intuitive and less error-prone than comparing individual date components.
```Swift
let date1: Date // 2023/11/12
let date2: Date // 2023/11/11

// To check the date have the same year
date1.scope(to: \.year) == date2.scope(to: \.year) // -> true

// To check the date have the same year, month, and day
date1.scope(to: \.day) == date2.scope(to: \.day) // -> false

// Compare days
date1.scope(to: \.day) > date2.scope(to: \.day) // -> true
```
#### **Codable**
The Codable conformance means that TypedDate instances can be easily encoded to and decoded from various formats such as JSON. This is particularly useful when working with APIs or saving dates to persistent storage.

## Installation
```Swift
.package(url: "https://github.com/Ryu0118/swift-typed-date", exact: "0.9.0")
```
