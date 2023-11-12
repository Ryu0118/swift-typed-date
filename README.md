# TypedDate
Library for handling dates in a type-safe manner. By using this library, you can manipulate parts of a date with ease and confidence.

## Motivation
### Problem with Traditional Date Handling
Traditional date handling in programming languages often involves dealing with dates as a single unit. This can lead to errors when manipulating individual parts of a date, such as the day, month, or year. Furthermore, it can be difficult to understand what a particular date represents if it is missing certain parts (e.g., a date with no day).

### Solution and Benefits of TypedDate
TypedDate addresses these issues by treating each part of a date as a separate, type-safe entity. This means that you can’t accidentally assign a month to a day or vice versa. It also means that you can represent partial dates (e.g., a year and a month without a specific day) in a way that is clear and understandable.

Here are some benefits of using TypedDate:

* **Type Safety**
<br> TypedDate can specify the required Date components at the type level
* **Clarity**
<br> It is clear up to which component of the date is represented.
* **Ease of Use**
<br> Ease of filling, erasing, and modifying date components, conversion from `Date` to `TypedDate` and from `TypedDate` to `Date`.

## Usage
### Initialization
To initialize a TypedDate, you can use the following syntax:

```Swift
let typedDate = TypedDate(Year(2023), Month(11), Day(12))
```
This will create a TypedDate instance representing the date 2023/11/12.
<br>Date has the following components available: Year, Month, Day, Hour, Minute, Second, and Nanosecond.
```Swift
let typedDate = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12), Second(1), Nanosecond(10000000))
```
or use the `Date.scope(to:calendar:)` method to convert from `Date` to `TypedDate`
```Swift
let typedDate1: TypedDate<(Year, Month)> = Date().scope(to: \.month)
let typedDate2: TypedDate<(Year, Month, Day, Hour)> = Date().scope(to: \.hour)
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
let filledDate = typedDate.fill(to: \.minute, arguments: (Hour(11), Minute(12))))
// filledDate: TypedDate<(Year, Month, Day, Hour, Minute)>
```
In this example, filledDate will represent the date 2023/11/12 11:12

### Erase
The erase method allows you to erase a specific part of a date. For example:

```Swift
let date: TypedDate<(Year, Month, Day, Hour, Minute)> = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12))
let erasedDate1: TypedDate<(Year, Month, Day)> = date.erase(to: \.day)
let erasedDate2: TypedDate<(Year, Month)> = date.erase(to: \.month)
let erasedDate2: TypedDate<(Year)> = date.erase(to: \.year)
```
In this example, erasedDate will be erased up to date specified in keyPath.

### Modify
The modify method allows you to modify a specific part of a date. For example:
```Swift
let date = TypedDate(Year(2023), Month(11), Day(12), Hour(11), Minute(12))
let modifiedDate = date.modifying(\.year) { $0 += 1 }
            .modifying(\.month) { $0 -= 2 }
            .modifying(\.day) { $0 += 3 }
            .modifying(\.hour) { $0 += 4 }
            .modifying(\.minute) { $0 += 5 }
// modifiedDate: 2024/09/15 15:17
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
