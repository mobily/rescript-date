open Jest

open Js.Date

describe("getISOWeek", () => {
  open ExpectJs

  test("returns the ISO week of the given date", () => {
    let date = makeWithYMD(~year=2005., ~month=0., ~date=2., ())

    let result = date->ReDate.getISOWeek

    result |> expect |> toEqual(53.)
  })

  test("returns the ISO week at 1 January 2016", () => {
    let date = makeWithYMD(~year=2016., ~month=0., ~date=1., ())

    let result = date->ReDate.getISOWeek

    result |> expect |> toEqual(53.)
  })

  test("returns the ISO week at 1 May 2016", () => {
    let date = makeWithYMD(~year=2016., ~month=4., ~date=1., ())

    let result = date->ReDate.getISOWeek

    result |> expect |> toEqual(17.)
  })

  test("returns the ISO week at 2 May 2016", () => {
    let date = makeWithYMD(~year=2016., ~month=4., ~date=2., ())

    let result = date->ReDate.getISOWeek

    result |> expect |> toEqual(18.)
  })

  test("returns the ISO week at 31 May 2016", () => {
    let date = makeWithYMD(~year=2016., ~month=4., ~date=31., ())

    let result = date->ReDate.getISOWeek

    result |> expect |> toEqual(22.)
  })
})
