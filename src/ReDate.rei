type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
};

type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday;

/* ——[Common helpers]——————————— */

let isEqual: (Js.Date.t, Js.Date.t) => bool;

let isAfter: (Js.Date.t, Js.Date.t) => bool;

let isBefore: (Js.Date.t, Js.Date.t) => bool;

let isFuture: Js.Date.t => bool;

let isPast: Js.Date.t => bool;

let compareAsc: (Js.Date.t, Js.Date.t) => int;

let compareDesc: (Js.Date.t, Js.Date.t) => int;

let minOfArray: array(Js.Date.t) => Js.Date.t;

let minOfList: list(Js.Date.t) => Js.Date.t;

let maxOfArray: array(Js.Date.t) => Js.Date.t;

let maxOfList: list(Js.Date.t) => Js.Date.t;

let isValid: (~year: float, ~month: float, ~date: float, unit) => option(Js.Date.t);

/* ——[Second helpers]——————————— */

let addSeconds: (Js.Date.t, int) => Js.Date.t;

let subSeconds: (Js.Date.t, int) => Js.Date.t;

let differenceInSeconds: (Js.Date.t, Js.Date.t) => int;

let startOfSecond: Js.Date.t => Js.Date.t;

let endOfSecond: Js.Date.t => Js.Date.t;

let isSameSecond: (Js.Date.t, Js.Date.t) => bool;

/* ——[Minute helpers]——————————— */

let addMinutes: (Js.Date.t, int) => Js.Date.t;

let subMinutes: (Js.Date.t, int) => Js.Date.t;

let differenceInMinutes: (Js.Date.t, Js.Date.t) => int;

let startOfMinute: Js.Date.t => Js.Date.t;

let endOfMinute: Js.Date.t => Js.Date.t;

let isSameMinute: (Js.Date.t, Js.Date.t) => bool;

let roundToNearestMinute: (~nearestTo: int=?, Js.Date.t) => Js.Date.t

/* ——[Hour helpers]——————————— */

let addHours: (Js.Date.t, int) => Js.Date.t;

let subHours: (Js.Date.t, int) => Js.Date.t;

let differenceInHours: (Js.Date.t, Js.Date.t) => int;

let startOfHour: Js.Date.t => Js.Date.t;

let endOfHour: Js.Date.t => Js.Date.t;

let isSameHour: (Js.Date.t, Js.Date.t) => bool;

/* ——[Day helpers——————————— */

let addDays: (Js.Date.t, int) => Js.Date.t;

let subDays: (Js.Date.t, int) => Js.Date.t;

let startOfDay: Js.Date.t => Js.Date.t;

let endOfDay: Js.Date.t => Js.Date.t;

let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => int;

let differenceInDays: (Js.Date.t, Js.Date.t) => int;

let getDayOfYear: Js.Date.t => int;

let isSameDay: (Js.Date.t, Js.Date.t) => bool;

let isToday: Js.Date.t => bool;

let isTomorrow: Js.Date.t => bool;

let isYesterday: Js.Date.t => bool;

/* ——[Week helpers]——————————— */

let addWeeks: (Js.Date.t, int) => Js.Date.t;

let subWeeks: (Js.Date.t, int) => Js.Date.t;

let differenceInWeeks: (Js.Date.t, Js.Date.t) => int;

let startOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

let endOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

let differenceInCalendarWeeks: (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => int;

let isSameWeek: (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => bool;

let lastDayOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

/* ——[Weekday helpers]——————————— */

let is: (Js.Date.t, day) => bool;

let isSunday: Js.Date.t => bool;

let isMonday: Js.Date.t => bool;

let isTuesday: Js.Date.t => bool;

let isWednesday: Js.Date.t => bool;

let isThursday: Js.Date.t => bool;

let isFriday: Js.Date.t => bool;

let isSaturday: Js.Date.t => bool;

let isWeekend: Js.Date.t => bool;

/* ——[Month helpers]——————————— */

let getDaysInMonth: Js.Date.t => int;

let addMonths: (Js.Date.t, int) => Js.Date.t;

let subMonths: (Js.Date.t, int) => Js.Date.t;

let differenceInCalendarMonths: (Js.Date.t, Js.Date.t) => int;

let differenceInMonths: (Js.Date.t, Js.Date.t) => int;

let startOfMonth: Js.Date.t => Js.Date.t;

let endOfMonth: Js.Date.t => Js.Date.t;

let isFirstDayOfMonth: Js.Date.t => bool;

let isLastDayOfMonth: Js.Date.t => bool;

let isSameMonth: (Js.Date.t, Js.Date.t) => bool;

let lastDayOfMonth: Js.Date.t => Js.Date.t;

let getWeekOfMonth: (~weekStartsOn: day=?, Js.Date.t) => int;

let getWeeksInMonth: (~weekStartsOn: day=?, Js.Date.t) => int

/* ——[Year helpers]——————————— */

let addYears: (Js.Date.t, int) => Js.Date.t;

let subYears: (Js.Date.t, int) => Js.Date.t;

let startOfYear: Js.Date.t => Js.Date.t;

let isSameYear: (Js.Date.t, Js.Date.t) => bool;

let isLeapYear: Js.Date.t => bool;

let endOfYear: Js.Date.t => Js.Date.t;

let lastMonthOfYear: Js.Date.t => Js.Date.t;

let lastDayOfYear: Js.Date.t => Js.Date.t;

let getDaysInYear: Js.Date.t => int;

let differenceInCalendarYears: (Js.Date.t, Js.Date.t) => int;

let differenceInYears: (Js.Date.t, Js.Date.t) => int;

/* ——[Interval helpers]——————————— */

let isWithinInterval: (Js.Date.t, ~start: Js.Date.t, ~end_: Js.Date.t) => bool;

let areIntervalsOverlapping: (interval, interval) => bool;

let getOverlappingDaysInIntervals: (interval, interval) => int;

let eachDayOfIntervalArray: interval => array(Js.Date.t);

let eachDayOfIntervalList: interval => list(Js.Date.t);
