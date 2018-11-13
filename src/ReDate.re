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

module Constants = {
  let minuteMilliseconds = 60 * 1000;

  let dayMilliseconds = 24 * 60 * minuteMilliseconds;

  let weekMilliseconds = 7 * dayMilliseconds;
};

module Internal = {
  /* based on: https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js */
  let getTimezoneOffsetInMilliseconds = date =>
    date->Date.getTimezoneOffset
    *. Constants.minuteMilliseconds->float_of_int
    +. (date->Date.setSecondsMs(~seconds=0., ~milliseconds=0., ())->int_of_float mod Constants.minuteMilliseconds)
       ->float_of_int;

  let makeDateWithStartOfDayHours = date =>
    Date.(date->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())->fromFloat);

  let makeDateWithEndOfDayHours = date =>
    Date.(date->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())->fromFloat);

  let makeDiff = (ms, fst, snd) => {
    let fstTime = fst->Date.getTime -. fst->getTimezoneOffsetInMilliseconds;
    let sndTime = snd->Date.getTime -. snd->getTimezoneOffsetInMilliseconds;
    (fstTime -. sndTime) /. ms->float_of_int;
  };

  let startOfYear = date =>
    Date.(makeWithYMD(~year=date->getFullYear, ~month=0., ~date=1., ())->makeDateWithStartOfDayHours);

  let endOfYear = date =>
    Date.(makeWithYMD(~year=date->getFullYear +. 1., ~month=0., ~date=0., ())->makeDateWithEndOfDayHours);

  let diffInDays = makeDiff(Constants.dayMilliseconds);

  let diffInCalendarWeeks = makeDiff(Constants.weekMilliseconds);

  let retrieveMinOrMax = value => value->Belt.Option.getExn->Date.fromFloat;

  let compareAscOrDesc = (tuple, firstDate, secondDate) => {
    let (x, y) = tuple;
    switch (firstDate->Date.getTime -. secondDate->Date.getTime) {
    | ts when ts < 0. => x
    | ts when ts > 0. => y
    | _ => 0
    };
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
        date->setDate(date->getDate -. diff);
      | End(date) =>
        let day = date->getDay;
        let diff = (day < week ? (-7.) : 0.) +. 6. -. (day -. week);
        date->setDate(date->getDate +. diff);
      };

    date->fromFloat;
  };

  let makeLastDayOfMonth = date =>
    Date.(makeWithYMD(~year=date->getFullYear, ~month=date->getMonth +. 1., ~date=0., ()));
};

/* ——[Common]——————————— */

let isEqual = (fst, snd) => Date.(fst->getTime === snd->getTime);

let isAfter = (fst, snd) => Date.(fst->getTime > snd->getTime);

let isBefore = (fst, snd) => Date.(fst->getTime < snd->getTime);

let isFuture = date => date->isAfter(Date.make());

let isPast = date => date->isBefore(Date.make());

let isLeap = year => year mod 400 === 0 || year mod 4 === 0 && year mod 100 !== 0;

let compareAsc = ((-1), 1)->Internal.compareAscOrDesc;

let compareDesc = (1, (-1))->Internal.compareAscOrDesc;

let minOfArray = dates => Internal.(dates->Belt.Array.reduce(None, (<)->reduceMinOrMax)->retrieveMinOrMax);

let minOfList = dates => Internal.(dates->Belt.List.reduce(None, (<)->reduceMinOrMax)->retrieveMinOrMax);

let maxOfArray = dates => Internal.(dates->Belt.Array.reduce(None, (>)->reduceMinOrMax)->retrieveMinOrMax);

let maxOfList = dates => Internal.(dates->Belt.List.reduce(None, (>)->reduceMinOrMax)->retrieveMinOrMax);

/* ——[Interval]——————————— */

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
      let overlap = (overlapEndTime -. overlapStartTime) /. Constants.dayMilliseconds->float_of_int;

      overlap->Math.ceil_int;
    | _ => 0
    }
  );

/* ——[Day]——————————— */

let getDaysInMonth = date => date->Internal.makeLastDayOfMonth->Date.getDate->int_of_float;

let addDays = (date, days) => Date.(date->setDate(date->getDate +. days->float_of_int)->fromFloat);

let subDays = (date, days) => date->addDays(- days);

let startOfDay = Internal.makeDateWithStartOfDayHours;

let endOfDay = Internal.makeDateWithEndOfDayHours;

