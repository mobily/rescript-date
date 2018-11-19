open Js;

type interval = {
  start: Date.t,
  end_: Date.t,
};

type offset =
  | Start(Date.t)
  | End(Date.t);

[@bs.deriving jsConverter]
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
  let makeDate = date => Date.(date->getTime->fromFloat);

  /* based on: https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js */
  let getTimezoneOffsetInMilliseconds = date =>
    date->Date.getTimezoneOffset
    *. Milliseconds.minute->float_of_int
    +. (date->makeDate->Date.setSecondsMs(~seconds=0., ~milliseconds=0., ())->int_of_float mod Milliseconds.minute)
       ->float_of_int;

  let makeDateWithStartOfDayHours = date =>
    Date.(date->makeDate->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())->fromFloat);

  let makeDateWithEndOfDayHours = date =>
    Date.(date->makeDate->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())->fromFloat);

  let makeLastDayOfMonth = date =>
    Date.(makeWithYMD(~year=date->getFullYear, ~month=date->getMonth +. 1., ~date=0., ()));

  let startOfYear = date =>
    Date.(makeWithYMD(~year=date->getFullYear, ~month=0., ~date=1., ())->makeDateWithStartOfDayHours);

  let getDaysInMonth = date => date->makeLastDayOfMonth->Date.getDate->int_of_float;

  let addDays = (date, days) => Date.(date->makeDate->setDate(date->getDate +. days->float_of_int)->fromFloat);

  let addMonths = (date, months) =>
    Date.(
      makeWithYMD(
        ~year=date->getFullYear,
        ~month=date->getMonth +. months->float_of_int,
        ~date=Math.min_float(date->getDaysInMonth->float_of_int, date->getDate),
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

  let rec differenceIn = (differenceType, fst, snd) =>
    Date.(
      switch (differenceType) {
      | Seconds
      | Minutes
      | Hours
      | Days
      | Weeks =>
        let diff = (fst->getTime -. snd->getTime) /. differenceType->getMillisecondsOf->float_of_int;
        diff > 0. ? diff->Math.floor_int : diff->Math.ceil_int;
      | Months =>
        let diff = (fst->getMonth -. snd->getMonth +. 12. *. (fst->getFullYear -. snd->getFullYear))->int_of_float;
        let anchor = snd->addMonths(diff);
        let anchorTime = anchor->getTime;
        let fstTime = fst->getTime;
        let adjust =
          if (fstTime -. anchorTime < 0.) {
            (fstTime -. anchorTime) /. (anchorTime -. snd->addMonths(diff->pred)->getTime);
          } else {
            (fstTime -. anchorTime) /. (snd->addMonths(diff->succ)->getTime -. anchorTime);
          };

        adjust->Math.round->int_of_float + diff;
      | Years => differenceIn(Months, fst, snd) / 12
      | CalendarDays(startOf)
      | CalendarWeeks(startOf) =>
        let fst = fst->startOf;
        let snd = snd->startOf;
        let fstTime = fst->Date.getTime -. fst->getTimezoneOffsetInMilliseconds;
        let sndTime = snd->Date.getTime -. snd->getTimezoneOffsetInMilliseconds;
        let diff = (fstTime -. sndTime) /. differenceType->getMillisecondsOf->float_of_int;
        diff->Math.round->int_of_float;
      | CalendarMonths =>
        ((fst->getFullYear -. snd->getFullYear) *. 12. +. (fst->getMonth -. snd->getMonth))->int_of_float
      | CalendarYears => (fst->getFullYear -. snd->getFullYear)->int_of_float
      }
    );

  let retrieveMinOrMax = value => value->Belt.Option.getExn->Date.fromFloat;

  let compareAscOrDesc = (~x, ~y, firstDate, secondDate) =>
    switch (firstDate->Date.getTime -. secondDate->Date.getTime) {
    | ts when ts < 0. => x
    | ts when ts > 0. => y
    | _ => 0
    };

  let reduceMinOrMax = (fn, acc, date) =>
    switch (date->Date.getTime) {
    | ts when acc === None || fn(ts, acc->Belt.Option.getExn) => Some(ts)
    | _ => acc
    };

  let startOrEndOfWeek = (type_, weekStartsOn) => {
    open Date;

    let week = weekStartsOn->dayToJs->float_of_int;

    let date =
      switch (type_) {
      | Start(date) =>
        let day = date->getDay;
        let diff = (day < week ? 7. : 0.) +. day -. week;
        date->makeDate->setDate(date->getDate -. diff);
      | End(date) =>
        let day = date->getDay;
        let diff = (day < week ? (-7.) : 0.) +. 6. -. (day -. week);
        date->makeDate->setDate(date->getDate +. diff);
      };

    date->fromFloat;
  };

  let isLeap = year => year mod 400 === 0 || year mod 4 === 0 && year mod 100 !== 0;

  let makeIntervalDay = (interval, index) => interval.start->makeDateWithStartOfDayHours->addDays(index);

  let getAmountOfIntervalDays = interval =>
    differenceIn(CalendarDays(makeDateWithStartOfDayHours), interval.end_, interval.start)->succ;
};

/* ——[Common helpers]——————————— */

let isEqual = (fst, snd) => Date.(fst->getTime === snd->getTime);

let isAfter = (fst, snd) => Date.(fst->getTime > snd->getTime);

let isBefore = (fst, snd) => Date.(fst->getTime < snd->getTime);

let isFuture = date => date->isAfter(Date.make());

let isPast = date => date->isBefore(Date.make());

let compareAsc = Internal.compareAscOrDesc(~x=-1, ~y=1);

let compareDesc = Internal.compareAscOrDesc(~x=1, ~y=-1);

let minOfArray = dates => Internal.(dates->Belt.Array.reduce(None, (<)->reduceMinOrMax)->retrieveMinOrMax);

let minOfList = dates => Internal.(dates->Belt.List.reduce(None, (<)->reduceMinOrMax)->retrieveMinOrMax);

let maxOfArray = dates => Internal.(dates->Belt.Array.reduce(None, (>)->reduceMinOrMax)->retrieveMinOrMax);

let maxOfList = dates => Internal.(dates->Belt.List.reduce(None, (>)->reduceMinOrMax)->retrieveMinOrMax);

let isValid = (~year, ~month, ~date, ~hours=0., ~minutes=0., ~seconds=0., ()) =>
  switch (year, month, date, hours, minutes, seconds) {
  | (year, _, _, _, _, _) when year > 199999. || year < (-199999.) => None
  | (_, month, _, _, _, _) when month > 11. || month < 0. => None
  | (_, _, date, _, _, _) when date < 1. => None
  | (_, _, _, hours, minutes, seconds)
      when hours < 0. || hours > 23. || minutes < 0. || minutes > 59. || seconds < 0. || seconds > 59. =>
    None
  | (year, month, date, _, _, _)
      when Date.makeWithYM(~year, ~month, ())->Internal.makeLastDayOfMonth->Date.getDate < date =>
    None
  | (year, month, date, hours, minutes, seconds) =>
    Some(Date.makeWithYMDHMS(~year, ~month, ~date, ~hours, ~minutes, ~seconds, ()))
  };

/* ——[Second helpers]——————————— */

let addSeconds = (date, seconds) =>
  Date.(date->Internal.makeDate->setSeconds(date->getSeconds +. seconds->float_of_int)->fromFloat);

let subSeconds = (date, seconds) => date->addSeconds(- seconds);

let differenceInSeconds = Internal.differenceIn(Seconds);

let startOfSecond = date => Date.(date->Internal.makeDate->setMilliseconds(0.)->fromFloat);

let endOfSecond = date => Date.(date->Internal.makeDate->setMilliseconds(999.)->fromFloat);

let isSameSecond = (fst, snd) => fst->startOfSecond->isEqual(snd->startOfSecond);

/* ——[Minute helpers]——————————— */

let addMinutes = (date, minutes) =>
  Date.(date->Internal.makeDate->setMinutes(date->getMinutes +. minutes->float_of_int)->fromFloat);

let subMinutes = (date, minutes) => date->addMinutes(- minutes);

let differenceInMinutes = Internal.differenceIn(Minutes);

let startOfMinute = date =>
  Date.(date->Internal.makeDate->setSecondsMs(~seconds=0., ~milliseconds=0., ())->fromFloat);

let endOfMinute = date =>
  Date.(date->Internal.makeDate->setSecondsMs(~seconds=59., ~milliseconds=999., ())->fromFloat);

let isSameMinute = (fst, snd) => fst->startOfMinute->isEqual(snd->startOfMinute);

let roundToNearestMinute = (~nearestTo=1, date) => {
  let closestTo = Math.round(date->Date.getSeconds /. 60.);
  let closestMinute = Date.(date->getMinutes +. closestTo);
  let nearestRoundedMinute =
    nearestTo !== 1 ?
      (date->Date.getMinutes /. nearestTo->float_of_int)->Math.round *. nearestTo->float_of_int : closestMinute;

  Date.(date->Internal.makeDate->setMinutes(nearestRoundedMinute)->fromFloat->startOfMinute);
};

/* ——[Hour helpers]——————————— */

let addHours = (date, hours) =>
  Date.(date->Internal.makeDate->setHours(date->getHours +. hours->float_of_int)->fromFloat);

let subHours = (date, hours) => date->addHours(- hours);

let differenceInHours = Internal.differenceIn(Hours);

let startOfHour = date =>
  Date.(date->Internal.makeDate->setMinutesSMs(~minutes=0., ~seconds=0., ~milliseconds=0., ())->fromFloat);

let endOfHour = date =>
  Date.(date->Internal.makeDate->setMinutesSMs(~minutes=59., ~seconds=59., ~milliseconds=999., ())->fromFloat);

let isSameHour = (fst, snd) => fst->startOfHour->isEqual(snd->startOfHour);

/* ——[Day helpers]——————————— */

let addDays = Internal.addDays;

let subDays = (date, days) => date->addDays(- days);

let startOfDay = Internal.makeDateWithStartOfDayHours;

let endOfDay = Internal.makeDateWithEndOfDayHours;

let differenceInCalendarDays = Internal.differenceIn(CalendarDays(startOfDay));

let differenceInDays = Internal.differenceIn(Days);

let getDayOfYear = date => date->differenceInCalendarDays(date->Internal.startOfYear)->succ;

let isSameDay = (fst, snd) => fst->startOfDay->isEqual(snd->startOfDay);

let isToday = date => date->isSameDay(Date.make());

let isTomorrow = date => date->isSameDay(Date.make()->addDays(1));

let isYesterday = date => date->isSameDay(Date.make()->subDays(1));

/* ——[Week helpers]——————————— */

let addWeeks = (date, weeks) => date->addDays(weeks * 7);

let subWeeks = (date, weeks) => date->addWeeks(- weeks);

let differenceInWeeks = Internal.differenceIn(Weeks);

let startOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(Start(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithStartOfDayHours);

let endOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithEndOfDayHours);

let differenceInCalendarWeeks = (~weekStartsOn=Sunday) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  Internal.differenceIn(CalendarWeeks(startOfWeek'));
};

let isSameWeek = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  fst->startOfWeek'->isEqual(snd->startOfWeek');
};

let lastDayOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithStartOfDayHours);

/* ——[Weekday helpers]——————————— */

let is = (date, day) => date->Date.getDay === day->dayToJs->float_of_int;

let isSunday = is(_, Sunday);

let isMonday = is(_, Monday);

let isTuesday = is(_, Tuesday);

let isWednesday = is(_, Wednesday);

let isThursday = is(_, Thursday);

let isFriday = is(_, Friday);

let isSaturday = is(_, Saturday);

let isWeekend = date => date->isSaturday || date->isSunday;

/* ——[Month helpers]——————————— */

let getDaysInMonth = Internal.getDaysInMonth;

let addMonths = Internal.addMonths;

let subMonths = (date, months) => date->addMonths(- months);

let differenceInCalendarMonths = Internal.differenceIn(CalendarMonths);

let differenceInMonths = Internal.differenceIn(Months);

let startOfMonth = date =>
  Date.(date->Internal.makeDate->setDate(1.)->fromFloat->Internal.makeDateWithStartOfDayHours);

let endOfMonth = date => Internal.(date->makeLastDayOfMonth->makeDateWithEndOfDayHours);

let isFirstDayOfMonth = date => date->Date.getDate->int_of_float === 1;

let isLastDayOfMonth = date => Date.(date->endOfDay->getTime === date->endOfMonth->getTime);

