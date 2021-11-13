open ReDate_utils
open ReDate_types

let endOfISOWeek = ReDate_week.endOfWeek(~weekStartsOn=Monday)

let isSameISOWeek = ReDate_week.isSameWeek(~weekStartsOn=Monday)

let isThisISOWeek = date => isSameISOWeek(Js.Date.make(), date)

let lastDayOfISOWeek = ReDate_week.lastDayOfWeek(~weekStartsOn=Monday)

let startOfISOWeek = ReDate_week.startOfWeek(~weekStartsOn=Monday)

let differenceInCalendarISOWeeks = (fst, snd) => {
  let fst = startOfISOWeek(fst)
  let snd = startOfISOWeek(snd)
  let fstTimestamp = Js.Date.getTime(fst) -. getTimezoneOffsetInMilliseconds(fst)
  let sndTimestamp = Js.Date.getTime(snd) -. getTimezoneOffsetInMilliseconds(snd)
  let diff = (fstTimestamp -. sndTimestamp) /. Milliseconds.week

  Js.Math.round(diff)
}

let getISOWeek = date => {
  let diff =
    Js.Date.getTime(startOfISOWeek(date)) -.
    Js.Date.getTime(ReDate_iso_week_numbering.startOfISOWeekYear(date))

  Js.Math.round(diff /. Milliseconds.week) +. 1.
}

let setISOWeek = (date, week) => {
  let diff = getISOWeek(date) -. week
  let day = Js.Date.getDate(date)
  let date = date->Js.Date.getTime->Js.Date.fromFloat

  Js.Date.setDate(makeDate(date), day -. diff *. 7.)->Js.Date.fromFloat
}
