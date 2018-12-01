# Hour helpers

#### addHours

> Add the specified number of hours to the given date.

`let addHours: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.addHours(1)l
```

#### subHours

> Subtract the specified number of hours from the given date.

`let subHours: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.subHours(1);
```

#### differenceInHours

> Get the number of hours between the given dates.

`let differenceInHours: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=40., ~seconds=15., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=10., ~minutes=30., ~seconds=0., ());

fstDate->ReDate.differenceInHours(sndDate);
```

#### startOfHour

> Return the start of an hour for the given date.

`let startOfHour: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());

date->ReDate.startOfHour;
```

#### endOfHour

> Return the end of an hour for the given date.

`let endOfHour: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());

date->ReDate.endOfHour;
```

#### isSameHour

> Are the given dates in the same hour?

`let isSameHour: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=0., ~seconds=0., ());

fstDate->ReDate.isSameHour(sndDate);
```
