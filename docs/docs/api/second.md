---
id: second
title: Second
---

### addSeconds

Add the specified number of seconds to the given date.

```js
let addSeconds: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.addSeconds(1.);
```

### subSeconds

Subtract the specified number of seconds from the given date.

```js
let subSeconds: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.subSeconds(1.);
```

### getSeconds

Get the seconds of the given date.

```js
let getSeconds: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=30., ());

date->ReDate.getSeconds
```

### setSeconds

Set the seconds to the given date.

```js
let setSeconds: (Js.Date.t, float) => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date->ReDate.setSeconds(30.)
```

### differenceInSeconds

Get the number of seconds between the given dates.

```js
let differenceInSeconds: (Js.Date.t, Js.Date.t) => float
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=40., ~seconds=15., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

fstDate->ReDate.differenceInSeconds(sndDate);
```

### startOfSecond

Return the start of a second for the given date.

```js
let startOfSecond: Js.Date.t => Js.Date.t
```

```js
let date =
  Js.Date.setMilliseconds(
    Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ()),
    423.,
  )
 ->fromFloat;

date->ReDate.startOfSecond;
```

### endOfSecond

Return the end of a second for the given date.

```js
let endOfSecond: Js.Date.t => Js.Date.t
```

```js
let date =
  Js.Date.setMilliseconds(
    Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ()),
    423.,
  )
 ->fromFloat;

date->ReDate.endOfSecond;
```

### isSameSecond

Are the given dates in the same second?

```js
let isSameSecond: (Js.Date.t, Js.Date.t) => bool
```

```js
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=23., ~minutes=59., ~seconds=59., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=23., ~minutes=59., ~seconds=58., ());

fstDate->ReDate.isSameSecond(sndDate)
```