let isSameMonth = (fst, snd) => fst->startOfMonth->isEqual(snd->startOfMonth);

let lastDayOfMonth = date => Internal.(date->makeLastDayOfMonth->makeDateWithStartOfDayHours);

let getWeekOfMonth = (~weekStartsOn=Sunday, date) => {
  let startWeekDay = date->startOfMonth->Date.getDay;
  let weekStartsOn' = weekStartsOn->dayToJs->float_of_int;
  let diff = startWeekDay < weekStartsOn' ? 7. -. weekStartsOn' +. startWeekDay : startWeekDay -. weekStartsOn';

  ((date->Date.getDate +. diff) /. 7.)->Math.ceil_int;
};

let getWeeksInMonth = (~weekStartsOn=Sunday, date) => {
  let differenceInCalendarWeeks' = differenceInCalendarWeeks(~weekStartsOn);
  date->lastDayOfMonth->differenceInCalendarWeeks'(date->startOfMonth)->succ;
};

/* ——[Year helpers]——————————— */

let addYears = (date, years) => date->addMonths(12 * years);

let subYears = (date, years) => date->addYears(- years);

let startOfYear = Internal.startOfYear;

let isSameYear = (fst, snd) => fst->startOfYear->isEqual(snd->startOfYear);

let isLeapYear = date => date->Date.getFullYear->int_of_float->Internal.isLeap;

