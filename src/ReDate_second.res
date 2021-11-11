open ReDate_utils
open ReDate_types

let addSeconds = (seconds, date) => {
  let seconds = Js.Date.getSeconds(date) +. seconds
  let date = Js.Date.setSeconds(makeDate(date), seconds)

  Js.Date.fromFloat(date)
}

let subSeconds = (seconds, date) => addSeconds(-.seconds, date)

let setSeconds = (seconds, date) => {
  let date = Js.Date.setSeconds(makeDate(date), seconds)
  Js.Date.fromFloat(date)
}

let getSeconds = Js.Date.getSeconds

let differenceInSeconds = (fst, snd) => {
  let diff = (Js.Date.getTime(snd) -. Js.Date.getTime(fst)) /. Milliseconds.second
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

let closestTo = (dates, fst) => {
  let result = dates->Belt.Array.reduce({date: None, distance: None}, (acc, snd) => {
    let distance = Js.Math.abs_float(Js.Date.getTime(fst) -. Js.Date.getTime(snd))
    let result = {date: Some(snd), distance: Some(distance)}

    Belt.Option.mapWithDefault(acc.distance, result, minDistance =>
      distance < minDistance ? result : acc
    )
  })
  result.date
}
