open Js;

type interval = {
  start: Date.t,
  end_: Date.t,
};

type offset =
  | Start(Date.t)
  | End(Date.t);

type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday;

type helper = Date.t => Date.t;

type differenceIn =
  | Seconds
  | Hours
  | Minutes
  | Days
  | CalendarDays(helper)
  | Weeks
  | CalendarWeeks(helper)
  | Months
  | CalendarMonths
  | Years
  | CalendarYears;

module Milliseconds = {
  let second = 1000;

  let minute = 60 * second;

  let hour = 60 * minute;

  let day = 24 * hour;

  let week = 7 * day;
};

module Internal = {
  let dayToJs =
    fun
    | Sunday => 0
    | Monday => 1
    | Tuesday => 2
    | Wednesday => 3
    | Thursday => 4
    | Friday => 5
    | Saturday => 6;

  let makeDate = date => Date.(date |> getTime |> fromFloat);

  /* based on: https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js */
  let getTimezoneOffsetInMilliseconds = date =>
    Date.(
      (date |> getTimezoneOffset)
      *. (Milliseconds.minute |> float_of_int)
      +. setSecondsMs(date |> makeDate, ~seconds=0., ~milliseconds=0., ())
      |> int_of_float
    )
    mod Milliseconds.minute
    |> float_of_int;

  let makeDateWithStartOfDayHours = date =>
    Date.(setHoursMSMs(date |> makeDate, ~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ()) |> fromFloat);

  let makeDateWithEndOfDayHours = date =>
    Date.(
      setHoursMSMs(date |> makeDate, ~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ()) |> fromFloat
    );

  let makeLastDayOfMonth = date =>
    Date.(makeWithYMD(~year=date |> getFullYear, ~month=(date |> getMonth) +. 1., ~date=0., ()));

  let startOfYear = date =>
    Date.(makeWithYMD(~year=date |> getFullYear, ~month=0., ~date=1., ()) |> makeDateWithStartOfDayHours);

  let getDaysInMonth = date => date |> makeLastDayOfMonth |> Date.getDate |> int_of_float;

  let addDays = (days, date) =>
    Date.(setDate(date |> makeDate, (date |> getDate) +. (days |> float_of_int)) |> fromFloat);

  let addMonths = (months, date) =>
    Date.(
      makeWithYMD(
        ~year=date |> getFullYear,
        ~month=(date |> getMonth) +. (months |> float_of_int),
        ~date=Math.min_float(date |> getDaysInMonth |> float_of_int, date |> getDate),
        (),
      )
    );

  let getMillisecondsOf =
    Milliseconds.(
      fun
      | Seconds => second
      | Minutes => minute
      | Hours => hour
      | Days
      | CalendarDays(_) => day
      | Weeks
      | CalendarWeeks(_) => week
      | _ => failwith("error")
    );

  let rec differenceIn = (differenceType, snd, fst) =>
    Date.(
      switch (differenceType) {
      | Seconds
      | Minutes
      | Hours
      | Days
      | Weeks =>
        let diff = ((fst |> getTime) -. (snd |> getTime)) /. (differenceType |> getMillisecondsOf |> float_of_int);
        diff > 0. ? diff |> Math.floor_int : diff |> Math.ceil_int;
      | Months =>
        let diff =
          (fst |> getMonth)
          -. (snd |> getMonth)
          +. 12.
          *. ((fst |> getFullYear) -. (snd |> getFullYear))
          |> int_of_float;
        let anchor = snd |> addMonths(diff);
        let anchorTime = anchor |> getTime;
        let fstTime = fst |> getTime;
        let adjust =
          if (fstTime -. anchorTime < 0.) {
            (fstTime -. anchorTime) /. (anchorTime -. (snd |> addMonths(diff |> pred) |> getTime));
          } else {
            (fstTime -. anchorTime) /. ((snd |> addMonths(diff |> succ) |> getTime) -. anchorTime);
          };

        (adjust |> Math.round |> int_of_float) + diff;
      | Years => differenceIn(Months, snd, fst) / 12
      | CalendarDays(startOf)
      | CalendarWeeks(startOf) =>
        let fst = fst |> startOf;
        let snd = snd |> startOf;
        let fstTime = (fst |> Date.getTime) -. (fst |> getTimezoneOffsetInMilliseconds);
        let sndTime = (snd |> Date.getTime) -. (snd |> getTimezoneOffsetInMilliseconds);
        let diff = (fstTime -. sndTime) /. (differenceType |> getMillisecondsOf |> float_of_int);
        diff |> Math.round |> int_of_float;
      | CalendarMonths =>
        ((fst |> getFullYear) -. (snd |> getFullYear))
        *. 12.
        +. ((fst |> getMonth) -. (snd |> getMonth))
        |> int_of_float
      | CalendarYears => (fst |> getFullYear) -. (snd |> getFullYear) |> int_of_float
      }
    );

