---
id: day
title: Day
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

### addDays

Add the specified number of days to the given date.

```js
let addDays: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.addDays(5.)
```

### addBusinessDays

Add the specified number of business days to the given date (excluding weekends).

```js
let addBusinessDays: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.addBusinessDays(5.)
```

### subDays

Subtract the specified number of days from the given date.

```js
let subDays: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.subDays(5.)
```

### getDate

Get the day of the month of the given date.

```js
let getDate: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.getDate
```

### setDate

Set the day of the month to the given date.

```js
let setDate: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.setDate(23.)
```

### startOfDay

Return the start of a day for the given date.

```js
let startOfDay: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.startOfDay
```

### endOfDay

Return the end of a day for the given date.

```js
let endOfDay: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.endOfDay
```

### differenceInCalendarDays

Get the number of calendar days between the given dates. This means that the times are removed from the dates and then the difference in days is calculated.

```js
let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2019., ~month=0., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

fstDate->ReDate.differenceInCalendarDays(sndDate)
```

### differenceInDays

Get the number of full day periods between the given dates.

```js
let differenceInDays: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=10., ~hours=10., ~minutes=15., ~seconds=55., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=2., ~hours=20., ~minutes=50., ~seconds=10., ())

fstDate->ReDate.differenceInDays(sndDate)
```

### differenceInBusinessDays

Get the number of full day periods between the given dates.

```js
let differenceInBusinessDays: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=10., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ())

fstDate->ReDate.differenceInBusinessDays(sndDate)
```

### getDayOfYear

Get the day of the year of the given date.

```js
let getDayOfYear: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=23., ())

date->ReDate.getDayOfYear
```

### isSameDay

Are the given dates in the same day?

```js
let isSameDay: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=10., ~minutes=15., ~seconds=55., ())

fstDate->ReDate.isSameDay(sndDate)
```

### isToday

Is the given date today?

```js
let isToday: Js.Date.t => bool
```

```js
let date = Js.Date.make()

date->ReDate.isToday
```

### isTomorrow

Is the given date tomorrow?

```js
let isTomorrow: Js.Date.t => bool
```

```js
let date = Js.Date.make()

date->ReDate.addDays(.1)->ReDate.isTomorrow
```

### isYesterday

Is the given date yesterday?

```js
let isYesterday: Js.Date.t => bool
```

```js
let date = Js.Date.make()

date->ReDate.subDays(1.)->ReDate.isYesterday
```
