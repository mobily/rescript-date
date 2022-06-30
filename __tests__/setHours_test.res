open Jest

open Js.Date

describe("setHours", () => {
  open ExpectJs

  test("sets the hours of the given date", () => {
    let date = makeWithYMDH(~year=2018., ~month=0., ~date=1., ~hours=18., ())
    let expectedDate = makeWithYMDH(~year=2018., ~month=0., ~date=1., ~hours=9., ())

    let result = date->ReDate.setHours(9.)

    result |> expect |> toEqual(expectedDate)
  })
})
