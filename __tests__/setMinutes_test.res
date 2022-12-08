open Jest

open Js.Date

describe("setMinutes", () => {
  open ExpectJs

  test("sets the minutes of the given date", () => {
    let date = makeWithYMDHM(~year=2018., ~month=0., ~date=1., ~hours=18., ~minutes=1., ())
    let expectedDate = makeWithYMDHM(~year=2018., ~month=0., ~date=1., ~hours=18., ~minutes=30., ())

    let result = date->ReDate.setMinutes(30.)

    result |> expect |> toEqual(expectedDate)
  })
})
