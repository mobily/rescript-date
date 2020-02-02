# ISO year helpers

#### getISOWeekYear

> Get the ISO week-numbering year of the given date, which always starts 3 days before the year's first Thursday.
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let getISOWeekYear: Js.Date.t => float`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.getISOWeekYear;
```

#### startOfISOWeekYear

> Return the start of an ISO week-numbering year, which always starts 3 days before the year's first Thursday. The result will be in the local timezone.
> ISO week-numbering year: http://en.wikipedia.org/wiki/ISO_week_date

`let startOfISOWeekYear: Js.Date.t => Js.Date.t`

```reason
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());

date |> ReDate.startOfISOWeekYear;
```