let diffInCalendarDays = (fst, snd) => {
  let diff = fst->startOfDay->Internal.diffInDays(snd->startOfDay);

  diff->Math.round->int_of_float;
};

let diffInDays = (fst, snd) => {
  let diff = Internal.diffInDays(fst, snd);

  switch (diff) {
  | x when x > 0. => x->Math.floor_int
  | x when x < 0. => x->Math.ceil_int
  | _ => 0
  };
};

let internal_makeIntervalDay = (interval, index) => interval.start->startOfDay->addDays(index);

let internal_getAmountOfIntervalDays = interval => interval.end_->diffInCalendarDays(interval.start)->succ;

let eachDayOfIntervalArray = interval =>
  interval->internal_getAmountOfIntervalDays->Belt.Array.makeBy(interval->internal_makeIntervalDay);

let eachDayOfIntervalList = interval =>
  interval->internal_getAmountOfIntervalDays->Belt.List.makeBy(interval->internal_makeIntervalDay);

let getDayOfYear = date => date->diffInCalendarDays(date->Internal.startOfYear)->succ;

let isSameDay = (fst, snd) => fst->startOfDay->isEqual(snd->startOfDay);

let isToday = date => date->isSameDay(Date.make());

let isTomorrow = date => date->isSameDay(Date.make()->addDays(1));

let isYesterday = date => date->isSameDay(Date.make()->subDays(1));

/* ——[Week]——————————— */

let addWeeks = (date, weeks) => date->addDays(weeks * 7);

let subWeeks = (date, weeks) => date->addWeeks(- weeks);

let diffInWeeks = (fst, snd) => {
  let diff = (fst->diffInDays(snd) / 7)->float_of_int;
  diff > 0. ? diff->Math.floor_int : diff->Math.ceil_int;
};

let startOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(Start(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithStartOfDayHours);

let endOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithEndOfDayHours);

let diffInCalendarWeeks = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  let diff = fst->startOfWeek'->Internal.diffInCalendarWeeks(snd->startOfWeek');

  diff->Math.round->int_of_float;
};

let isSameWeek = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  fst->startOfWeek'->isEqual(snd->startOfWeek');
};

let lastDayOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(End(date)->startOrEndOfWeek(weekStartsOn)->makeDateWithStartOfDayHours);

/* ——[Weekday]——————————— */

let is = (date, day) => date->Date.getDay === day->dayToJs->float_of_int;

let isSunday = is(_, Sunday);

let isMonday = is(_, Monday);

let isTuesday = is(_, Tuesday);

let isWednesday = is(_, Wednesday);

let isThursday = is(_, Thursday);

let isFriday = is(_, Friday);

let isSaturday = is(_, Saturday);

let isWeekend = date => date->isSaturday || date->isSunday;

/* ——[Month]——————————— */

let addMonths = (date, months) =>
  Date.(
    makeWithYMD(
      ~year=date->getFullYear,
      ~month=date->getMonth +. months->float_of_int,
      ~date=Math.min_float(date->getDaysInMonth->float_of_int, date->getDate),
      (),
    )
  );

let subMonths = (date, months) => date->addMonths(- months);

let diffInCalendarMonths = (fst, snd) =>
  Date.((fst->getFullYear -. snd->getFullYear) *. 12. +. (fst->getMonth -. snd->getMonth))->int_of_float;

let startOfMonth = date => Date.(date->setDate(1.)->fromFloat->Internal.makeDateWithStartOfDayHours);

let endOfMonth = date => Internal.(date->makeLastDayOfMonth->makeDateWithEndOfDayHours);

let isFirstDayOfMonth = date => date->Date.getDate->int_of_float === 1;

let isLastDayOfMonth = date => Date.(date->endOfDay->getTime === date->endOfMonth->getTime);

let isSameMonth = (fst, snd) => fst->startOfMonth->isEqual(snd->startOfMonth);

let lastDayOfMonth = date => Internal.(date->makeLastDayOfMonth->makeDateWithStartOfDayHours);

/* ——[Year]——————————— */

let addYears = (date, years) => date->addMonths(12 * years);

let subYears = (date, years) => date->addYears(- years);

let startOfYear = Internal.startOfYear;

let isSameYear = (fst, snd) => fst->Internal.startOfYear->isEqual(snd->Internal.startOfYear);

let isLeapYear = date => Date.(date->getFullYear->int_of_float->isLeap);

let endOfYear = Internal.endOfYear;
