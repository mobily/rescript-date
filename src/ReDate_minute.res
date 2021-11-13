open ReDate_utils

let addMinutes = (date, minutes) => {
  let minutes = Js.Date.getMinutes(date) +. minutes
  let date = Js.Date.setMinutes(makeDate(date), minutes)

  Js.Date.fromFloat(date)
}

let subMinutes = (date, minutes) => addMinutes(date, -.minutes)

let differenceInMinutes = (fst, snd) => {
  let diff = (Js.Date.getTime(fst) -. Js.Date.getTime(snd)) /. Milliseconds.minute
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let getMinutes = Js.Date.getMinutes

let setMinutes = (date, minutes) => {
  let date = Js.Date.setMinutes(makeDate(date), minutes)
  Js.Date.fromFloat(date)
}

let startOfMinute = date => {
  let date = Js.Date.setSecondsMs(makeDate(date), ~seconds=0., ~milliseconds=0., ())
  Js.Date.fromFloat(date)
}

let endOfMinute = date => {
  let date = Js.Date.setSecondsMs(makeDate(date), ~seconds=59., ~milliseconds=999., ())
  Js.Date.fromFloat(date)
}

let isSameMinute = (fst, snd) => ReDate_common.isEqual(startOfMinute(fst), startOfMinute(snd))

let roundToNearestMinute = (~nearestTo=1., date) => {
  let closestTo = Js.Math.round(Js.Date.getSeconds(date) /. 60.)
  let closestMinute = Js.Date.getMinutes(date) +. closestTo
  let nearestRoundedMinute =
    nearestTo != 1.
      ? Js.Math.round(Js.Date.getMinutes(date) /. nearestTo) *. nearestTo
      : closestMinute

  Js.Date.setMinutes(makeDate(date), nearestRoundedMinute)->Js.Date.fromFloat->startOfMinute
}