let endOfYear = date =>
  Date.(makeWithYMD(~year=date->getFullYear, ~month=11., ~date=31., ()))->Internal.makeDateWithEndOfDayHours;

let lastMonthOfYear = date =>
  Date.(makeWithYMD(~year=date->getFullYear, ~month=11., ~date=1., ()))->Internal.makeDateWithStartOfDayHours;

let lastDayOfYear = date => date->lastMonthOfYear->lastDayOfMonth;

let getDaysInYear = date => date->isLeapYear ? 366 : 365;

let differenceInCalendarYears = Internal.differenceIn(CalendarYears);

let differenceInYears = Internal.differenceIn(Years);

/* ——[Interval helpers]——————————— */

let isWithinInterval = (date, ~start, ~end_) => {
  let ts = date->Date.getTime;
  ts >= start->Date.getTime && ts <= end_->Date.getTime;
};

let areIntervalsOverlapping = (left, right) =>
  Date.(left.start->getTime < right.end_->getTime && right.start->getTime < left.end_->getTime);

let getOverlappingDaysInIntervals = (left, right) =>
  Date.(
    switch (left.start->getTime, left.end_->getTime, right.start->getTime, right.end_->getTime) {
    | (lst, let', rst, ret) when lst < ret && rst < let' =>
      let overlapStartTime = rst < lst ? lst : rst;
      let overlapEndTime = ret > let' ? let' : ret;
      let overlap = (overlapEndTime -. overlapStartTime) /. Milliseconds.day->float_of_int;

      overlap->Math.ceil_int;
    | _ => 0
    }
  );

let eachDayOfIntervalArray = interval =>
  Internal.(interval->getAmountOfIntervalDays->Belt.Array.makeBy(interval->makeIntervalDay));

let eachDayOfIntervalList = interval =>
  Internal.(interval->getAmountOfIntervalDays->Belt.List.makeBy(interval->makeIntervalDay));
