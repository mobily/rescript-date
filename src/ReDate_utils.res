open ReDate_types

external toDayMagic: int => ReDate_types.day = "%identity"

module Milliseconds = {
  let second = 1000.
  let minute = 60. *. second
  let hour = 60. *. minute
  let day = 24. *. hour
  let week = 7. *. day
}

module Float = {
  let succ = value => value +. 1.
  let pred = value => value -. 1.
}

let getWeekDayNum = day => {
  switch day {
  | Sunday => 0.
  | Monday => 1.
  | Tuesday => 2.
  | Wednesday => 3.
  | Thursday => 4.
  | Friday => 5.
  | Saturday => 6.
  }
}

let makeDate = date => date->Js.Date.getTime->Js.Date.fromFloat

let makeLastDayOfMonthDate = date =>
  Js.Date.makeWithYMD(
    ~year=Js.Date.getFullYear(date),
    ~month=Js.Date.getMonth(date) +. 1.,
    ~date=0.,
    (),
  )

let makeStartOfDayDate = date => {
  let date = Js.Date.setHoursMSMs(
    makeDate(date),
    ~hours=0.,
    ~minutes=0.,
    ~seconds=0.,
    ~milliseconds=0.,
    (),
  )

  Js.Date.fromFloat(date)
}

let makeEndOfDayDate = date => {
  let date = Js.Date.setHoursMSMs(
    makeDate(date),
    ~hours=23.,
    ~minutes=59.,
    ~seconds=59.,
    ~milliseconds=999.,
    (),
  )

  Js.Date.fromFloat(date)
}

let makeStartOfYearDate = year => {
  let date = Js.Date.makeWithYMD(~year, ~month=0., ~date=1., ())
  makeStartOfDayDate(date)
}

let getTimezoneOffsetInMilliseconds = date => {
  let offset =
    Js.Date.getTimezoneOffset(date) *. Milliseconds.minute +.
      Js.Date.setSecondsMs(makeDate(date), ~seconds=0., ~milliseconds=0., ())
  let fst = int_of_float(offset)
  let snd = int_of_float(Milliseconds.minute)

  float_of_int(mod(fst, snd))
}

// HACK: ⬇️ avoid dependency cycle
let is = (day, date) => Js.Date.getDay(date) == getWeekDayNum(day)

let startOfWeek = (~weekStartsOn=Sunday, date) => {
  let startWeekDay = getWeekDayNum(weekStartsOn)
  let day = Js.Date.getDay(date)
  let diff = (day < startWeekDay ? 7. : 0.) +. day -. startWeekDay

  Js.Date.setDate(makeDate(date), Js.Date.getDate(date) -. diff)
  ->Js.Date.fromFloat
  ->makeStartOfDayDate
}
