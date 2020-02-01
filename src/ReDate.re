type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
};

type offset =
  | Start(Js.Date.t)
  | End(Js.Date.t);

type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday;

type helper = Js.Date.t => Js.Date.t;

type differenceIn =
  | Seconds
  | Hours
  | Minutes
  | Days
  | BusinessDays(helper)
  | CalendarDays(helper)
  | Weeks
  | CalendarWeeks(helper)
  | Months
  | CalendarMonths
  | Years
  | CalendarYears;

type closestTo = {
  distance: option(float),
  date: option(Js.Date.t),
};

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

  let makeDate = date => Js.Date.(date |> getTime |> fromFloat);

  /* https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js
   */
  let getTimezoneOffsetInMilliseconds = date =>
    Js.Date.(
      (date |> getTimezoneOffset)
      *. (Milliseconds.minute |> float_of_int)
      +. setSecondsMs(date |> makeDate, ~seconds=0., ~milliseconds=0., ())
      |> int_of_float
    )
    mod Milliseconds.minute
    |> float_of_int;

  let makeDateWithStartOfDayHours = date =>
    Js.Date.(
      setHoursMSMs(
        date |> makeDate,
        ~hours=0.,
        ~minutes=0.,
        ~seconds=0.,
        ~milliseconds=0.,
        (),
      )
      |> fromFloat
    );

  let makeDateWithEndOfDayHours = date =>
    Js.Date.(
      setHoursMSMs(
        date |> makeDate,
        ~hours=23.,
        ~minutes=59.,
        ~seconds=59.,
        ~milliseconds=999.,
        (),
      )
      |> fromFloat
    );

  let makeLastDayOfMonth = date =>
    Js.Date.(
      makeWithYMD(
        ~year=date |> getFullYear,
        ~month=(date |> getMonth) +. 1.,
        ~date=0.,
        (),
      )
    );

  let startOfYear = date =>
    Js.Date.(
      makeWithYMD(~year=date |> getFullYear, ~month=0., ~date=1., ())
      |> makeDateWithStartOfDayHours
    );

  let getDaysInMonth = date =>
    date |> makeLastDayOfMonth |> Js.Date.getDate |> int_of_float;

  let addDays = (days, date) =>
    Js.Date.(
      setDate(date |> makeDate, (date |> getDate) +. (days |> float_of_int))
      |> fromFloat
    );

  let addMonths = (months, date) =>
    Js.Date.(
      makeWithYMD(
        ~year=date |> getFullYear,
        ~month=(date |> getMonth) +. (months |> float_of_int),
        ~date=
          Js.Math.min_float(
            date |> getDaysInMonth |> float_of_int,
            date |> getDate,
          ),
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

  let is = (day, date) =>
    date |> Js.Date.getDay === (day |> dayToJs |> float_of_int);

  let isWeekend = date => date |> is(Saturday) || date |> is(Sunday);

  let rec differenceIn = (differenceType, snd, fst) =>
    Js.Date.(
      switch (differenceType) {
      | Seconds
      | Minutes
      | Hours
      | Days
      | Weeks =>
        let diff =
          ((fst |> getTime) -. (snd |> getTime))
          /. (differenceType |> getMillisecondsOf |> float_of_int);
        diff > 0. ? diff |> Js.Math.floor_int : diff |> Js.Math.ceil_int;
      | BusinessDays(startOf) =>
        let diff = differenceIn(CalendarDays(startOf), snd, fst);
        let date = diff < 0 ? fst : snd;
        let result = ref(0);

        for (index in 0 to diff |> Js.Math.abs_int |> pred) {
          let day = date |> addDays(index);
          result := isWeekend(day) ? result^ : result^ |> succ;
        };

        diff < 0 ? - result^ : result^;
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
            (fstTime -. anchorTime)
            /. (anchorTime -. (snd |> addMonths(diff |> pred) |> getTime));
          } else {
            (fstTime -. anchorTime)
            /. ((snd |> addMonths(diff |> succ) |> getTime) -. anchorTime);
          };

        (adjust |> Js.Math.round |> int_of_float) + diff;
      | Years => differenceIn(Months, snd, fst) / 12
      | CalendarDays(startOf)
      | CalendarWeeks(startOf) =>
        let fst = fst |> startOf;
        let snd = snd |> startOf;
        let fstTime =
          (fst |> Js.Date.getTime) -. (fst |> getTimezoneOffsetInMilliseconds);
        let sndTime =
          (snd |> Js.Date.getTime) -. (snd |> getTimezoneOffsetInMilliseconds);
        let diff =
          (fstTime -. sndTime)
          /. (differenceType |> getMillisecondsOf |> float_of_int);
        diff |> Js.Math.round |> int_of_float;
      | CalendarMonths =>
        ((fst |> getFullYear) -. (snd |> getFullYear))
        *. 12.
        +. ((fst |> getMonth) -. (snd |> getMonth))
        |> int_of_float
      | CalendarYears =>
        (fst |> getFullYear) -. (snd |> getFullYear) |> int_of_float
      }
    );

  let retrieveMinOrMax = value =>
    value |> Belt.Option.getExn |> Js.Date.fromFloat;

  let compareAscOrDesc = (~x, ~y, fst, snd) =>
    switch ((fst |> Js.Date.getTime) -. (snd |> Js.Date.getTime)) {
    | ts when ts < 0. => x
    | ts when ts > 0. => y
    | _ => 0
    };

  let reduceMinOrMax = (fn, acc, date) =>
    switch (date |> Js.Date.getTime) {
    | ts when acc === None || fn(ts, acc |> Belt.Option.getExn) => Some(ts)
    | _ => acc
    };

  let startOrEndOfWeek = (weekStartsOn, type_) => {
    let week = weekStartsOn |> dayToJs |> float_of_int;

    let date =
      switch (type_) {
      | Start(date) =>
        let day = date |> Js.Date.getDay;
        let diff = (day < week ? 7. : 0.) +. day -. week;

        Js.Date.(setDate(date |> makeDate, (date |> getDate) -. diff));
      | End(date) =>
        let day = date |> Js.Date.getDay;
        let diff = (day < week ? (-7.) : 0.) +. 6. -. (day -. week);

        Js.Date.(setDate(date |> makeDate, (date |> getDate) +. diff));
      };

    date |> Js.Date.fromFloat;
  };

  let isLeap = year =>
    year mod 400 === 0 || year mod 4 === 0 && year mod 100 !== 0;

  let makeIntervalDay = (interval, index) =>
    interval.start |> makeDateWithStartOfDayHours |> addDays(index);

  let getAmountOfIntervalDays = interval =>
    differenceIn(
      CalendarDays(makeDateWithStartOfDayHours),
      interval.start,
      interval.end_,
    )
    |> succ;

  let minOrMaxOfArray = (fn, dates) =>
    Belt.Array.reduce(dates, None, fn |> reduceMinOrMax) |> retrieveMinOrMax;

  let minOrMaxOfList = (fn, dates) =>
    Belt.List.reduce(dates, None, fn |> reduceMinOrMax) |> retrieveMinOrMax;

  let startOfMonth = date =>
    Js.Date.(
      setDate(date |> makeDate, 1.)
      |> fromFloat
      |> makeDateWithStartOfDayHours
    );

  let lastDayOfMonth = date =>
    date |> makeLastDayOfMonth |> makeDateWithStartOfDayHours;

  let closestTo = (date, acc, dateToCompare) => {
    let distance =
      Js.Math.abs_float(
        (date |> Js.Date.getTime) -. (dateToCompare |> Js.Date.getTime),
      );
    let result = {date: Some(dateToCompare), distance: Some(distance)};

    Belt.Option.mapWithDefault(acc.distance, result, minDistance =>
      distance < minDistance ? result : acc
    );
  };

  let defaultClosestToDate = {date: None, distance: None};

  let retrieveClosestToDate = currentDate => currentDate.date;
};

