# Common helpers

#### isEqual

> Are the given dates equal?

`let isEqual: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

fstDate->ReDate.isEqual(sndDate)
```

#### isBefore

> Is the first date before the second one?

`let isBefore: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ());

fstDate->ReDate.isBefore(sndDate)
```

#### isAfter

> Is the first date after the second one?

`let isAfter: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ());
let sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ());

fstDate->ReDate.isAfter(sndDate)
```

#### isFuture

> Is the given date in the future?

`let isFuture: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=2030., ~month=0., ~date=1., ());

date->ReDate.isFuture;
```

#### isPast

> Is the given date in the past?

`let isPast: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());

date->ReDate.isPast;
```

#### compareAsc

> Compare the two dates and return 1 if the first date is after the second, -1 if the first date is before the second or 0 if dates are equal.

`let compareAsc: (Js.Date.t, Js.Date.t) => int`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let unsortedArray = [|d, b, c, a|];

unsortedArray->Belt.SortArray.stableSortBy(ReDate.compareAsc);
```

#### compareDesc

> Compare the two dates and return -1 if the first date is after the second, 1 if the first date is before the second or 0 if dates are equal.

`let compareDesc: (Js.Date.t, Js.Date.t) => int`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let unsortedArray = [|a, b, d, c|];

unsortedArray->Belt.SortArray.stableSortBy(ReDate.compareDesc);
```

#### maxOfArray

> Return the latest of the given dates (Array).

`let maxOfArray: array(Js.Date.t) => Js.Date.t`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let dates = [|b, c, d, a|];

dates->ReDate.maxOfArray;
```

#### maxOfList

> Return the latest of the given dates (List).

`let maxOfList: list(Js.Date.t) => Js.Date.t`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let dates = [b, c, d, a];

dates->ReDate.maxOfList;
```

#### minOfArray

> Return the earliest of the given dates (Array).

`let minOfArray: array(Js.Date.t) => Js.Date.t`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let dates = [|b, c, d, a|];

dates->ReDate.minOfArray;
```

#### minOfList

> Return the earliest of the given dates (List).

`let minOfList: list(Js.Date.t) => Js.Date.t`

```reason
let a = Js.Date.makeWithYMD(~year=1999., ~month=0., ~date=1., ());
let b = Js.Date.makeWithYMD(~year=2017., ~month=2., ~date=1., ());
let c = Js.Date.makeWithYMD(~year=2017., ~month=4., ~date=1., ());
let d = Js.Date.makeWithYMD(~year=2018., ~month=12., ~date=1., ());

let dates = [b, c, d, a];

dates->ReDate.minOfList;
```

#### isValid

> Is the given date valid?

`let isValid: (~year: float, ~month: float, ~date: float, ~hours: float=?, ~minutes: float=?, ~seconds: float=?, unit) => bool`

```reason
ReDate.isValid(~year=1999., ~month=1., ~date=29., ());
```
