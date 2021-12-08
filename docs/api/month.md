---
id: month
title: Month
---

### addMonths

Add the specified number of months to the given date.

```js
let addMonths: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.addMonths(1.)
```

### subMonths

Subtract the specified number of months from the given date.

```js
let subMonths: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=1., ~date=1., ())

date->ReDate.subMonths(1.)
```

### getMonth

Get the month of the given date.

```js
let getMonth: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMD(~year=2019., ~month=4., ~date=1., ())

date->ReDate.getMonth
```

### setMonth

Set the month to the given date.

```js
let setMonth: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2019., ~month=4., ~date=1., ())

date->ReDate.setMonth(5.)
```

### differenceInCalendarMonths

Get the number of calendar months between the given dates.

```js
let differenceInCalendarMonths: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2019., ~month=5., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=1., ~date=1., ())

fstDate->ReDate.differenceInCalendarMonths(sndDate)
```

### differenceInMonths

Get the number of full months between the given dates.

```js
let differenceInMonths: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=6., ~date=31., ())

fstDate->ReDate.differenceInMonths(sndDate)
```

### startOfMonth

Return the start of a month for the given date.

```js
let startOfMonth: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=24., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.startOfMonth
```

### endOfMonth

Return the end of a month for the given date.

```js
let endOfMonth: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=24., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.endOfMonth
```

### isFirstDayOfMonth

Is the given date the first day of a month?

```js
let isFirstDayOfMonth: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

date->ReDate.isFirstDayOfMonth
```

### isLastDayOfMonth

Is the given date the last day of a month?

```js
let isLastDayOfMonth: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=31., ())

date->ReDate.isLastDayOfMonth
```

### isSameMonth

Are the given dates in the same month?

```js
let isSameMonth: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=24., ())

fstDate->ReDate.isSameMonth(sndDate)
```

### lastDayOfMonth

Return the last day of a month for the given date.

```js
let lastDayOfMonth: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ())

date->ReDate.lastDayOfMonth
```

### getDaysInMonth

Get the number of days in a month of the given date.

```js
let getDaysInMonth: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=10., ())

date->ReDate.getDaysInMonth
```
