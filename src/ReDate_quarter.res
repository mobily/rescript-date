let getQuarter = (date: Js.Date.t): int => {
  let month = Js.Date.getMonth(date)
  switch month {
  | _ if month >= 0.0 && month <= 2.0 => 1
  | _ if month >= 3.0 && month <= 5.0 => 2
  | _ if month >= 6.0 && month <= 8.0 => 3
  | _ => 4
  }
}
