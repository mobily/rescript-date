open Jest

open Js.Date

describe("addDays", () => {
  open ExpectJs

  test("adds 1 day", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = date->ReDate.addDays(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("adds 100 days", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=3., ~date=11., ())

    let result = date->ReDate.addDays(100.)

    result |> expect |> toEqual(expectedDate)
  })
})
