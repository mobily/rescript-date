open ReDate_utils

let getISOWeekYear = date => {
  let year = Js.Date.getFullYear(date)
  let startOfISOWeek = ReDate_week.startOfWeek(~weekStartsOn=Monday)

  let fourthOfJanuaryOfNextYear =
    Js.Date.setFullYearMD(Js.Date.fromFloat(0.), ~year=year +. 1., ~month=0., ~date=4., ())
    ->Js.Date.fromFloat
    ->makeStartOfDayDate
  let startOfNextYear = startOfISOWeek(fourthOfJanuaryOfNextYear)

  let fourthOfJanuaryOfThisYear =
    Js.Date.setFullYear(
      fourthOfJanuaryOfNextYear->Js.Date.getTime->Js.Date.fromFloat,
      year,
    )->Js.Date.fromFloat
  let startOfThisYear = startOfISOWeek(fourthOfJanuaryOfThisYear)

  if Js.Date.getTime(date) >= Js.Date.getTime(startOfNextYear) {
    year +. 1.
  } else if Js.Date.getTime(date) >= Js.Date.getTime(startOfThisYear) {
    year
  } else {
    year -. 1.
  }
}

let startOfISOWeekYear = date => {
  let year = getISOWeekYear(date)

  let fourthOfJanuary = Js.Date.fromFloat(0.)
  let fourthOfJanuary =
    Js.Date.setFullYearMD(fourthOfJanuary, ~year, ~month=0., ~date=4., ())
    ->Js.Date.fromFloat
    ->makeStartOfDayDate

  ReDate_week.startOfWeek(~weekStartsOn=Monday, fourthOfJanuary)
}
