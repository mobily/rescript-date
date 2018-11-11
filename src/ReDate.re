open Js.Date;

type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
};

type time =
  | Start(Js.Date.t)
  | End(Js.Date.t);

module Constants = {
  let minuteMilliseconds = 60 * 1000;

  let dayMilliseconds = 24 * 60 * minuteMilliseconds;

  let weekMilliseconds = 7 * dayMilliseconds;
};

/* based on: https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js */
let internal_getTimezoneOffsetInMilliseconds = date =>
  date->getTimezoneOffset
  *. Constants.minuteMilliseconds->float_of_int
  +. (date->setSecondsMs(~seconds=0., ~milliseconds=0., ())->int_of_float mod Constants.minuteMilliseconds)
     ->float_of_int;

let isEqual = (fst, snd) => fst->getTime === snd->getTime;

let isAfter = (fst, snd) => fst->getTime > snd->getTime;

let isBefore = (fst, snd) => fst->getTime < snd->getTime;

let isFuture = date => date->isAfter(make());

let isPast = date => date->isBefore(make());

let internal_compareAscOrDesc = (tuple, firstDate, secondDate) => {
  let (x, y) = tuple;
  switch (firstDate->getTime -. secondDate->getTime) {
  | ts when ts < 0. => x
  | ts when ts > 0. => y
  | _ => 0
  };
};

let compareAsc = ((-1), 1)->internal_compareAscOrDesc;

let compareDesc = (1, (-1))->internal_compareAscOrDesc;

let internal_reduceMinOrMax = (fn, acc, date) =>
  switch (date->getTime) {
  | ts when acc === None || fn(ts, acc->Belt.Option.getExn) => Some(ts)
  | _ => acc
  };

let internal_retrieveMinOrMax = value => value->Belt.Option.getExn->fromFloat;

let minOfArray = dates => dates->Belt.Array.reduce(None, (<)->internal_reduceMinOrMax)->internal_retrieveMinOrMax;

let minOfList = dates => dates->Belt.List.reduce(None, (<)->internal_reduceMinOrMax)->internal_retrieveMinOrMax;

let maxOfArray = dates => dates->Belt.Array.reduce(None, (>)->internal_reduceMinOrMax)->internal_retrieveMinOrMax;

let maxOfList = dates => dates->Belt.List.reduce(None, (>)->internal_reduceMinOrMax)->internal_retrieveMinOrMax;

let isWithinInterval = (date, ~start, ~end_) => {
  let ts = date->getTime;
  ts >= start->getTime && ts <= end_->getTime;
};

let areIntervalsOverlapping = (left, right) =>
  left.start->getTime < right.end_->getTime && right.start->getTime < left.end_->getTime;

let getOverlappingDaysInIntervals = (left, right) =>
  switch (left.start->getTime, left.end_->getTime, right.start->getTime, right.end_->getTime) {
  | (lst, let', rst, ret) when lst < ret && rst < let' =>
    let overlapStartTime = rst < lst ? lst : rst;
    let overlapEndTime = ret > let' ? let' : ret;
    let overlap = (overlapEndTime -. overlapStartTime) /. Constants.dayMilliseconds->float_of_int;

    overlap->Js.Math.ceil_int;
  | _ => 0
  };

let getDaysInMonth = date =>
  makeWithYMDHMS(
    ~year=date->getFullYear,
    ~month=date->getMonth +. 1.,
    ~date=0.,
    ~hours=0.,
    ~minutes=0.,
    ~seconds=0.,
    (),
  )
  ->getDate
  ->int_of_float;

let addDays = (date, days) => date->setDate(date->getDate +. days->float_of_int)->fromFloat;

let subDays = (date, days) => date->addDays(- days);

let addWeeks = (date, weeks) => date->addDays(weeks * 7);

let subWeeks = (date, weeks) => date->addWeeks(- weeks);

let addMonths = (date, months) =>
  makeWithYMD(
    ~year=date->getFullYear,
    ~month=date->getMonth +. months->float_of_int,
    ~date=Js.Math.min_float(date->getDaysInMonth->float_of_int, date->getDate),
    (),
  );

let subMonths = (date, months) => date->addMonths(- months);

let addYears = (date, years) => date->addMonths(12 * years);

let subYears = (date, years) => date->addYears(- years);

let startOfDay = date => date->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())->fromFloat;

let endOfDay = date => date->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())->fromFloat;

let internal_makeDiff = (ms, fst, snd) => {
  let fstTime = fst->getTime -. fst->internal_getTimezoneOffsetInMilliseconds;
  let sndTime = snd->getTime -. snd->internal_getTimezoneOffsetInMilliseconds;
  (fstTime -. sndTime) /. ms->float_of_int;
};

let internal_diffInDays = internal_makeDiff(Constants.dayMilliseconds);

let diffInCalendarDays = (fst, snd) => {
  let diff = internal_diffInDays(fst->startOfDay, snd->startOfDay);

  diff->Js.Math.round->int_of_float;
};

let diffInDays = (fst, snd) => {
  let diff = internal_diffInDays(fst, snd);

  switch (diff) {
  | x when x > 0. => x->Js.Math.floor_int
  | x when x < 0. => x->Js.Math.ceil_int
  | _ => 0
  };
};

let internal_getAmountOfIntervalDays = interval => diffInCalendarDays(interval.end_, interval.start)->succ;

let internal_makeEachDay = (interval, index) => interval.start->startOfDay->addDays(index);

let eachDayOfIntervalArray = interval => {
  let amount = interval->internal_getAmountOfIntervalDays;
  Belt.Array.makeBy(amount, interval->internal_makeEachDay);
};

let eachDayOfIntervalList = interval => {
  let amount = interval->internal_getAmountOfIntervalDays;
  Belt.List.makeBy(amount, interval->internal_makeEachDay);
};

let startOfYear = date =>
  makeWithYMD(~year=date->getFullYear, ~month=0., ~date=1., ())
  ->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())
  ->fromFloat;

let getDayOfYear = date => date->diffInCalendarDays(date->startOfYear)->succ;

let isSameDay = (fst, snd) => isEqual(fst->startOfDay, snd->startOfDay);

let isToday = date => date->isSameDay(make());

let isTomorrow = date => date->isSameDay(make()->addDays(1));

let isYesterday = date => date->isSameDay(make()->subDays(1));

let diffInWeeks = (fst, snd) => {
  let diff = (fst->diffInDays(snd) / 7)->float_of_int;
  diff > 0. ? diff->Js.Math.floor_int : diff->Js.Math.ceil_int;
};

let internal_startOrEndOfWeek = (type_, weekStartsOn) => {
  let week = weekStartsOn->float_of_int;

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

let startOfWeek = (~weekStartsOn=0, date) =>
  Start(date)
  ->internal_startOrEndOfWeek(weekStartsOn)
  ->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())
  ->fromFloat;

let endOfWeek = (~weekStartsOn=0, date) =>
  End(date)
  ->internal_startOrEndOfWeek(weekStartsOn)
  ->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())
  ->fromFloat;

let internal_diffInCalendarWeeks = internal_makeDiff(Constants.weekMilliseconds);

let diffInCalendarWeeks = (~weekStartsOn=0, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  let diff = internal_diffInCalendarWeeks(fst->startOfWeek', snd->startOfWeek');

  diff->Js.Math.round->int_of_float;
};
