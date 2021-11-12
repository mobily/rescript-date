---
id: year
title: Year
---

### addYears

Add the specified number of years to the given date.

```js
let addYears: (float, Js.Date.t) => Js.Date.t
```

```js
let date = makeWithYMD(~year=2018., ~month=4., ~date=1., ())

date |> ReDate.addYears(1.)
```

### subYears

Subtract the specified number of years from the given date.

```js
let subYears: (float, Js.Date.t) => Js.Date.t
```

```js
let date = makeWithYMD(~year=2019., ~month=4., ~date=1., ())

date |> ReDate.subYears(1.)
```

### startOfYear

Return the start of a year for the given date.

```js
let startOfYear: Js.Date.t => Js.Date.t
```

```js
let date = makeWithYMD(~year=2018., ~month=5., ~date=1., ())

date |> ReDate.startOfYear
```

### endOfYear

Return the end of a year for the given date.

```js
let endOfYear: Js.Date.t => Js.Date.t
```

```js
let date = makeWithYMD(~year=2018., ~month=8., ~date=10., ())

date |> ReDate.endOfYear
```

### isSameYear

Are the given dates in the same year?

```js
let isSameYear: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = makeWithYMD(~year=2018., ~month=8., ~date=10., ())
let sndDate = makeWithYMD(~year=2018., ~month=6., ~date=20., ())

fstDate |> ReDate.isSameYear(sndDate)
```

### isLeapYear

Is the given date in the leap year?

```js
let isLeapYear: Js.Date.t => bool
```

```js
let date = makeWithYMD(~year=2020., ~month=8., ~date=10., ())

date |> ReDate.isLeapYear
```

### lastMonthOfYear

Return the last month of a year for the given date.

```js
let lastMonthOfYear: Js.Date.t => Js.Date.t
```

```js
let date = makeWithYMD(~year=2018., ~month=8., ~date=10., ())

date |> ReDate.lastMonthOfYear
```

### lastDayOfYear

Return the last day of a year for the given date.

```js
let lastDayOfYear: Js.Date.t => Js.Date.t
```

```js
let date = makeWithYMD(~year=2018., ~month=8., ~date=10., ())

date |> ReDate.lastDayOfYear
```

### getDaysInYear

Get the number of days in a year of the given date.

```js
let getDaysInYear: Js.Date.t => float
```

```js
let date = makeWithYMD(~year=2018., ~month=10., ~date=10., ())

date |> ReDate.getDaysInYear
```

### differenceInCalendarYears

Get the number of calendar years between the given dates.

```js
let differenceInCalendarYears: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = makeWithYMD(~year=2020., ~month=5., ~date=1., ())
let sndDate = makeWithYMD(~year=2018., ~month=1., ~date=1., ())

fstDate |> ReDate.differenceInCalendarYears(sndDate)
```

### differenceInYears

Get the number of full years between the given dates.

```js
let differenceInYears: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
let sndDate = makeWithYMD(~year=2016., ~month=0., ~date=1., ())

fstDate |> ReDate.differenceInYears(sndDate)
```
