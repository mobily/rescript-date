open Jest

open Js.Date

describe("areIntervalsOverlapping", () => {
  open ExpectJs
  open ReDate

  let interval = {
    start: makeWithYMD(~year=2018., ~month=3., ~date=1., ()),
    end_: makeWithYMD(~year=2018., ~month=4., ~date=10., ()),
  }

  test("returns true for an interval included within another interval", () => {
    let includedInterval = {
      start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
      end_: makeWithYMD(~year=2018., ~month=4., ~date=5., ()),
    }

    interval |> ReDate.areIntervalsOverlapping(includedInterval) |> expect |> toBeTruthy
  })

  test("returns true for an interval including another interval", () => {
    let includingInterval = {
      start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
      end_: makeWithYMD(~year=2018., ~month=4., ~date=5., ()),
    }

    includingInterval |> ReDate.areIntervalsOverlapping(interval) |> expect |> toBeTruthy
  })

  test("returns false for a valid non overlapping interval before another interval", () => {
    let earlierInterval = {
      start: makeWithYMD(~year=2018., ~month=2., ~date=20., ()),
      end_: makeWithYMD(~year=2018., ~month=2., ~date=30., ()),
    }

    earlierInterval |> ReDate.areIntervalsOverlapping(interval) |> expect |> toBeFalsy
  })

  test("returns false for a valid non overlapping interval after another interval", () => {
    let laterInterval = {
      start: makeWithYMD(~year=2018., ~month=4., ~date=11., ()),
      end_: makeWithYMD(~year=2018., ~month=4., ~date=30., ()),
    }

    laterInterval |> ReDate.areIntervalsOverlapping(interval) |> expect |> toBeFalsy
  })
})
