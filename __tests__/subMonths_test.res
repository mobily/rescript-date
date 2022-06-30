open Jest

open Js.Date

describe("subMonths", () => {
  open ExpectJs

  test("subtracts 1 month", () => {
    let date = makeWithYMD(~year=2018., ~month=1., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.subMonths(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 30 months", () => {
    let date = makeWithYMD(~year=2020., ~month=11., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=5., ~date=1., ())

    let result = date->ReDate.subMonths(30.)

    result |> expect |> toEqual(expectedDate)
  })
})
