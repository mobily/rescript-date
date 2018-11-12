type interval = {
  start: Js.Date.t,
  end_: Js.Date.t
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

/* ——[Seconds helpers]——————————— */

let addSeconds: (Js.Date.t, int) => Js.Date.t;

let subSeconds: (Js.Date.t, int) => Js.Date.t;

/* ——[Day helpers——————————— */

let getDaysInMonth: Js.Date.t => int;

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

let addMonths: (Js.Date.t, int) => Js.Date.t;

let subMonths: (Js.Date.t, int) => Js.Date.t;

let differenceInCalendarMonths: (Js.Date.t, Js.Date.t) => int;

let startOfMonth: Js.Date.t => Js.Date.t;

let endOfMonth: Js.Date.t => Js.Date.t;

let isFirstDayOfMonth: Js.Date.t => bool;

let isLastDayOfMonth: Js.Date.t => bool;

let isSameMonth: (Js.Date.t, Js.Date.t) => bool;

let lastDayOfMonth: Js.Date.t => Js.Date.t;

/* ——[Year helpers]——————————— */

let addYears: (Js.Date.t, int) => Js.Date.t;

let subYears: (Js.Date.t, int) => Js.Date.t;

let startOfYear: Js.Date.t => Js.Date.t;

/* ——[Interval helpers]——————————— */

let isWithinInterval: (Js.Date.t, ~start: Js.Date.t, ~end_: Js.Date.t) => bool;

let areIntervalsOverlapping: (interval, interval) => bool;

let getOverlappingDaysInIntervals: (interval, interval) => int;

let eachDayOfIntervalArray: interval => array(Js.Date.t);

let eachDayOfIntervalList: interval => list(Js.Date.t);
