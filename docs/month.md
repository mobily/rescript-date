# Month helpers

#### addMonths

> Add the specified number of months to the given date.

`let addMonths: (int, Js.Date.t) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

date |> ReDate.addMonths(1);
```

#### subMonths

> Subtract the specified number of months from the given date.

`let subMonths: (int, Js.Date.t) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=1., ~date=1., ());

date |> ReDate.subMonths(1);
```

#### differenceInCalendarMonths

> Get the number of calendar months between the given dates.

`let differenceInCalendarMonths: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2019., ~month=5., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=1., ~date=1., ());

fstDate |> ReDate.differenceInCalendarMonths(sndDate);
```

#### differenceInMonths

> Get the number of full months between the given dates.

`let differenceInMonths: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=6., ~date=31., ());

fstDate |> ReDate.differenceInMonths(sndDate);
```

#### startOfMonth

> Return the start of a month for the given date.

`let startOfMonth: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=24., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.startOfMonth;
```

#### endOfMonth

> Return the end of a month for the given date.

`let endOfMonth: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=24., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.endOfMonth;
```

#### isFirstDayOfMonth

> Is the given date the first day of a month?

`let isFirstDayOfMonth: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

date |> ReDate.isFirstDayOfMonth;
```

#### isLastDayOfMonth

> Is the given date the last day of a month?

`let isLastDayOfMonth: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=31., ());

date |> ReDate.isLastDayOfMonth;
```

#### isSameMonth

> Are the given dates in the same month?

`let isSameMonth: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=24., ());

fstDate |> ReDate.isSameMonth(sndDate);
```

#### lastDayOfMonth

> Return the last day of a month for the given date.

`let lastDayOfMonth: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ());

date |> ReDate.lastDayOfMonth;
```

#### getDaysInMonth

> Get the number of days in a month of the given date.

`let getDaysInMonth: Js.Date.t => int`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=10., ());

date |> ReDate.getDaysInMonth;
```

#### getWeekOfMonth

> Get the week of the month of the given date.

`let getWeekOfMonth: (~weekStartsOn: day=?, Js.Date.t) => int`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

date |> ReDate.getWeekOfMonth;
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=23., ());
let getWeekOfMonth' = ReDate.getWeekOfMonth(~weekStartsOn=Saturday);

date |> getWeekOfMonth';
```

#### getWeeksInMonth

> Get the number of calendar weeks the month in the given date spans.

`let getWeeksInMonth: (~weekStartsOn: day=?, Js.Date.t) => int`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=1., ());

date |> ReDate.getWeeksInMonth;
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=14., ());
let getWeeksInMonth' = ReDate.getWeeksInMonth(~weekStartsOn=Friday);

date |> getWeeksInMonth';
```
