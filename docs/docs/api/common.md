---
id: common
title: Common
---

### isEqual

Are the given dates equal?

```js
let isEqual: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

fstDate->ReDate.isEqual(sndDate)
```

### isBefore

Is the first date before the second one?

```js
let isBefore: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ())

fstDate->ReDate.isBefore(sndDate)
```

### isAfter

Is the first date after the second one?

```js
let isAfter: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ())
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

fstDate->ReDate.isAfter(sndDate)
```

### isFuture

Is the given date in the future?

```js
let isFuture: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2030., ~month=0., ~date=1., ())

date->ReDate.isFuture
```

### isPast

Is the given date in the past?

```js
let isPast: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())

date->ReDate.isPast
```

### compareAsc

Compare the two dates and return 1 if the first date is after the second, -1 if the first date is before the second or 0 if dates are equal.

```js
let compareAsc: (Js.Date.t, Js.Date.t) => int
```

```js
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ())
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ())
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ())

let unsortedArray = [d, b, c, a]

Belt.SortArray.stableSortBy(unsortedArray, ReDate.compareAsc)
```

### compareDesc

Compare the two dates and return -1 if the first date is after the second, 1 if the first date is before the second or 0 if dates are equal.

```js
let compareDesc: (Js.Date.t, Js.Date.t) => int
```

```js
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ())
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ())
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ())

let unsortedArray = [a, b, d, c]

Belt.SortArray.stableSortBy(unsortedArray, ReDate.compareDesc)
```

### max

Return the latest of the given dates.

```js
let max: array<Js.Date.t> => Js.Date.t
```

```js
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ())
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ())
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ())

let dates = [b, c, d, a]

dates->ReDate.max
```

### min

Return the earliest of the given dates.

```js
let min: array<Js.Date.t> => Js.Date.t
```

```js
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ())
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ())
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ())

let dates = [b, c, d, a]

dates->ReDate.min
```

### isValid

Is the given date valid?

```js
let isValid: (~year: float, ~month: float, ~date: float, ~hours: float=?, ~minutes: float=?, ~seconds: float=?, unit) => bool
```

```js
ReDate.isValid(~year=1999., ~month=1., ~date=29., ())
```

### closestTo

Return a date from the array closest to the given date.

```js
let closestTo: (Js.Date.t, array<Js.Date.t>) => option<Js.Date.t>
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())

let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ())
let b = Js.Date.makeWithYMD(~year=2018., ~month=2., ~date=1., ())
let c = Js.Date.makeWithYMD(~year=2020., ~month=4., ~date=1., ())
let d = Js.Date.makeWithYMD(~year=2022., ~month=12., ~date=1., ())

let dates = [a, b, c, d]

date->ReDate.closestTo(dates)
```
