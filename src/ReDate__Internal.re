open Js.Date;

let dayMs = 24 * 60 * 60 * 1000;

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
