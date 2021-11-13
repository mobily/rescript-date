open Jest

open Js.Date

describe("subDays", () => {
  open ExpectJs

  test("subtracts 1 day", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=2., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.subDays(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 100 days", () => {
    let date = makeWithYMD(~year=2018., ~month=3., ~date=11., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.subDays(100.)

    result |> expect |> toEqual(expectedDate)
  })
})