/* ——[Common helpers]——————————— */

let isEqual = (snd, fst) => Js.Date.(fst |> getTime === (snd |> getTime));

let isAfter = (snd, fst) => Js.Date.(fst |> getTime > (snd |> getTime));

let isBefore = (snd, fst) => Js.Date.(fst |> getTime < (snd |> getTime));

let isFuture = date => date |> isAfter(Js.Date.make());

let isPast = date => date |> isBefore(Js.Date.make());

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
  && date
  <= Js.Date.(
       makeWithYM(~year, ~month, ()) |> Internal.makeLastDayOfMonth |> getDate
     )
  && hours >= 0.
  && hours <= 23.
  && minutes >= 0.
  && minutes <= 59.
  && seconds >= 0.
  && seconds <= 59.;

/* ——[Second helpers]——————————— */

let addSeconds = (seconds, date) =>
  Js.Date.(
    setSeconds(
      date |> Internal.makeDate,
      (date |> getSeconds) +. (seconds |> float_of_int),
    )
    |> fromFloat
  );

let subSeconds = (seconds, date) => date |> addSeconds(- seconds);

let differenceInSeconds = Internal.differenceIn(Seconds);

let startOfSecond = date =>
  Js.Date.(setMilliseconds(date |> Internal.makeDate, 0.) |> fromFloat);

