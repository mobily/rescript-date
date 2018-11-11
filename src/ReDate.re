open Js.Date;

open ReDate__Internal;

type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
};

let isEqual = (fst, snd) => fst->getTime === snd->getTime;

let isAfter = (fst, snd) => fst->getTime > snd->getTime;

let isBefore = (fst, snd) => fst->getTime < snd->getTime;

let isFuture = date => date->isAfter(make());

let isPast = date => date->isBefore(make());

let compareAsc = ((-1), 1)->ascDescComparator;

let compareDesc = (1, (-1))->ascDescComparator;

let minOfArray = dates => dates->Belt.Array.reduce(None, (<)->minMaxReducer)->retrieveMinMax;

let minOfList = dates => dates->Belt.List.reduce(None, (<)->minMaxReducer)->retrieveMinMax;

let maxOfArray = dates => dates->Belt.Array.reduce(None, (>)->minMaxReducer)->retrieveMinMax;

let maxOfList = dates => dates->Belt.List.reduce(None, (>)->minMaxReducer)->retrieveMinMax;

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
    let overlap = (overlapEndTime -. overlapStartTime) /. dayMs->float_of_int;

    overlap->Js.Math.ceil_int;
  | _ => 0
  };

let getDaysInMonth = date =>
  makeYMDWithResetHMS(~year=date->getFullYear, ~month=date->getMonth +. 1., ~date=0., ())->getDate->int_of_float;

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

let diffInCalendarDays = (fst, snd) => {
  let fstTime = fst->startOfDay->getTime -. fst->getTimezoneOffsetInMilliseconds;
  let sndTime = snd->startOfDay->getTime -. snd->getTimezoneOffsetInMilliseconds;
  let diff = (fstTime -. sndTime) /. dayMs->float_of_int;

  diff->Js.Math.round->int_of_float;
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
