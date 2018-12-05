# Interval helpers

```reason
type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
};
```

#### isWithinInterval

> Is the given date within the interval?

`let isWithinInterval: (interval, Js.Date.t) => bool`

```reason
let interval = {
  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),
  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),
};
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=5., ());

date |> ReDate.isWithinInterval(interval);
```

#### areIntervalsOverlapping

>  the given time interval overlapping with another time interval?

`let areIntervalsOverlapping: (interval, interval) => bool`

```reason
let interval = {
  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),
  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),
};
let includedInterval = {
  start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
  end_: makeWithYMD(~year=2018., ~month=4., ~date=5., ()),
};

interval |> ReDate.areIntervalsOverlapping(includedInterval);
```

#### getOverlappingDaysInIntervals

> Get the number of days that overlap in two time intervals.

`let getOverlappingDaysInIntervals: (interval, interval) => int`

```reason
let interval = {
  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),
  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),
};
let includedInterval = {
  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
  end_: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=15., ()),
};

interval |> ReDate.getOverlappingDaysInIntervals(includedInterval);
```

#### eachDayOfIntervalArray

> Return the array of dates within the specified time interval.

`let eachDayOfIntervalArray: interval => array(Js.Date.t)`

```reason
let interval = {
  start: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=22., ()),
  end_: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=5., ~hours=8., ~minutes=45., ~seconds=15., ()),
};

interval |> ReDate.eachDayOfIntervalArray;
```

#### eachDayOfIntervalList

> Return the list of dates within the specified time interval.

`let eachDayOfIntervalList: interval => list(Js.Date.t)`

```reason
let interval = {
  start: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=22., ()),
  end_: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=5., ~hours=8., ~minutes=45., ~seconds=15., ()),
};

interval |> ReDate.eachDayOfIntervalList;
```