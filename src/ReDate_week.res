open ReDate_utils
open ReDate_types

let addWeeks = (date, weeks) => ReDate_day.addDays(date, weeks *. 7.)

let subWeeks = (date, weeks) => addWeeks(date, -.weeks)

let differenceInWeeks = (fst, snd) => {
  let diff = (Js.Date.getTime(fst) -. Js.Date.getTime(snd)) /. Milliseconds.week
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let startOfWeek = ReDate_utils.startOfWeek

let endOfWeek = (~weekStartsOn=Sunday, date) => {
  let startWeekDay = getWeekDayNum(weekStartsOn)
  let day = Js.Date.getDay(date)
  let diff = (day < startWeekDay ? -7. : 0.) +. 6. -. (day -. startWeekDay)

  Js.Date.setDate(makeDate(date), Js.Date.getDate(date) +. diff)
  ->Js.Date.fromFloat
  ->makeEndOfDayDate
}

let differenceInCalendarWeeks = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek = startOfWeek(~weekStartsOn)
  let fst = startOfWeek(fst)
  let snd = startOfWeek(snd)
  let fstTime = Js.Date.getTime(fst) -. getTimezoneOffsetInMilliseconds(fst)
  let sndTime = Js.Date.getTime(snd) -. getTimezoneOffsetInMilliseconds(snd)
  let diff = (fstTime -. sndTime) /. Milliseconds.week

  Js.Math.round(diff)
}

let isSameWeek = (~weekStartsOn=Sunday, fst, snd) => {
  let startOfWeek = startOfWeek(~weekStartsOn)
  ReDate_common.isEqual(startOfWeek(fst), startOfWeek(snd))
}

let lastDayOfWeek = (~weekStartsOn=Sunday, date) =>
  makeStartOfDayDate(endOfWeek(~weekStartsOn, date))

let getWeekOfMonth = (~weekStartsOn=Sunday, date) => {
  let firstMonthDay = Js.Date.getDay(ReDate_month.startOfMonth(date))
  let startWeekDay = getWeekDayNum(weekStartsOn)
  let diff =
    firstMonthDay < startWeekDay
      ? 7. -. startWeekDay +. firstMonthDay
      : firstMonthDay -. startWeekDay
  let result = (Js.Date.getDate(date) +. diff) /. 7.

  Js.Math.ceil_float(result)
}

let getWeeksInMonth = (~weekStartsOn=Sunday, date) => {
  let differenceInCalendarWeeks = differenceInCalendarWeeks(~weekStartsOn)
  date
  ->ReDate_month.lastDayOfMonth
  ->differenceInCalendarWeeks(ReDate_month.startOfMonth(date))
  ->Float.succ
}

let getWeek = (~weekStartsOn=Sunday, date) => {
  let diff = {
    let fst = ReDate_week_numbering.startOfWeekYear(~weekStartsOn, date)
    let snd = startOfWeek(~weekStartsOn, date)
    Js.Date.getTime(snd) -. Js.Date.getTime(fst)
  }

  Js.Math.round(diff /. Milliseconds.week) +. 1.
}