  let retrieveMinOrMax = value => value |> Belt.Option.getExn |> Date.fromFloat;

  let compareAscOrDesc = (~x, ~y, fst, snd) =>
    switch ((fst |> Date.getTime) -. (snd |> Date.getTime)) {
    | ts when ts < 0. => x
    | ts when ts > 0. => y
    | _ => 0
    };

  let reduceMinOrMax = (fn, acc, date) =>
    switch (date |> Date.getTime) {
    | ts when acc === None || fn(ts, acc |> Belt.Option.getExn) => Some(ts)
    | _ => acc
    };

  let startOrEndOfWeek = (weekStartsOn, type_) => {
    open Date;

    let week = weekStartsOn |> dayToJs |> float_of_int;

    let date =
      switch (type_) {
      | Start(date) =>
        let day = date |> getDay;
        let diff = (day < week ? 7. : 0.) +. day -. week;
        setDate(date |> makeDate, (date |> getDate) -. diff);
      | End(date) =>
        let day = date |> getDay;
        let diff = (day < week ? (-7.) : 0.) +. 6. -. (day -. week);
        setDate(date |> makeDate, (date |> getDate) +. diff);
      };

    date |> fromFloat;
  };

  let isLeap = year => year mod 400 === 0 || year mod 4 === 0 && year mod 100 !== 0;

  let makeIntervalDay = (interval, index) => interval.start |> makeDateWithStartOfDayHours |> addDays(index);

  let getAmountOfIntervalDays = interval =>
    differenceIn(CalendarDays(makeDateWithStartOfDayHours), interval.start, interval.end_) |> succ;

  let is = (day, date) => date |> Date.getDay === (day |> dayToJs |> float_of_int);

  let minOrMaxOfArray = (fn, dates) => Belt.Array.reduce(dates, None, fn |> reduceMinOrMax) |> retrieveMinOrMax;

  let minOrMaxOfList = (fn, dates) => Belt.List.reduce(dates, None, fn |> reduceMinOrMax) |> retrieveMinOrMax;

  let startOfMonth = date => Date.(setDate(date |> makeDate, 1.) |> fromFloat |> makeDateWithStartOfDayHours);

  let lastDayOfMonth = date => date |> makeLastDayOfMonth |> makeDateWithStartOfDayHours;
};

/* ——[Common helpers]——————————— */

let isEqual = (snd, fst) => Date.(fst |> getTime === (snd |> getTime));

let isAfter = (snd, fst) => Date.(fst |> getTime > (snd |> getTime));

let isBefore = (snd, fst) => Date.(fst |> getTime < (snd |> getTime));

let isFuture = date => date |> isAfter(Date.make());

let isPast = date => date |> isBefore(Date.make());

let compareAsc = Internal.compareAscOrDesc(~x=-1, ~y=1);

let compareDesc = Internal.compareAscOrDesc(~x=1, ~y=-1);

let minOfArray = Internal.minOrMaxOfArray((<));

let minOfList = Internal.minOrMaxOfList((<));

let maxOfArray = Internal.minOrMaxOfArray((>));

let maxOfList = Internal.minOrMaxOfList((>));

let isValid = (~year, ~month, ~date, ~hours=0., ~minutes=0., ~seconds=0., ()) =>
  year <= 199999.
  && year >= (-199999.)
  && month <= 11.
  && month >= 0.
  && date >= 1.
  && date <= Date.(makeWithYM(~year, ~month, ()) |> Internal.makeLastDayOfMonth |> getDate)
  && hours >= 0.
  && hours <= 23.
  && minutes >= 0.
  && minutes <= 59.
  && seconds >= 0.
  && seconds <= 59.;

/* ——[Second helpers]——————————— */

let addSeconds = (seconds, date) =>
  Date.(setSeconds(date |> Internal.makeDate, (date |> getSeconds) +. (seconds |> float_of_int)) |> fromFloat);

let subSeconds = (seconds, date) => date |> addSeconds(- seconds);

let differenceInSeconds = Internal.differenceIn(Seconds);

