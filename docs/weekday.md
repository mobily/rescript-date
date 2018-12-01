# Weekday helpers

```reason
type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday;
```

#### is

`let is: (Js.Date.t, day) => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=7., ());

date->ReDate.is(Sunday);
```

#### isSunday

> Is the given date Sunday?

`let isSunday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=7., ());

date->ReDate.isSunday;
```

#### isMonday

> Is the given date Monday?

`let isMonday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=8., ());

date->ReDate.isMonday;
```

#### isTuesday

> Is the given date Tuesday?

`let isTuesday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=9., ());

date->ReDate.isTuesday;
```

#### isWednesday

> Is the given date Wednesday?

`let isWednesday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=10., ());

date->ReDate.isWednesday;
```

#### isThursday

> Is the given date Thursday?

`let isThursday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=11., ());

date->ReDate.isThursday;
```

#### isFriday

> Is the given date Friday?

`let isFriday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ());

date->ReDate.isFriday;
```

#### isSaturday

> Is the given date Saturday?

`let isSaturday: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ());

date->ReDate.isSaturday;
```

#### isWeekend

> Does the given date fall on a weekend?

`let isWeekend: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ());

date->ReDate.isWeekend;
```
