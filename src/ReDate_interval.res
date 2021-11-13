open ReDate_types
open ReDate_utils

let isWithinInterval = (date, interval) => {
  let timestamp = Js.Date.getTime(date)
  timestamp >= Js.Date.getTime(interval.start) && timestamp <= Js.Date.getTime(interval.end_)
}

let areIntervalsOverlapping = (left, right) =>
  Js.Date.getTime(left.start) < Js.Date.getTime(right.end_) &&
    Js.Date.getTime(right.start) < Js.Date.getTime(left.end_)

let getOverlappingDaysInIntervals = (left, right) => {
  switch (
    Js.Date.getTime(left.start),
    Js.Date.getTime(left.end_),
    Js.Date.getTime(right.start),
    Js.Date.getTime(right.end_),
  ) {
  | (leftStart, leftEnd, rightStart, rightEnd) if leftStart < rightEnd && rightStart < leftEnd =>
    let overlapStartTime = rightStart < leftStart ? leftStart : rightStart
    let overlapEndTime = rightEnd > leftEnd ? leftEnd : rightEnd
    let overlap = (overlapEndTime -. overlapStartTime) /. Milliseconds.day

    overlap->Js.Math.ceil_float
  | _ => 0.
  }
}

let eachDayOfInterval = interval => {
  let intervalDays = ReDate_day.differenceInCalendarDays(interval.end_, interval.start)

  Belt.Array.makeBy(intervalDays->int_of_float->succ, index =>
    interval.start->makeStartOfDayDate->ReDate_day.addDays(float_of_int(index))
  )
}
