
# Day helpers

#### addDays

> Add the specified number of days to the given date.

`let addDays: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());
date->ReDate.addDays(5);
```

#### subDays

> Subtract the specified number of days from the given date.

`let subDays: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());
date->ReDate.subDays(5);
```

#### startOfDay

> Return the start of a day for the given date.

`let startOfDay: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ());
date->ReDate.startOfDay;
```

#### endOfDay

> Return the end of a day for the given date.

`let endOfDay: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ());
date->ReDate.endOfDay;
```

#### differenceInCalendarDays

> Get the number of calendar days between the given dates. This means that the times are removed from the dates and then the difference in days is calculated.

`let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2019., ~month=0., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

fstDate->ReDate.differenceInCalendarDays(sndDate);
```

#### differenceInDays

> Get the number of full day periods between the given dates.

`let differenceInDays: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=10., ~hours=10., ~minutes=15., ~seconds=55., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=2., ~hours=20., ~minutes=50., ~seconds=10., ());

fstDate->ReDate.differenceInDays(sndDate);
```

#### getDayOfYear

> Get the day of the year of the given date.

`let getDayOfYear: Js.Date.t => int`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=23., ());

date->ReDate.getDayOfYear;
```

#### isSameDay

> Are the given dates in the same day?

`let isSameDay: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=10., ~minutes=15., ~seconds=55., ());

fstDate->ReDate.isSameDay(sndDate);
```

#### isToday

> Is the given date today?

`let isToday: Js.Date.t => bool`

```reason
let date = Js.Date.make();
date->ReDate.isToday;
```

#### isTomorrow

> Is the given date tomorrow?

`let isTomorrow: Js.Date.t => bool`

```reason
let date = Js.Date.make();
ReDate.(date->addDays(1)->isTomorrow);
```

#### isYesterday

> Is the given date yesterday?

`let isYesterday: Js.Date.t => bool`

```reason
let date = Js.Date.make();
ReDate.(date->subDays(1)->isYesterday);
```
