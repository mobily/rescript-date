open Jest

open Js.Date

describe("setDate", () => {
  open ExpectJs

  test("sets the date of the given date", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=20., ())

    let result = date->ReDate.setDate(20.)

    result |> expect |> toEqual(expectedDate)
  })
})
