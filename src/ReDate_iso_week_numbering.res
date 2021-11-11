open ReDate_utils

let getISOWeekYear = date => {
  let year = Js.Date.getFullYear(date)

  let fourthOfJanuaryOfNextYear =
    Js.Date.setFullYearMD(Js.Date.fromFloat(0.), ~year=year +. 1., ~month=0., ~date=4., ())
    |> Js.Date.fromFloat
    |> makeStartOfDayDate
  let startOfNextYear = ReDate_iso_week.startOfISOWeek(fourthOfJanuaryOfNextYear)

  let fourthOfJanuaryOfThisYear =
    Js.Date.setFullYear(
      fourthOfJanuaryOfNextYear |> Js.Date.getTime |> Js.Date.fromFloat,
      year,
    ) |> Js.Date.fromFloat
  let startOfThisYear = ReDate_iso_week.startOfISOWeek(fourthOfJanuaryOfThisYear)

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
    |> Js.Date.fromFloat
    |> makeStartOfDayDate

  ReDate_iso_week.startOfISOWeek(fourthOfJanuary)
}

let getISOWeek = date => {
  let diff =
    Js.Date.getTime(ReDate_iso_week.startOfISOWeek(date)) -.
    Js.Date.getTime(startOfISOWeekYear(date))

  Js.Math.round(diff /. Milliseconds.week) +. 1.
}

let setISOWeek = (date, ~week) => {
  let diff = getISOWeek(date) -. week
  let day = Js.Date.getDate(date)
  let date = date |> Js.Date.getTime |> Js.Date.fromFloat

  Js.Date.setDate(date, day -. diff *. 7.) |> Js.Date.fromFloat
}
