# Second helpers

#### addSeconds

> Add the specified number of seconds to the given date.

`let addSeconds: (int, Js.Date.t) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date |> ReDate.addSeconds(1);
````

#### subSeconds

> Subtract the specified number of seconds from the given date.

`let subSeconds: (int, Js.Date.t) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

date |> ReDate.subSeconds(1);
```

#### differenceInSeconds

> Get the number of seconds between the given dates.

`let differenceInSeconds: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=40., ~seconds=15., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=0., ());

fstDate |> ReDate.differenceInSeconds(sndDate);
```

#### startOfSecond

> Return the start of a second for the given date.

`let startOfSecond: Js.Date.t => Js.Date.t`

```reason
open Js.Date;

let date =
  setMilliseconds(
    makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ()),
    423.,
  )
  |> fromFloat;
  
date |> ReDate.startOfSecond;
```

#### endOfSecond

> Return the end of a second for the given date.

`let endOfSecond: Js.Date.t => Js.Date.t`

```reason
open Js.Date;

let date =
  setMilliseconds(
    makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ()),
    423.,
  )
  |> fromFloat;
  
date |> ReDate.endOfSecond;
```

#### isSameSecond

> Are the given dates in the same second?

`let isSameSecond: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=23., ~minutes=59., ~seconds=59., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=23., ~minutes=59., ~seconds=58., ());

fstDate |> ReDate.isSameSecond(sndDate)
```