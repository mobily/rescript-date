---
id: weekday
title: Weekday
---

### isSunday

Is the given date Sunday?

```js
let isSunday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=7., ())

date->ReDate.isSunday
```

### isMonday

Is the given date Monday?

```js
let isMonday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=8., ())

date->ReDate.isMonday
```

### isTuesday

Is the given date Tuesday?

```js
let isTuesday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=9., ())

date->ReDate.isTuesday
```

### isWednesday

Is the given date Wednesday?

```js
let isWednesday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=10., ())

date->ReDate.isWednesday
```

### isThursday

Is the given date Thursday?

```js
let isThursday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=11., ())

date->ReDate.isThursday
```

### isFriday

Is the given date Friday?

```js
let isFriday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ())

date->ReDate.isFriday
```

### isSaturday

Is the given date Saturday?

```js
let isSaturday: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ())

date->ReDate.isSaturday
```

### isWeekend

Does the given date fall on a weekend?

```js
let isWeekend: Js.Date.t => bool
```

```js
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ())

date->ReDate.isWeekend
```