let endOfSecond = date =>
  Js.Date.(setMilliseconds(date |> Internal.makeDate, 999.) |> fromFloat);

let isSameSecond = (fst, snd) =>
  fst |> startOfSecond |> isEqual(snd |> startOfSecond);

let closestToArray = (datesToCompare, date) =>
  Internal.(
    Belt.Array.reduce(datesToCompare, defaultClosestToDate, closestTo(date))
    |> retrieveClosestToDate
  );

let closestToList = (datesToCompare, date) =>
  Internal.(
    Belt.List.reduce(datesToCompare, defaultClosestToDate, closestTo(date))
    |> retrieveClosestToDate
  );

/* ——[Minute helpers]——————————— */

let addMinutes = (minutes, date) =>
  Js.Date.(
    setMinutes(
      date |> Internal.makeDate,
      (date |> getMinutes) +. (minutes |> float_of_int),
    )
    |> fromFloat
  );

let subMinutes = (minutes, date) => date |> addMinutes(- minutes);

let differenceInMinutes = Internal.differenceIn(Minutes);

let startOfMinute = date =>
  Js.Date.(
    setSecondsMs(date |> Internal.makeDate, ~seconds=0., ~milliseconds=0., ())
    |> fromFloat
  );

let endOfMinute = date =>
  Js.Date.(
    setSecondsMs(
      date |> Internal.makeDate,
      ~seconds=59.,
      ~milliseconds=999.,
      (),
    )
    |> fromFloat
  );

let isSameMinute = (fst, snd) =>
  fst |> startOfMinute |> isEqual(snd |> startOfMinute);

let roundToNearestMinute = (~nearestTo=1, date) => {
  let closestTo = (date |> Js.Date.getSeconds) /. 60. |> Js.Math.round;
  let closestMinute = (date |> Js.Date.getMinutes) +. closestTo;
  let nearestRoundedMinute =
    nearestTo !== 1
      ? (
          (date |> Js.Date.getMinutes)
          /. (nearestTo |> float_of_int)
          |> Js.Math.round
        )
        *. (nearestTo |> float_of_int)
      : closestMinute;

  Js.Date.(
    setMinutes(date |> Internal.makeDate, nearestRoundedMinute)
    |> fromFloat
    |> startOfMinute
  );
};

/* ——[Hour helpers]——————————— */

let addHours = (hours, date) =>
  Js.Date.(
    setHours(
      date |> Internal.makeDate,
      (date |> getHours) +. (hours |> float_of_int),
    )
    |> fromFloat
  );

