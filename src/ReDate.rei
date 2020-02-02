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

let isValid:
  (
    ~year: float,
    ~month: float,
    ~date: float,
    ~hours: float=?,
    ~minutes: float=?,
    ~seconds: float=?,
    unit
  ) =>
  bool;

let closestToArray: (array(Js.Date.t), Js.Date.t) => option(Js.Date.t);

let closestToList: (list(Js.Date.t), Js.Date.t) => option(Js.Date.t);

/* ——[Second helpers]——————————— */

let addSeconds: (int, Js.Date.t) => Js.Date.t;

let subSeconds: (int, Js.Date.t) => Js.Date.t;

let differenceInSeconds: (Js.Date.t, Js.Date.t) => int;

let startOfSecond: Js.Date.t => Js.Date.t;

let endOfSecond: Js.Date.t => Js.Date.t;

let isSameSecond: (Js.Date.t, Js.Date.t) => bool;

/* ——[Minute helpers]——————————— */

let addMinutes: (int, Js.Date.t) => Js.Date.t;

let subMinutes: (int, Js.Date.t) => Js.Date.t;

let differenceInMinutes: (Js.Date.t, Js.Date.t) => int;

let startOfMinute: Js.Date.t => Js.Date.t;

let endOfMinute: Js.Date.t => Js.Date.t;

let isSameMinute: (Js.Date.t, Js.Date.t) => bool;

let roundToNearestMinute: (~nearestTo: int=?, Js.Date.t) => Js.Date.t;

/* ——[Hour helpers]——————————— */

let addHours: (int, Js.Date.t) => Js.Date.t;

let subHours: (int, Js.Date.t) => Js.Date.t;

let differenceInHours: (Js.Date.t, Js.Date.t) => int;

let startOfHour: Js.Date.t => Js.Date.t;

let endOfHour: Js.Date.t => Js.Date.t;

let isSameHour: (Js.Date.t, Js.Date.t) => bool;

/* ——[Day helpers——————————— */

let addBusinessDays: (int, Js.Date.t) => Js.Date.t;

let addDays: (int, Js.Date.t) => Js.Date.t;

let subDays: (int, Js.Date.t) => Js.Date.t;

let startOfDay: Js.Date.t => Js.Date.t;

let endOfDay: Js.Date.t => Js.Date.t;

let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => int;

let differenceInDays: (Js.Date.t, Js.Date.t) => int;

let differenceInBusinessDays: (Js.Date.t, Js.Date.t) => int;

let getDayOfYear: Js.Date.t => int;

let isSameDay: (Js.Date.t, Js.Date.t) => bool;

let isToday: Js.Date.t => bool;

let isTomorrow: Js.Date.t => bool;

let isYesterday: Js.Date.t => bool;

/* ——[Week helpers]——————————— */

let addWeeks: (int, Js.Date.t) => Js.Date.t;

let subWeeks: (int, Js.Date.t) => Js.Date.t;

let differenceInWeeks: (Js.Date.t, Js.Date.t) => int;

let startOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

let endOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

let differenceInCalendarWeeks:
  (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => int;

let isSameWeek: (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => bool;

let lastDayOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t;

let getWeekOfMonth: (~weekStartsOn: day=?, Js.Date.t) => int;

let getWeeksInMonth: (~weekStartsOn: day=?, Js.Date.t) => int;

/* ——[Weekday helpers]——————————— */

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

let addMonths: (int, Js.Date.t) => Js.Date.t;

let subMonths: (int, Js.Date.t) => Js.Date.t;

let differenceInCalendarMonths: (Js.Date.t, Js.Date.t) => int;

let differenceInMonths: (Js.Date.t, Js.Date.t) => int;

let startOfMonth: Js.Date.t => Js.Date.t;

let endOfMonth: Js.Date.t => Js.Date.t;

let isFirstDayOfMonth: Js.Date.t => bool;

let isLastDayOfMonth: Js.Date.t => bool;

let isSameMonth: (Js.Date.t, Js.Date.t) => bool;

let lastDayOfMonth: Js.Date.t => Js.Date.t;

/* ——[Year helpers]——————————— */

let addYears: (int, Js.Date.t) => Js.Date.t;

let subYears: (int, Js.Date.t) => Js.Date.t;

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

let isWithinInterval: (interval, Js.Date.t) => bool;

let areIntervalsOverlapping: (interval, interval) => bool;

let getOverlappingDaysInIntervals: (interval, interval) => int;

let eachDayOfIntervalArray: interval => array(Js.Date.t);

let eachDayOfIntervalList: interval => list(Js.Date.t);

/* ——[ISO Week helpers]——————————— */

let endOfISOWeek: Js.Date.t => Js.Date.t;

let getISOWeek: Js.Date.t => float;

let isSameISOWeek: (Js.Date.t, Js.Date.t) => bool;

let isThisISOWeek: Js.Date.t => bool;

let lastDayOfISOWeek: Js.Date.t => Js.Date.t;

let setISOWeek: (Js.Date.t, ~week: float) => Js.Date.t;

let startOfISOWeek: Js.Date.t => Js.Date.t;

let differenceInCalendarISOWeeks: (Js.Date.t, Js.Date.t) => int;

/* ——[ISO Week-Numbering Year Helpers]—— */

let getISOWeekYear: Js.Date.t => float;

let startOfISOWeekYear: Js.Date.t => Js.Date.t;