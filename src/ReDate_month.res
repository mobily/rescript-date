open ReDate_utils

let getDaysInMonth = date => {
  let lastDayOfMonth = makeLastDayOfMonthDate(date)
  Js.Date.getDate(lastDayOfMonth)
}

let addMonths = (date, months) => {
  let year = Js.Date.getFullYear(date)
  let month = Js.Date.getMonth(date) +. months
  let daysInMonth = getDaysInMonth(date)
  let date = Js.Math.min_float(daysInMonth, Js.Date.getDate(date))

  Js.Date.makeWithYMD(~year, ~month, ~date, ())
}

let subMonths = (date, months) => addMonths(date, -.months)

let getMonth = Js.Date.getMonth

let setMonth = (date, month) => {
  let year = Js.Date.getFullYear(date)
  let day = Js.Date.getDate(date)
  let date = Js.Date.makeWithYMD(~year, ~month, ~date=day, ())
  let daysInMonth = getDaysInMonth(date)

  Js.Date.makeWithYMD(~year, ~month, ~date=Js.Math.min_float(day, daysInMonth), ())
}

let differenceInCalendarMonths = (fst, snd) => {
  let fstYear = Js.Date.getFullYear(fst)
  let fstMonth = Js.Date.getMonth(fst)
  let sndYear = Js.Date.getFullYear(snd)
  let sndMonth = Js.Date.getMonth(snd)

  (fstYear -. sndYear) *. 12. +. (fstMonth -. sndMonth)
}

let differenceInMonths = (fst, snd) => {
  let diff =
    Js.Date.getMonth(fst) -.
    Js.Date.getMonth(snd) +.
    12. *. (Js.Date.getFullYear(fst) -. Js.Date.getFullYear(snd))
  let anchor = addMonths(snd, diff)
  let anchorTime = Js.Date.getTime(anchor)
  let fstTime = Js.Date.getTime(fst)
  let adjust = if fstTime -. anchorTime < 0. {
    (fstTime -. anchorTime) /. (anchorTime -. addMonths(snd, Float.pred(diff))->Js.Date.getTime)
  } else {
    (fstTime -. anchorTime) /. (addMonths(snd, Float.succ(diff))->Js.Date.getTime -. anchorTime)
  }

  Js.Math.round(adjust) +. diff
}

let startOfMonth = date =>
  Js.Date.setDate(makeDate(date), 1.)->Js.Date.fromFloat->makeStartOfDayDate

let endOfMonth = date => date->makeLastDayOfMonthDate->makeEndOfDayDate

let isFirstDayOfMonth = date => Js.Date.getDate(date) == 1.

let isLastDayOfMonth = date => ReDate_common.isEqual(makeEndOfDayDate(date), endOfMonth(date))

let isSameMonth = (fst, snd) => ReDate_common.isEqual(startOfMonth(fst), startOfMonth(snd))

let lastDayOfMonth = date => date->makeLastDayOfMonthDate->makeStartOfDayDate