let subHours = (hours, date) => date |> addHours(- hours);

let differenceInHours = Internal.differenceIn(Hours);

let startOfHour = date =>
  Js.Date.(
    setMinutesSMs(
      date |> Internal.makeDate,
      ~minutes=0.,
      ~seconds=0.,
      ~milliseconds=0.,
      (),
    )
    |> fromFloat
  );

let endOfHour = date =>
  Js.Date.(
    setMinutesSMs(
      date |> Internal.makeDate,
      ~minutes=59.,
      ~seconds=59.,
      ~milliseconds=999.,
      (),
    )
    |> fromFloat
  );

let isSameHour = (fst, snd) =>
  fst |> startOfHour |> isEqual(snd |> startOfHour);

/* ——[Day helpers]——————————— */

let addDays = Internal.addDays;

let rec addBusinessDays = (days, date) => {
  let next = days < 0 ? succ : pred;
  let sign = days < 0 ? (-1) : 1;
  let date = date |> addDays(sign);

  if (Internal.isWeekend(date)) {
    date |> addBusinessDays(days);
  } else {
    days == 0
      ? date |> addDays(- sign) : date |> addBusinessDays(days |> next);
  };
};

let subDays = (days, date) => date |> addDays(- days);

let startOfDay = Internal.makeDateWithStartOfDayHours;

let endOfDay = Internal.makeDateWithEndOfDayHours;

let differenceInCalendarDays =
  Internal.differenceIn(CalendarDays(startOfDay));

let differenceInDays = Internal.differenceIn(Days);

let differenceInBusinessDays =
  Internal.differenceIn(BusinessDays(startOfDay));

let getDayOfYear = date =>
  date |> differenceInCalendarDays(date |> Internal.startOfYear) |> succ;

let isSameDay = (fst, snd) =>
  fst |> startOfDay |> isEqual(snd |> startOfDay);

let isToday = date => date |> isSameDay(Js.Date.make());

let isTomorrow = date => date |> isSameDay(Js.Date.make() |> addDays(1));

let isYesterday = date => date |> isSameDay(Js.Date.make() |> subDays(1));

/* ——[Week helpers]——————————— */

let addWeeks = (weeks, date) => date |> addDays(weeks * 7);

let subWeeks = (weeks, date) => date |> addWeeks(- weeks);

let differenceInWeeks = Internal.differenceIn(Weeks);

let startOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(
    Start(date)
    |> startOrEndOfWeek(weekStartsOn)
    |> makeDateWithStartOfDayHours
  );

let endOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(
    End(date) |> startOrEndOfWeek(weekStartsOn) |> makeDateWithEndOfDayHours
  );

let differenceInCalendarWeeks = (~weekStartsOn=Sunday) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  Internal.differenceIn(CalendarWeeks(startOfWeek'));
};

let isSameWeek = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek' = startOfWeek(~weekStartsOn);
  fst |> startOfWeek' |> isEqual(snd |> startOfWeek');
};

let lastDayOfWeek = (~weekStartsOn=Sunday, date) =>
  Internal.(
    End(date)
    |> startOrEndOfWeek(weekStartsOn)
    |> makeDateWithStartOfDayHours
  );

let getWeekOfMonth = (~weekStartsOn=Sunday, date) => {
  let startWeekDay = date |> Internal.startOfMonth |> Js.Date.getDay;
  let weekStartsOn' = weekStartsOn |> Internal.dayToJs |> float_of_int;
  let diff =
    startWeekDay < weekStartsOn'
      ? 7. -. weekStartsOn' +. startWeekDay : startWeekDay -. weekStartsOn';

  ((date |> Js.Date.getDate) +. diff) /. 7. |> Js.Math.ceil_int;
};

let getWeeksInMonth = (~weekStartsOn=Sunday, date) => {
  let differenceInCalendarWeeks' = differenceInCalendarWeeks(~weekStartsOn);
  Internal.(
    date
    |> lastDayOfMonth
    |> differenceInCalendarWeeks'(date |> startOfMonth)
    |> succ
  );
};

