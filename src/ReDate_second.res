open ReDate_utils
open ReDate_types

let addSeconds = (date, seconds) => {
  let seconds = Js.Date.getSeconds(date) +. seconds
  let date = Js.Date.setSeconds(makeDate(date), seconds)

  Js.Date.fromFloat(date)
}

let subSeconds = (date, seconds) => addSeconds(date, -.seconds)

let setSeconds = (date, seconds) => {
  let date = Js.Date.setSeconds(makeDate(date), seconds)
  Js.Date.fromFloat(date)
}

let getSeconds = Js.Date.getSeconds

let differenceInSeconds = (fst, snd) => {
  let diff = (Js.Date.getTime(fst) -. Js.Date.getTime(snd)) /. Milliseconds.second
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}

let startOfSecond = date => {
  let date = Js.Date.setMilliseconds(makeDate(date), 0.)
  Js.Date.fromFloat(date)
}

let endOfSecond = date => {
  let date = Js.Date.setMilliseconds(makeDate(date), 999.)
  Js.Date.fromFloat(date)
}

let isSameSecond = (fst, snd) => ReDate_common.isEqual(startOfSecond(fst), startOfSecond(snd))

let closestTo = (date, dates) => {
  let result = dates->Belt.Array.reduce({date: None, distance: None}, (acc, compareDate) => {
    let distance = Js.Math.abs_float(Js.Date.getTime(date) -. Js.Date.getTime(compareDate))
    let result = {date: Some(compareDate), distance: Some(distance)}

    Belt.Option.mapWithDefault(acc.distance, result, minDistance =>
      distance < minDistance ? result : acc
    )
  })
  result.date
}
