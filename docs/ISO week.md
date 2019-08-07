# ISO week helpers

#### endOfISOWeek

> Return the end of a week for the given date.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let endOfISOWeek: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=10., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.endOfISOWeek;
```

#### getISOWeek

> Get the ISO week of the given date.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let getISOWeek: Js.Date.t => int`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2005., ~month=0., ~date=2., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.getISOWeek;
```

#### isSameISOWeek

> Are the given dates in the same ISO week?
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let isSameISOWeek: (Js.Date.t, Js.Date.t) => bool`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2005., ~month=11., ~date=31., ~hours=16., ~minutes=50., ~seconds=12., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2006., ~month=0., ~date=1., ~hours=10., ~minutes=15., ~seconds=55., ());

fstDate |> ReDate.isSameISOWeek(sndDate);
```

#### isThisISOWeek

> Is the given date in the same ISO week as the current date?
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let isThisISOWeek: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.isThisISOWeek;
```

#### lastDayOfISOWeek

> Return the last day of an ISO week for the given date. The result will be in the local timezone.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let lastDayOfISOWeek: Js.Date.t => bool`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2014., ~month=8., ~date=2., ~hours=11., ~minutes=55., ~seconds=12., ());

date |> ReDate.lastDayOfISOWeek;
```

#### setISOWeek

> Set the ISO week for the given date, preserving the weekday number. A new date will be returned, the original date will not be changed.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let setISOWeek: (Js.Date.t, ~week: int) => Js.Date.t`

```reason
let date = Js.Date.makeWithYMD(~year=2004., ~month=7., ~date=7., ());

date |> ReDate.setISOWeek(~week=53);
```

#### startOfISOWeek

> Return the start of an ISO week for the given date. The result will be in the local timezone.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let startOfISOWeek: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2014., ~month=8., ~date=2., ~hours=11., ~minutes=55., ~seconds=0., ());

date |> ReDate.startOfISOWeek;
```

#### differenceInCalendarISOWeeks

> Get the number of calendar ISO weeks between the given dates.
>
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let differenceInCalendarISOWeeks: (Js.Date.t, Js.Date.t) => int`

```reason
let fstDate = Js.Date.makeWithYMDHMS(~year=2014., ~month=6., ~date=21., ~hours=23., ~minutes=59., ~seconds=59., ());
let sndDate = Js.Date.makeWithYMDHMS(~year=2014., ~month=6., ~date=6., ~hours=0., ~minutes=0., ~seconds=0., ());

fstDate |> ReDate.differenceInCalendarISOWeeks(sndDate);
```