let startOfSecond = date => Date.(setMilliseconds(date |> Internal.makeDate, 0.) |> fromFloat);

let endOfSecond = date => Date.(setMilliseconds(date |> Internal.makeDate, 999.) |> fromFloat);

let isSameSecond = (fst, snd) => fst |> startOfSecond |> isEqual(snd |> startOfSecond);

/* ——[Minute helpers]——————————— */

let addMinutes = (minutes, date) =>
  Date.(setMinutes(date |> Internal.makeDate, (date |> getMinutes) +. (minutes |> float_of_int)) |> fromFloat);

let subMinutes = (minutes, date) => date |> addMinutes(- minutes);

let differenceInMinutes = Internal.differenceIn(Minutes);

let startOfMinute = date =>
  Date.(setSecondsMs(date |> Internal.makeDate, ~seconds=0., ~milliseconds=0., ()) |> fromFloat);

let endOfMinute = date =>
  Date.(setSecondsMs(date |> Internal.makeDate, ~seconds=59., ~milliseconds=999., ()) |> fromFloat);

let isSameMinute = (fst, snd) => fst |> startOfMinute |> isEqual(snd |> startOfMinute);

let roundToNearestMinute = (~nearestTo=1, date) => {
  let closestTo = (date |> Date.getSeconds) /. 60. |> Math.round;
  let closestMinute = (date |> Date.getMinutes) +. closestTo;
  let nearestRoundedMinute =
    nearestTo !== 1 ?
      ((date |> Date.getMinutes) /. (nearestTo |> float_of_int) |> Math.round) *. (nearestTo |> float_of_int) :
      closestMinute;

  Date.(setMinutes(date |> Internal.makeDate, nearestRoundedMinute) |> fromFloat |> startOfMinute);
};

/* ——[Hour helpers]——————————— */

let addHours = (hours, date) =>
  Date.(setHours(date |> Internal.makeDate, (date |> getHours) +. (hours |> float_of_int)) |> fromFloat);

let subHours = (hours, date) => date |> addHours(- hours);

let differenceInHours = Internal.differenceIn(Hours);

let startOfHour = date =>
  Date.(setMinutesSMs(date |> Internal.makeDate, ~minutes=0., ~seconds=0., ~milliseconds=0., ()) |> fromFloat);

let endOfHour = date =>
  Date.(setMinutesSMs(date |> Internal.makeDate, ~minutes=59., ~seconds=59., ~milliseconds=999., ()) |> fromFloat);

let isSameHour = (fst, snd) => fst |> startOfHour |> isEqual(snd |> startOfHour);

/* ——[Day helpers]——————————— */

let addDays = Internal.addDays;

let subDays = (days, date) => date |> addDays(- days);

let startOfDay = Internal.makeDateWithStartOfDayHours;

let endOfDay = Internal.makeDateWithEndOfDayHours;

let differenceInCalendarDays = Internal.differenceIn(CalendarDays(startOfDay));

let differenceInDays = Internal.differenceIn(Days);

let getDayOfYear = date => date |> differenceInCalendarDays(date |> Internal.startOfYear) |> succ;

let isSameDay = (fst, snd) => fst |> startOfDay |> isEqual(snd |> startOfDay);

let isToday = date => date |> isSameDay(Date.make());

let isTomorrow = date => date |> isSameDay(Date.make() |> addDays(1));

let isYesterday = date => date |> isSameDay(Date.make() |> subDays(1));

/* ——[Week helpers]——————————— */

let addWeeks = (weeks, date) => date |> addDays(weeks * 7);

let subWeeks = (weeks, date) => date |> addWeeks(- weeks);

let differenceInWeeks = Internal.differenceIn(Weeks);

let startOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(Start(date) |> startOrEndOfWeek(weekStartsOn) |> makeDateWithStartOfDayHours);

let endOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date) |> startOrEndOfWeek(weekStartsOn) |> makeDateWithEndOfDayHours);

let differenceInCalendarWeeks = (~weekStartsOn=Sunday) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  Internal.differenceIn(CalendarWeeks(startOfWeek'));
};

let isSameWeek = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  fst |> startOfWeek' |> isEqual(snd |> startOfWeek');
};

let lastDayOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date) |> startOrEndOfWeek(weekStartsOn) |> makeDateWithStartOfDayHours);

