# TypedDate
Library for handling dates in a type-safe manner. By using this library, you can manipulate parts of a date with ease and confidence.

## Problem with Traditional Date Handling
Traditional date handling in programming languages often involves dealing with dates as a single unit. This can lead to errors when manipulating individual parts of a date, such as the day, month, or year. Furthermore, it can be difficult to understand what a particular date represents if it is missing certain parts (e.g., a date with no day).

## Solution and Benefits of TypedDate
TypedDate addresses these issues by treating each part of a date as a separate, type-safe entity. This means that you can’t accidentally assign a month to a day or vice versa. It also means that you can represent partial dates (e.g., a year and a month without a specific day) in a way that is clear and understandable.

Here are some benefits of using TypedDate:

- **Type Safety**: Each part of a date is a separate entity, preventing accidental assignment of one part to another.
- **Clarity**: It’s clear what each date represents, even if it’s missing certain parts.
- **Ease of Use**: The API is designed to be easy to use, with methods for filling, erasing, scoping, and modifying dates.

## Conformance to Standard Protocols
TypedDate conforms to the Comparable, Equatable, and Codable protocols, which makes it even more powerful and convenient compared to traditional date handling:

**Comparable and Equatable**: These protocols allow for easy comparison of TypedDate instances. You can check if one date is equal to, less than, or greater than another date using standard comparison operators (==, <, >, etc.). This is much more intuitive and less error-prone than comparing individual date components.

**Codable**: The Codable conformance means that TypedDate instances can be easily encoded to and decoded from various formats such as JSON. This is particularly useful when working with APIs or saving dates to persistent storage.

## Usage
### Initialization
To initialize a TypedDate, you can use the following syntax:

```Swift
let date = TypedDate(year: 2020, month: 12, day: 31)
```
This will create a TypedDate instance representing the date December 31, 2020.

### Fill Method
The fill method allows you to fill in a specific part of a date. For example:

```Swift
let date = TypedDate(year: 2020, month: 12, day: 31)
let filledDate = date.fill(.day, with: 1)
```
In this example, filledDate will represent the date December 1, 2020.

### Erase Method
The erase method allows you to erase a specific part of a date. For example:

```Swift
let date = TypedDate(year: 2020, month: 12, day: 31)
let erasedDate = date.erase(.day)
In this example, erasedDate will represent the date December 2020, with no specific day.
```

### Scope Method
The scope method allows you to get the range of a specific part of a date. For example:

```Swift
let date = TypedDate(year: 2020, month: 12, day: 31)
let scope = date.scope(of: .month)
```
In this example, scope will be a range representing the entire month of December 2020.

### Modify Method
The modify method allows you to modify a specific part of a date. For example:

```
let date = TypedDate(year: 2020, month: 12, day: 31)
let modifiedDate = date.modify(.year, by: 1)
```
In this example, modifiedDate will represent the date December 31, 2021.
