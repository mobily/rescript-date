open ReDate_utils

let addDays = (days, date) => {
  let day = Js.Date.getDate(date) +. days
  let date = Js.Date.setDate(makeDate(date), day)

  Js.Date.fromFloat(date)
}

let rec addBusinessDays = (days, date) => {
  let next = days < 0. ? Float.succ : Float.pred
  let offset = days < 0. ? -1. : 1.
  let date = addDays(offset, date)

  switch date {
  | date if ReDate_weekday.isWeekend(date) => addBusinessDays(days, date)
  | _ if days == 0. => addDays(-.offset, date)
  | _ => addBusinessDays(next(days), date)
  }
}

let subDays = (days, date) => addDays(-.days, date)

let getDate = Js.Date.getDate

let setDate = (day, date) => {
  let date = Js.Date.setDate(makeDate(date), day)
  Js.Date.fromFloat(date)
}

let startOfDay = makeStartOfDayDate

let endOfDay = makeEndOfDayDate

let differenceInCalendarDays = (fst, snd) => {
  let snd = startOfDay(snd)
  let fst = startOfDay(fst)
  let fstTime = Js.Date.getTime(fst) -. getTimezoneOffsetInMilliseconds(fst)
  let sndTime = Js.Date.getTime(snd) -. getTimezoneOffsetInMilliseconds(snd)
  let diff = (sndTime -. fstTime) /. Milliseconds.day

  Js.Math.round(diff)
}

let differenceInDays = (fst, snd) => {
  let diff = (Js.Date.getTime(snd) -. Js.Date.getTime(fst)) /. Milliseconds.day
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let differenceInBusinessDays = (fst, snd) => {
  let diff = differenceInCalendarDays(fst, snd)
  let date = diff < 0. ? snd : fst
  let result = ref(0.)

  let maxDiff = diff |> int_of_float |> Js.Math.abs_int |> pred

  for index in 0 to maxDiff {
    let day = addDays(float_of_int(index), date)
    result.contents = ReDate_weekday.isWeekend(day) ? result.contents : Float.succ(result.contents)
  }

  diff < 0. ? -.result.contents : result.contents
}

let getDayOfYear = date => {
  let diff = differenceInCalendarDays(ReDate_year.startOfYear(date), date)
  Float.succ(diff)
}

let isSameDay = (fst, snd) => ReDate_common.isEqual(startOfDay(fst), startOfDay(snd))

let isToday = date => isSameDay(Js.Date.make(), date)

let isTomorrow = date => {
  let today = Js.Date.make()
  isSameDay(addDays(1., today), date)
}

let isYesterday = date => {
  let today = Js.Date.make()
  isSameDay(subDays(1., today), date)
}