let getWeekOfMonth = (~weekStartsOn=Sunday, date) => {
  let startWeekDay = date |> Internal.startOfMonth |> Date.getDay;
  let weekStartsOn' = weekStartsOn |> Internal.dayToJs |> float_of_int;
  let diff = startWeekDay < weekStartsOn' ? 7. -. weekStartsOn' +. startWeekDay : startWeekDay -. weekStartsOn';

  ((date |> Date.getDate) +. diff) /. 7. |> Math.ceil_int;
};

let getWeeksInMonth = (~weekStartsOn=Sunday, date) => {
  let differenceInCalendarWeeks' = differenceInCalendarWeeks(~weekStartsOn);
  Internal.(date |> lastDayOfMonth |> differenceInCalendarWeeks'(date |> startOfMonth) |> succ);
};

/* ——[Weekday helpers]——————————— */

let isSunday = Internal.is(Sunday);

let isMonday = Internal.is(Monday);

let isTuesday = Internal.is(Tuesday);

let isWednesday = Internal.is(Wednesday);

let isThursday = Internal.is(Thursday);

let isFriday = Internal.is(Friday);

let isSaturday = Internal.is(Saturday);

let isWeekend = date => date |> isSaturday || date |> isSunday;

/* ——[Month helpers]——————————— */

let getDaysInMonth = Internal.getDaysInMonth;

let addMonths = Internal.addMonths;

let subMonths = (months, date) => date |> addMonths(- months);

let differenceInCalendarMonths = Internal.differenceIn(CalendarMonths);

let differenceInMonths = Internal.differenceIn(Months);

let startOfMonth = Internal.startOfMonth;

let endOfMonth = date => Internal.(date |> makeLastDayOfMonth |> makeDateWithEndOfDayHours);

let isFirstDayOfMonth = date => date |> Date.getDate |> int_of_float === 1;

let isLastDayOfMonth = date => Date.(date |> endOfDay |> getTime === (date |> endOfMonth |> getTime));

let isSameMonth = (fst, snd) => fst |> startOfMonth |> isEqual(snd |> startOfMonth);

let lastDayOfMonth = Internal.lastDayOfMonth;

/* ——[Year helpers]——————————— */

let addYears = (years, date) => date |> addMonths(12 * years);

let subYears = (years, date) => date |> addYears(- years);

let startOfYear = Internal.startOfYear;

let isSameYear = (fst, snd) => fst |> startOfYear |> isEqual(snd |> startOfYear);

let isLeapYear = date => date |> Date.getFullYear |> int_of_float |> Internal.isLeap;

let endOfYear = date =>
  Date.(makeWithYMD(~year=date |> getFullYear, ~month=11., ~date=31., ())) |> Internal.makeDateWithEndOfDayHours;

let lastMonthOfYear = date =>
  Date.(makeWithYMD(~year=date |> getFullYear, ~month=11., ~date=1., ())) |> Internal.makeDateWithStartOfDayHours;

let lastDayOfYear = date => date |> lastMonthOfYear |> lastDayOfMonth;

let getDaysInYear = date => date |> isLeapYear ? 366 : 365;

let differenceInCalendarYears = Internal.differenceIn(CalendarYears);

let differenceInYears = Internal.differenceIn(Years);

/* ——[Interval helpers]——————————— */

let isWithinInterval = (~start, ~end_, date) => {
  let ts = date |> Date.getTime;
  ts >= (start |> Date.getTime) && ts <= (end_ |> Date.getTime);
};

let areIntervalsOverlapping = (left, right) =>
  Date.(left.start |> getTime < (right.end_ |> getTime) && right.start |> getTime < (left.end_ |> getTime));

let getOverlappingDaysInIntervals = (left, right) =>
  Date.(
    switch (left.start |> getTime, left.end_ |> getTime, right.start |> getTime, right.end_ |> getTime) {
    | (lst, let', rst, ret) when lst < ret && rst < let' =>
      let overlapStartTime = rst < lst ? lst : rst;
      let overlapEndTime = ret > let' ? let' : ret;
      let overlap = (overlapEndTime -. overlapStartTime) /. (Milliseconds.day |> float_of_int);

      overlap |> Math.ceil_int;
    | _ => 0
    }
  );

let eachDayOfIntervalArray = interval =>
  Internal.(Belt.Array.makeBy(interval |> getAmountOfIntervalDays, interval |> makeIntervalDay));

let eachDayOfIntervalList = interval =>
  Internal.(Belt.List.makeBy(interval |> getAmountOfIntervalDays, interval |> makeIntervalDay));
