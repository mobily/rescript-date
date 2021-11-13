---
id: iso-week-numbering
title: ISO Week Numbering
---

:::info
ISO week date: http://en.wikipedia.org/wiki/ISO_week_date
:::

### getISOWeekYear

Get the ISO week-numbering year of the given date, which always starts 3 days before the year's first Thursday.

```js
let getISOWeekYear: Js.Date.t => float
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.getISOWeekYear
```

### startOfISOWeekYear

Return the start of an ISO week-numbering year, which always starts 3 days before the year's first Thursday. The result will be in the local timezone.

```js
let startOfISOWeekYear: Js.Date.t => Js.Date.t
```

```js
let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())

date->ReDate.startOfISOWeekYear
```
