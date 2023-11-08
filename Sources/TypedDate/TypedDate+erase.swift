import Foundation

public extension TypedDate<Year> {
}

public extension TypedDate<(Year, Month)> {
    final class _MonthEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
    }

    func erase<T>(
        to keyPath: KeyPath<_MonthEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MonthEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

public extension TypedDate<(Year, Month, Day)> {
    final class _DayEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
        public lazy var month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
    }

    func erase<T>(
        to keyPath: KeyPath<_DayEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _DayEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

public extension TypedDate<(Year, Month, Day, Hour)> {
    final class _HourEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
        public lazy var month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
        public lazy var day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
    }

    func erase<T>(
        to keyPath: KeyPath<_HourEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _HourEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute)> {
    final class _MinuteEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
        public lazy var month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
        public lazy var day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
        public lazy var hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
    }

    func erase<T>(
        to keyPath: KeyPath<_MinuteEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _MinuteEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute, Second)> {
    final class _SecondEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
        public lazy var month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
        public lazy var day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
        public lazy var hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
        public lazy var minute = (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
    }

    func erase<T>(
        to keyPath: KeyPath<_SecondEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _SecondEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}

public extension TypedDate<(Year, Month, Day, Hour, Minute, Second, Nanosecond)> {
    final class _NanosecondEraseContext {
        private let base: Components

        init(base: Components) {
            self.base = base
        }

        public lazy var year = (TypedDate<(Year)>.self, (base.0))
        public lazy var month = (TypedDate<(Year, Month)>.self, (base.0, base.1))
        public lazy var day = (TypedDate<(Year, Month, Day)>.self, (base.0, base.1, base.2))
        public lazy var hour = (TypedDate<(Year, Month, Day, Hour)>.self, (base.0, base.1, base.2, base.3))
        public lazy var minute = (TypedDate<(Year, Month, Day, Hour, Minute)>.self, (base.0, base.1, base.2, base.3, base.4))
        public lazy var second = (TypedDate<(Year, Month, Day, Hour, Minute, Second)>.self, (base.0, base.1, base.2, base.3, base.4, base.5))
    }

    func erase<T>(
        to keyPath: KeyPath<_NanosecondEraseContext, (TypedDate<T>.Type, T)>,
        calendar: Calendar = .current
    ) -> TypedDate<T> {
        let context = _NanosecondEraseContext(base: components)[keyPath: keyPath]
        return context.0.init(context.1, calendar: calendar)
    }
}