/* ——[Weekday helpers]——————————— */

let isSunday = Internal.is(Sunday);

let isMonday = Internal.is(Monday);

let isTuesday = Internal.is(Tuesday);

let isWednesday = Internal.is(Wednesday);

let isThursday = Internal.is(Thursday);

let isFriday = Internal.is(Friday);

let isSaturday = Internal.is(Saturday);

let isWeekend = Internal.isWeekend;

/* ——[Month helpers]——————————— */

let getDaysInMonth = Internal.getDaysInMonth;

let addMonths = Internal.addMonths;

let subMonths = (months, date) => date |> addMonths(- months);

let differenceInCalendarMonths = Internal.differenceIn(CalendarMonths);

let differenceInMonths = Internal.differenceIn(Months);

let startOfMonth = Internal.startOfMonth;

let endOfMonth = date =>
  Internal.(date |> makeLastDayOfMonth |> makeDateWithEndOfDayHours);

let isFirstDayOfMonth = date => date |> Js.Date.getDate |> int_of_float === 1;

let isLastDayOfMonth = date =>
  Js.Date.(date |> endOfDay |> getTime === (date |> endOfMonth |> getTime));

let isSameMonth = (fst, snd) =>
  fst |> startOfMonth |> isEqual(snd |> startOfMonth);

let lastDayOfMonth = Internal.lastDayOfMonth;

/* ——[Year helpers]——————————— */

let addYears = (years, date) => date |> addMonths(12 * years);

let subYears = (years, date) => date |> addYears(- years);

let startOfYear = Internal.startOfYear;

let isSameYear = (fst, snd) =>
  fst |> startOfYear |> isEqual(snd |> startOfYear);

let isLeapYear = date =>
  date |> Js.Date.getFullYear |> int_of_float |> Internal.isLeap;

let endOfYear = date =>
  Js.Date.(makeWithYMD(~year=date |> getFullYear, ~month=11., ~date=31., ()))
  |> Internal.makeDateWithEndOfDayHours;

let lastMonthOfYear = date =>
  Js.Date.(makeWithYMD(~year=date |> getFullYear, ~month=11., ~date=1., ()))
  |> Internal.makeDateWithStartOfDayHours;

let lastDayOfYear = date => date |> lastMonthOfYear |> lastDayOfMonth;

let getDaysInYear = date => date |> isLeapYear ? 366 : 365;

let differenceInCalendarYears = Internal.differenceIn(CalendarYears);

let differenceInYears = Internal.differenceIn(Years);

/* ——[Interval helpers]——————————— */

let isWithinInterval = (interval, date) => {
  let ts = date |> Js.Date.getTime;
  ts >= (interval.start |> Js.Date.getTime)
  && ts <= (interval.end_ |> Js.Date.getTime);
};

let areIntervalsOverlapping = (left, right) =>
  Js.Date.(
    left.start
    |> getTime < (right.end_ |> getTime)
    && right.start
    |> getTime < (left.end_ |> getTime)
  );

