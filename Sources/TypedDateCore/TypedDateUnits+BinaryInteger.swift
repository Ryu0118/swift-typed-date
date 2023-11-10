import Foundation

public protocol TypedDateUnit: BinaryInteger where Words == Int.Words, Magnitude == Int.Magnitude, IntegerLiteralType == Int.IntegerLiteralType {
    var value: Int { get }
    init(_: Int)
}

public extension TypedDateUnit {
    static var zero: Self {
        .init(0)
    }

    static func + (lhs: Self, rhs: Self) -> Self {
        Self(lhs.value + rhs.value)
    }

    static func - (lhs: Self, rhs: Self) -> Self {
        Self(lhs.value - rhs.value)
    }

    static var isSigned: Bool {
        Int.isSigned
    }

    init<T>(_ source: T) where T : BinaryFloatingPoint {
        self.init(Int(source))
    }

    var words: Int.Words {
        value.words
    }

    var bitWidth: Int {
        value.bitWidth
    }

    var trailingZeroBitCount: Int {
        value.trailingZeroBitCount
    }

    static func / (lhs: Self, rhs: Self) -> Self {
        Self(lhs.value / rhs.value)
    }

    static func % (lhs: Self, rhs: Self) -> Self {
        Self(lhs.value % rhs.value)
    }

    static func %= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value % rhs.value)
    }

    static func * (lhs: Self, rhs: Self) -> Self {
        Self(lhs.value * rhs.value)
    }

    static func *= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value * rhs.value)
    }

    static func &= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value & rhs.value)
    }

    static func |= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value | rhs.value)
    }

    static func ^= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value ^ rhs.value)
    }

    var magnitude: UInt {
        value.magnitude
    }

    init(integerLiteral value: Int) {
        self.init(value)
    }

    static func <<= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs = Self(lhs.value << rhs)
    }

    static func >>= <RHS>(lhs: inout Self, rhs: RHS) where RHS : BinaryInteger {
        lhs = Self(lhs.value >> rhs)
    }

    static prefix func ~ (x: Self) -> Self {
        Self(~x.value)
    }

    static func /= (lhs: inout Self, rhs: Self) {
        lhs = Self(lhs.value / rhs.value)
    }

    init?<T>(exactly source: T) where T : BinaryInteger {
        if let integer = Int(exactly: source) {
            self.init(integer)
        } else {
            return nil
        }
    }

    init?<T>(exactly source: T) where T : BinaryFloatingPoint {
        if let integer = Int(exactly: source) {
            self.init(integer)
        } else {
            return nil
        }
    }

    init<T>(_ source: T) where T : BinaryInteger {
        self.init(Int(source))
    }

    init<T>(truncatingIfNeeded source: T) where T : BinaryInteger {
        self.init(Int(truncatingIfNeeded: source))
    }

    init<T>(clamping source: T) where T : BinaryInteger {
        self.init(Int(clamping: source))
    }

    func add(_ value: Int) -> Self {
        Self(self.value + value)
    }
}
