---
id: hour
title: Hour
---

### addHours

Add the specified number of hours to the given date.

```js
let addHours: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.addHours(1.);
```

### subHours

Subtract the specified number of hours from the given date.

```js
let subHours: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.subHours(1.);
```

### getHours

Get the hours of the given date.

```js
let getHours: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=30., ());

date->ReDate.getHours
```

### setHours

Set the hours to the given date.

```js
let setHours: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.setHours(18.)
```

### differenceInHours

Get the number of hours between the given dates.

```js
let differenceInHours: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=40., ~seconds=15., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=10., ~minutes=30., ~seconds=0., ());

fstDate->ReDate.differenceInHours(sndDate);
```

### startOfHour

Return the start of an hour for the given date.

```js
let startOfHour: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());

date->ReDate.startOfHour;
```

### endOfHour

Return the end of an hour for the given date.

```js
let endOfHour: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());

date->ReDate.endOfHour;
```

### isSameHour

Are the given dates in the same hour?

```js
let isSameHour: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=0., ~seconds=0., ());

fstDate->ReDate.isSameHour(sndDate);
```
