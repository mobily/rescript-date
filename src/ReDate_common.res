open ReDate_utils

let isEqual = (fst, snd) => Js.Date.getTime(fst) == Js.Date.getTime(snd)
let isAfter = (fst, snd) => Js.Date.getTime(fst) > Js.Date.getTime(snd)
let isBefore = (fst, snd) => Js.Date.getTime(fst) < Js.Date.getTime(snd)
let isFuture = date => isAfter(date, Js.Date.make())
let isPast = date => isBefore(date, Js.Date.make())

let compareAsc = (fst, snd) => {
  switch Js.Date.getTime(fst) -. Js.Date.getTime(snd) {
  | ts if ts < 0. => -1
  | ts if ts > 0. => 1
  | _ => 0
  }
}

let compareDesc = (fst, snd) => {
  switch Js.Date.getTime(fst) -. Js.Date.getTime(snd) {
  | ts if ts < 0. => 1
  | ts if ts > 0. => -1
  | _ => 0
  }
}

let min = dates => {
  let date = Belt.Array.reduce(dates, None, (acc, date) => {
    switch Js.Date.getTime(date) {
    | timestamp if acc == None || timestamp < Belt.Option.getExn(acc) => Some(timestamp)
    | _ => acc
    }
  })

  date->Belt.Option.getExn->Js.Date.fromFloat
}

let max = dates => {
  let date = Belt.Array.reduce(dates, None, (acc, date) => {
    switch Js.Date.getTime(date) {
    | ts if acc == None || ts > Belt.Option.getExn(acc) => Some(ts)
    | _ => acc
    }
  })

  date->Belt.Option.getExn->Js.Date.fromFloat
}

let isValid = (~year, ~month, ~date, ~hours=0., ~minutes=0., ~seconds=0., ()) => {
  let lastDayOfMonth =
    Js.Date.makeWithYM(~year, ~month, ())->makeLastDayOfMonthDate->Js.Date.getDate

  year <= 199999. &&
  year >= -199999. &&
  month <= 11. &&
  month >= 0. &&
  date >= 1. &&
  date <= lastDayOfMonth &&
  hours >= 0. &&
  hours <= 23. &&
  minutes >= 0. &&
  minutes <= 59. &&
  seconds >= 0. &&
  seconds <= 59.
}
