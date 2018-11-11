type dates =
  | List(list(Js.Date.t))
  | Array(array(Js.Date.t));

type interval = {
  start: Js.Date.t,
  end_: Js.Date.t
};

let isEqual: (Js.Date.t, Js.Date.t) => bool;

let isAfter: (Js.Date.t, Js.Date.t) => bool;

let isBefore: (Js.Date.t, Js.Date.t) => bool;

let isFuture: Js.Date.t => bool;

let isPast: Js.Date.t => bool;

let compareAsc: (Js.Date.t, Js.Date.t) => int;

let compareDesc: (Js.Date.t, Js.Date.t) => int;

let min: dates => Js.Date.t;

let max: dates => Js.Date.t;

let isWithinInterval: (Js.Date.t, ~start: Js.Date.t, ~end_: Js.Date.t) => bool;

let areIntervalsOverlapping: (interval, interval) => bool;

let getOverlappingDaysInIntervals: (interval, interval) => int;

let getDaysInMonth: Js.Date.t => int;

let addDays: (Js.Date.t, int) => Js.Date.t;

let subDays: (Js.Date.t, int) => Js.Date.t;

let addWeeks: (Js.Date.t, int) => Js.Date.t;

let subWeeks: (Js.Date.t, int) => Js.Date.t;

let addMonths: (Js.Date.t, int) => Js.Date.t;

let subMonths: (Js.Date.t, int) => Js.Date.t;

let addYears: (Js.Date.t, int) => Js.Date.t;

let startOfDay: Js.Date.t => Js.Date.t;

let endOfDay: Js.Date.t => Js.Date.t;

let diffInCalendarDays: (Js.Date.t, Js.Date.t) => int;
