open ReDate_types
open ReDate_utils

let isSunday = is(Sunday)
let isMonday = is(Monday)
let isTuesday = is(Tuesday)
let isWednesday = is(Wednesday)
let isThursday = is(Thursday)
let isFriday = is(Friday)
let isSaturday = is(Saturday)
let isWeekend = date => is(Saturday, date) || is(Sunday, date)

let isWeekDay = (date, weekday) => is(weekday, date)

external to_day_magic : int => ReDate_types.day = "%identity"

let getWeekDay = (date) => {
  /*
  // nice code, but poor js output
  switch Js.Date.getDay(date) {
  | 0. => Sunday
  | 1. => Monday
  | 2. => Tuesday
  | 3. => Wednesday
  | 4. => Thursday
  | 5. => Friday
  | _  => Saturday
  }
  */
  // tricky code, but better js output
  let weekDayNum = int_of_float(Js.Date.getDay(date))
  to_day_magic(weekDayNum)
}
