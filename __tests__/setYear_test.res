open Jest

open Js.Date

describe("setYear", () => {
  open ExpectJs

  test("sets the year of the given date", () => {
    let date = makeWithYM(~year=2018., ~month=0., ())
    let expectedDate = makeWithYM(~year=2042., ~month=0., ())

    let result = date->ReDate.setYear(2042.)

    result |> expect |> toEqual(expectedDate)
  })
})
