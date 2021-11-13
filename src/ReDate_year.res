open ReDate_utils

let addYears = (date, years) => ReDate_month.addMonths(date, 12. *. years)

let subYears = (date, years) => addYears(date, -.years)

let getYear = Js.Date.getFullYear

let setYear = (date, year) => {
  let date = Js.Date.setFullYear(makeDate(date), year)
  Js.Date.fromFloat(date)
}

let startOfYear = date =>
  Js.Date.makeWithYMDHMS(
    ~year=Js.Date.getFullYear(date),
    ~month=0.,
    ~date=1.,
    ~hours=0.,
    ~minutes=0.,
    ~seconds=0.,
    (),
  )

let isSameYear = (fst, snd) => ReDate_common.isEqual(startOfYear(fst), startOfYear(snd))

let isLeapYear = date => {
  let year = date->Js.Date.getFullYear->int_of_float
  mod(year, 400) == 0 || (mod(year, 4) == 0 && mod(year, 100) != 0)
}

let endOfYear = date => {
  let year = Js.Date.getFullYear(date)
  let date = Js.Date.makeWithYMD(~year, ~month=11., ~date=31., ())

  makeEndOfDayDate(date)
}

let lastMonthOfYear = date => {
  let year = Js.Date.getFullYear(date)
  let date = Js.Date.makeWithYMD(~year, ~month=11., ~date=1., ())

  makeStartOfDayDate(date)
}

let lastDayOfYear = date => date->lastMonthOfYear->ReDate_month.lastDayOfMonth

let getDaysInYear = date => isLeapYear(date) ? 366 : 365

let differenceInCalendarYears = (fst, snd) => {
  let fstYear = Js.Date.getFullYear(fst)
  let sndYear = Js.Date.getFullYear(snd)

  fstYear -. sndYear
}

let differenceInYears = (fst, snd) => {
  let diff = ReDate_month.differenceInMonths(fst, snd) /. 12.
  diff > 0. ? Js.Math.floor_float(diff) : Js.Math.ceil_float(diff)
}
