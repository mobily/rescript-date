open Jest

open Js.Date

describe("getWeek", () => {
  open ExpectJs

  test("returns the local week of year of the given date", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=5., ())

    let result = date->ReDate.getWeek

    result |> expect |> toEqual(2.)
  })

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=5., ())
    let getWeek = ReDate.getWeek(~weekStartsOn=Monday)

    let result = date->getWeek

    result |> expect |> toEqual(1.)
  })
})
