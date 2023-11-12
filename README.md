# TypedDate
TypedDate is a type-safe wrapper for Swift's Date object, enhancing flexibility in date handling. It enables custom date structures, from single components like year to more complex combinations of year, month, and day, meeting specific developmental needs.

Key features of TypedDate include:

* **Explicit Clarity in Date Components**
<br>Allows developers to specify precisely which date components (year, month, day, etc.) they are working with, leading to a better understanding and less likelihood of inconsistencies.
* **Flexible Customization**
<br>Enables the creation of date objects with different levels of detail, from a simple year-only structure to more comprehensive ones including month, day, second, and nanosecond, catering to diverse programming needs.
* **Modifiable Date Components**
<br>Provides methods for modifying individual components such as year or month, allowing for more nuanced and precise date manipulations.
* **Seamless Conversion**
<br>Facilitates easy conversion to and from the standard Date object, with customizable defaults for missing components like day or seconds, ensuring adaptability to various scenarios.

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
    calendar: Calendar(identifier: .gregorian
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
// modifiedDate: 2024/09/15 15:17
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

### Conformance to Standard Protocols
TypedDate conforms to the Comparable, Equatable, and Codable protocols, which makes it even more powerful and convenient compared to traditional date handling:

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
