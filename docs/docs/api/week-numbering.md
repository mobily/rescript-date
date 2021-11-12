---
id: week-numbering
title: Week Numbering
---

```js
type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
```

### getWeekYear

Get the local week-numbering year of the given date.

```js
let getWeekYear: (~weekStartsOn: day=?, Js.Date.t) => float
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ())

date |> ReDate.getWeekYear
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=14., ())
let getWeekYear = ReDate.getWeekYear(~weekStartsOn=Monday)

date |> getWeekYear
```

### startOfWeekYear

Return the start of a local week-numbering year.

```js
let startOfWeekYear: (~weekStartsOn: day=?, Js.Date.t) => Js.Date.t
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ())

date |> ReDate.startOfWeekYear
```

```reason
let date = Js.Date.makeWithYMD(~year=2018., ~month=10., ~date=14., ())
let startOfWeekYear = ReDate.startOfWeekYear(~weekStartsOn=Monday)

date |> startOfWeekYear
```
