open ReDate_utils

let getDaysInMonth = date => {
  let lastDayOfMonth = makeLastDayOfMonthDate(date)
  Js.Date.getDate(lastDayOfMonth)
}

let addMonths = (months, date) => {
  let year = Js.Date.getFullYear(date)
  let month = Js.Date.getMonth(date) +. months
  let daysInMonth = getDaysInMonth(date)
  let date = Js.Math.min_float(daysInMonth, Js.Date.getDate(date))

  Js.Date.makeWithYMD(~year, ~month, ~date, ())
}

let subMonths = (months, date) => addMonths(-.months, date)

let getMonth = Js.Date.getMonth

let setMonth = (month, date) => {
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

  (sndYear -. fstYear) *. 12. +. (sndMonth -. fstMonth)
}

let differenceInMonths = (fst, snd) => {
  let diff =
    Js.Date.getMonth(snd) -.
    Js.Date.getMonth(fst) +.
    12. *. (Js.Date.getFullYear(snd) -. Js.Date.getFullYear(fst))
  let anchor = addMonths(diff, fst)
  let anchorTime = Js.Date.getTime(anchor)
  let sndTime = Js.Date.getTime(snd)
  let adjust = if sndTime -. anchorTime < 0. {
    (sndTime -. anchorTime) /. (anchorTime -. (addMonths(Float.pred(diff), fst) |> Js.Date.getTime))
  } else {
    (sndTime -. anchorTime) /. ((addMonths(Float.succ(diff), fst) |> Js.Date.getTime) -. anchorTime)
  }

  Js.Math.round(adjust) +. diff
}

let startOfMonth = date =>
  Js.Date.setDate(makeDate(date), 1.) |> Js.Date.fromFloat |> makeStartOfDayDate

let endOfMonth = date => date |> makeLastDayOfMonthDate |> makeEndOfDayDate

let isFirstDayOfMonth = date => Js.Date.getDate(date) == 1.

let isLastDayOfMonth = date => ReDate_common.isEqual(makeEndOfDayDate(date), endOfMonth(date))

let isSameMonth = (fst, snd) => ReDate_common.isEqual(startOfMonth(fst), startOfMonth(snd))

let lastDayOfMonth = date => date |> makeLastDayOfMonthDate |> makeStartOfDayDate
