open Jest

open Js.Date

describe("subWeeks", () => {
  open ExpectJs

  test("subtracts 1 week", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=8., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.subWeeks(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 10 weeks", () => {
    let date = makeWithYMD(~year=2018., ~month=2., ~date=12., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.subWeeks(10.)

    result |> expect |> toEqual(expectedDate)
  })
})
