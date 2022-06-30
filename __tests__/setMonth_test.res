open Jest

open Js.Date

describe("setMonth", () => {
  open ExpectJs

  test("sets the month of the given date", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=10., ~date=1., ())

    let result = date->ReDate.setMonth(10.)

    result |> expect |> toEqual(expectedDate)
  })
})
