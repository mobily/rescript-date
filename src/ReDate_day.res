open ReDate_utils

let addDays = (date, days) => {
  let day = Js.Date.getDate(date) +. days
  let date = Js.Date.setDate(makeDate(date), day)

  Js.Date.fromFloat(date)
}

let rec addBusinessDays = (date, days) => {
  let next = days < 0. ? Float.succ : Float.pred
  let offset = days < 0. ? -1. : 1.
  let date = addDays(date, offset)

  switch date {
  | date if ReDate_weekday.isWeekend(date) => addBusinessDays(date, days)
  | _ if days == 0. => addDays(date, -.offset)
  | _ => addBusinessDays(date, next(days))
  }
}

let subDays = (date, days) => addDays(date, -.days)

let getDate = Js.Date.getDate

let setDate = (date, day) => {
  let date = Js.Date.setDate(makeDate(date), day)
  Js.Date.fromFloat(date)
}

let startOfDay = makeStartOfDayDate

let endOfDay = makeEndOfDayDate

let differenceInCalendarDays = (fst, snd) => {
  let fst = startOfDay(fst)
  let snd = startOfDay(snd)
  let fstTime = Js.Date.getTime(fst) -. getTimezoneOffsetInMilliseconds(fst)
  let sndTime = Js.Date.getTime(snd) -. getTimezoneOffsetInMilliseconds(snd)
  let diff = (fstTime -. sndTime) /. Milliseconds.day

  Js.Math.round(diff)
}

let differenceInDays = (fst, snd) => {
  let diff = (Js.Date.getTime(fst) -. Js.Date.getTime(snd)) /. Milliseconds.day
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let differenceInBusinessDays = (fst, snd) => {
  let diff = differenceInCalendarDays(fst, snd)
  let date = diff < 0. ? fst : snd
  let result = ref(0.)

  let maxDiff = diff->int_of_float->Js.Math.abs_int->pred

  for index in 0 to maxDiff {
    let day = addDays(date, float_of_int(index))
    result.contents = ReDate_weekday.isWeekend(day) ? result.contents : Float.succ(result.contents)
  }

  diff < 0. ? -.result.contents : result.contents
}

let getDayOfYear = date => {
  let diff = differenceInCalendarDays(date, ReDate_year.startOfYear(date))
  Float.succ(diff)
}

let isSameDay = (fst, snd) => ReDate_common.isEqual(startOfDay(fst), startOfDay(snd))

let isToday = date => isSameDay(Js.Date.make(), date)

let isTomorrow = date => {
  let today = Js.Date.make()
  isSameDay(addDays(today, 1.), date)
}

let isYesterday = date => {
  let today = Js.Date.make()
  isSameDay(subDays(today, 1.), date)
}
