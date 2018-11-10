open Js.Date;

let dayMs = 24 * 60 * 60 * 1000;

let minuteMs = 60 * 1000;

let minMaxReducer = (fn, acc, date) =>
  switch (date->getTime) {
  | ts when acc === None || fn(ts, acc->Belt.Option.getExn) => Some(ts)
  | _ => acc
  };

let retrieveMinMax = value => value->Belt.Option.getExn->fromFloat;

let ascDescComparator = (tuple, firstDate, secondDate) => {
  let (x, y) = tuple;
  switch (firstDate->getTime -. secondDate->getTime) {
  | ts when ts < 0. => x
  | ts when ts > 0. => y
  | _ => 0
  };
};

let makeYMDWithResetHMS = makeWithYMDHMS(~hours=0., ~minutes=0., ~seconds=0.);

/* based on: https://github.com/date-fns/date-fns/blob/master/src/_lib/getTimezoneOffsetInMilliseconds/index.js */
let getTimezoneOffsetInMilliseconds = date =>
  date->getTimezoneOffset
  *. minuteMs->float_of_int
  +. (date->setSecondsMs(~seconds=0., ~milliseconds=0., ())->int_of_float mod minuteMs)->float_of_int;
