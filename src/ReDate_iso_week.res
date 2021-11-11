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

  (fstTimestamp -. sndTimestamp) /. Milliseconds.week |> Js.Math.round
}
