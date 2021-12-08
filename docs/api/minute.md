---
id: minute
title: Minute
---

### addMinutes

Add the specified number of minutes to the given date.

```js
let addMinutes: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=30., ())

date->ReDate.addMinutes(1)
```

### subMinutes

Subtract the specified number of minutes from the given date.

```js
let subMinutes: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=30., ())

date->ReDate.subMinutes(1)
```

### getMinutes

Get the minutes of the given date.

```js
let getMinutes: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=30., ());

date->ReDate.getMinutes
```

### setMinutes

Set the minutes to the given date.

```js
let setMinutes: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.setMinutes(30.)
```

### differenceInMinutes

Get the number of minutes between the given dates.

```js
let differenceInMinutes: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=40., ~seconds=15., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ())

fstDate->ReDate.differenceInMinutes(sndDate)
```

### startOfMinute

Return the start of a minute for the given date.

```js
let startOfMinute: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=8., ~minutes=20., ~seconds=35., ())

date->ReDate.startOfMinute
```

### endOfMinute

Return the end of a minute for the given date.

```js
let endOfMinute: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=8., ~minutes=20., ~seconds=35., ())

date->ReDate.endOfMinute
```

### isSameMinute

Are the given dates in the same minute?

```js
let isSameMinute: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=19., ~minutes=6., ~seconds=10., ())
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=19., ~minutes=6., ~seconds=35., ())

fstDate->ReDate.isSameMinute(sndDate)
```

### roundToNearestMinute

Rounds the given date to the nearest minute.

```js
let roundToNearestMinute: (~nearestTo: float=?, Js.Date.t) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=19., ~minutes=6., ~seconds=31., ())

date->ReDate.roundToNearestMinute
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=19., ~minutes=12., ~seconds=10., ())
let roundToNearest15Minute = ReDate.roundToNearestMinute(~nearestTo=15.)

date->roundToNearest15Minute
```
