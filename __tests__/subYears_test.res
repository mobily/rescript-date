open Jest

open Js.Date

describe("subYears", () => {
  open ExpectJs

  test("subtracts 1 year", () => {
    let date = makeWithYMD(~year=2019., ~month=4., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=4., ~date=1., ())

    let result = date->ReDate.subYears(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 10 years", () => {
    let date = makeWithYMD(~year=2009., ~month=4., ~date=1., ())
    let expectedDate = makeWithYMD(~year=1999., ~month=4., ~date=1., ())

    let result = date->ReDate.subYears(10.)

    result |> expect |> toEqual(expectedDate)
  })
})
