open ReDate_utils

let addHours = (hours, date) => {
  let hours = Js.Date.getHours(date) +. hours
  let date = Js.Date.setHours(makeDate(date), hours)

  Js.Date.fromFloat(date)
}

let subHours = (hours, date) => addHours(-.hours, date)

let getHours = Js.Date.getHours

let setHours = (hours, date) => {
  let date = Js.Date.setHours(makeDate(date), hours)
  Js.Date.fromFloat(date)
}

let differenceInHours = (fst, snd) => {
  let diff = (Js.Date.getTime(snd) -. Js.Date.getTime(fst)) /. Milliseconds.hour
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let startOfHour = date => {
  let date = Js.Date.setMinutesSMs(makeDate(date), ~minutes=0., ~seconds=0., ~milliseconds=0., ())
  Js.Date.fromFloat(date)
}

let endOfHour = date => {
  let date = Js.Date.setMinutesSMs(
    makeDate(date),
    ~minutes=59.,
    ~seconds=59.,
    ~milliseconds=999.,
    (),
  )
  Js.Date.fromFloat(date)
}

let isSameHour = (fst, snd) => ReDate_common.isEqual(startOfHour(fst), startOfHour(snd))
