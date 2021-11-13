open ReDate_utils
open ReDate_types

let getWeekYear = (~weekStartsOn=Sunday, date) => {
  let year = Js.Date.getFullYear(date)
  let nextYear = year +. 1.
  let current = year->makeStartOfYearDate->startOfWeek(~weekStartsOn)
  let next = nextYear->makeStartOfYearDate->startOfWeek(~weekStartsOn)

  if Js.Date.getTime(date) >= Js.Date.getTime(next) {
    nextYear
  } else if Js.Date.getTime(date) >= Js.Date.getTime(current) {
    year
  } else {
    year -. 1.
  }
}

let startOfWeekYear = (~weekStartsOn=Sunday, date) => {
  let year = getWeekYear(~weekStartsOn, date)
  year->makeStartOfYearDate->startOfWeek(~weekStartsOn)
}
