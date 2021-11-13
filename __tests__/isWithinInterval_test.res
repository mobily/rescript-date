open Jest

open Js.Date

describe("isWithinInterval", () => {
  open ExpectJs

  let interval: ReDate.interval = {
    start: makeWithYMD(~year=2018., ~month=0., ~date=1., ()),
    end_: makeWithYMD(~year=2018., ~month=0., ~date=10., ()),
  }

  test("returns true if the given date in within the given interval", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=5., ())

    let result = date->ReDate.isWithinInterval(interval)

    result |> expect |> toBeTruthy
  })

  test("returns true if the given date has same time as the left boundary of the interval", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=5., ())

    let result = date->ReDate.isWithinInterval(interval)

    result |> expect |> toBeTruthy
  })

  test("returns true if the given date has same time as the right boundary of the interval", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=10., ())

    let result = date->ReDate.isWithinInterval(interval)

    result |> expect |> toBeTruthy
  })

  test("returns true if the given date and the both boundaries are the same", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=10., ())
    let interval: ReDate.interval = {
      start: makeWithYMD(~year=2018., ~month=0., ~date=10., ()),
      end_: makeWithYMD(~year=2018., ~month=0., ~date=10., ()),
    }

    let result = date->ReDate.isWithinInterval(interval)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is outside of the interval", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=20., ())

    let result = date->ReDate.isWithinInterval(interval)

    result |> expect |> toBeFalsy
  })
})
