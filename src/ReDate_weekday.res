open ReDate_types
open ReDate_utils

let getDay = date => date->Js.Date.getDay->int_of_float->toDayMagic
let isSunday = is(Sunday)
let isMonday = is(Monday)
let isTuesday = is(Tuesday)
let isWednesday = is(Wednesday)
let isThursday = is(Thursday)
let isFriday = is(Friday)
let isSaturday = is(Saturday)
let isWeekend = date => is(Saturday, date) || is(Sunday, date)
let isWeekDay = (date, weekday) => is(weekday, date)