let getOverlappingDaysInIntervals = (left, right) =>
  Js.Date.(
    switch (
      left.start |> getTime,
      left.end_ |> getTime,
      right.start |> getTime,
      right.end_ |> getTime,
    ) {
    | (lst, let', rst, ret) when lst < ret && rst < let' =>
      let overlapStartTime = rst < lst ? lst : rst;
      let overlapEndTime = ret > let' ? let' : ret;
      let overlap =
        (overlapEndTime -. overlapStartTime)
        /. (Milliseconds.day |> float_of_int);

      overlap |> Js.Math.ceil_int;
    | _ => 0
    }
  );

let eachDayOfIntervalArray = interval =>
  Internal.(
    Belt.Array.makeBy(
      interval |> getAmountOfIntervalDays,
      interval |> makeIntervalDay,
    )
  );

let eachDayOfIntervalList = interval =>
  Internal.(
    Belt.List.makeBy(
      interval |> getAmountOfIntervalDays,
      interval |> makeIntervalDay,
    )
  );

/* ——[ISO Week helpers]——————— */

let endOfISOWeek = endOfWeek(~weekStartsOn=Monday);

let isSameISOWeek = isSameWeek(~weekStartsOn=Monday);

let isThisISOWeek = date => isSameISOWeek(Js.Date.make(), date);

let lastDayOfISOWeek = lastDayOfWeek(~weekStartsOn=Monday);

let startOfISOWeek = startOfWeek(~weekStartsOn=Monday);

let differenceInCalendarISOWeeks = (fst, snd) => {
  let startOfFstISOWeek = startOfISOWeek(fst);
  let startOfSndISOWeek = startOfISOWeek(snd);

  let timestampFst =
    Js.Date.getTime(startOfFstISOWeek)
    -. Internal.getTimezoneOffsetInMilliseconds(startOfFstISOWeek);
  let timestampSnd =
    Js.Date.getTime(startOfSndISOWeek)
    -. Internal.getTimezoneOffsetInMilliseconds(startOfSndISOWeek);

  (timestampFst -. timestampSnd)
  /. float_of_int(Milliseconds.week)
  |> Js.Math.round
  |> int_of_float;
};

/* ——[ISO Week-Numbering Year Helpers]—— */

let getISOWeekYear = date => {
  let year = Js.Date.getFullYear(date);

  let fourthOfJanuaryOfNextYear =
    Js.Date.setFullYearMD(
      Js.Date.fromFloat(0.),
      ~year=year +. 1.,
      ~month=0.,
      ~date=4.,
      (),
    )
    |> Js.Date.fromFloat
    |> Internal.makeDateWithStartOfDayHours;
  let startOfNextYear = fourthOfJanuaryOfNextYear |> startOfISOWeek;

  let fourthOfJanuaryOfThisYear =
    Js.Date.setFullYear(
      fourthOfJanuaryOfNextYear |> Js.Date.getTime |> Js.Date.fromFloat,
      year,
    )
    |> Js.Date.fromFloat;
  let startOfThisYear = fourthOfJanuaryOfThisYear |> startOfISOWeek;

  if (Js.Date.getTime(date) >= Js.Date.getTime(startOfNextYear)) {
    year +. 1. |> int_of_float;
  } else if (Js.Date.getTime(date) >= Js.Date.getTime(startOfThisYear)) {
    year |> int_of_float;
  } else {
    year -. 1. |> int_of_float;
  };
};

let startOfISOWeekYear = date => {
  let year = getISOWeekYear(date) |> float_of_int;

  let fourthOfJanuary = Js.Date.fromFloat(0.);
  let fourthOfJanuary =
    Js.Date.setFullYearMD(fourthOfJanuary, ~year, ~month=0., ~date=4., ())
    |> Js.Date.fromFloat
    |> Internal.makeDateWithStartOfDayHours;
  let startOfThisYear = startOfISOWeek(fourthOfJanuary);
  startOfThisYear;
};

let getISOWeek = date => {
  let diff =
    Js.Date.getTime(startOfISOWeek(date))
    -. Js.Date.getTime(startOfISOWeekYear(date));

  /*
   Round the number of days to the nearest integer
   because the number of milliseconds in a week is not constant
   (e.g. it's different in the week of the daylight saving time clock shift)
   */
  Js.Math.round(diff /. float_of_int(Milliseconds.week))
  +. 1.
  |> int_of_float;
};

let setISOWeek = (date, ~week) => {
  let diff = getISOWeek(date) - week |> float_of_int;

  let newDate = Js.Date.getTime(date) |> Js.Date.fromFloat;
  Js.Date.setDate(newDate, Js.Date.getDate(date) -. diff *. 7.0)
  |> Js.Date.fromFloat;
};
