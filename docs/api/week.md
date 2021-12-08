---
id: week
title: Week
---

```js
type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
```

### addWeeks

Add the specified number of week to the given date.

```js
let addWeeks: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.addWeeks(1.)
```

### subWeeks

Subtract the specified number of weeks from the given date.

```js
let subWeeks: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=8., ())

date->ReDate.subWeeks(1.)
```

### differenceInWeeks

Get the number of full weeks between the given dates.

```js
let differenceInWeeks: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=7., ~hours=23., ~minutes=59., ~seconds=59., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=0., ~minutes=0., ~seconds=0., ())

fstDate->ReDate.differenceInWeeks(sndDate)
```

### differenceInCalendarWeeks

Get the number of calendar weeks between the given dates.

```js
let differenceInCalendarWeeks: (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=8., ~date=20., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=7., ())

fstDate->ReDate.differenceInCalendarWeeks(sndDate)
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=6., ~date=15., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=5., ~date=20., ())
let differenceInCalendarWeeks = ReDate.differenceInCalendarWeeks(~weekStartsOn=Monday)

fstDate->differenceInCalendarWeeks(sndDate)
```

### startOfWeek

Return the start of a week for the given date.

```js
let startOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.startOfWeek
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())
let startOfWeek = ReDate.startOfWeek(~weekStartsOn=Monday)

date->startOfWeek
```

### endOfWeek

Return the end of a week for the given date.

```js
let endOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.endOfWeek
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())
let endOfWeek = ReDate.endOfWeek(~weekStartsOn=Monday)

date->endOfWeek
```

### isSameWeek

Are the given dates in the same week?

```js
let isSameWeek: (~weekStartsOn: day=?, Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=5., ~hours=10., ~minutes=15., ~seconds=55., ())

fstDate->ReDate.isSameWeek(sndDate)
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=6., ~hours=23., ~minutes=59., ~seconds=59., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=7., ~hours=0., ~minutes=0., ~seconds=0., ())
let isSameWeek = ReDate.isSameWeek(~weekStartsOn=Monday)

fstDate->isSameWeek(sndDate)
```

### lastDayOfWeek

Return the last day of a week for the given date.

```js
let lastDayOfWeek: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.lastDayOfWeek
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())
let lastDayOfWeek = ReDate.lastDayOfWeek(~weekStartsOn=Monday)

date->lastDayOfWeek
```

### getWeekOfMonth

Get the week of the month of the given date.

```js
let getWeekOfMonth: (~weekStartsOn: day=?, Js.Date.t) => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.getWeekOfMonth
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=23., ())
let getWeekOfMonth = ReDate.getWeekOfMonth(~weekStartsOn=Saturday)

date->getWeekOfMonth
```

### getWeeksInMonth

Get the number of calendar weeks the month in the given date spans.

```js
let getWeeksInMonth: (~weekStartsOn: day=?, Js.Date.t) => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=1., ())

date->ReDate.getWeeksInMonth
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=14., ())
let getWeeksInMonth = ReDate.getWeeksInMonth(~weekStartsOn=Friday)

date->getWeeksInMonth
```

### getWeek

Get the local week index of the given date.

```js
let getWeek: (~weekStartsOn: day=?, Js.Date.t) => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=1., ())

date->ReDate.getWeek
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=14., ())
let getWeek = ReDate.getWeek(~weekStartsOn=Monday)

date->getWeek
```
