open Jest

open Js.Date

describe("getDaysInYear", () => {
  open ExpectJs

  test("returns the number of days in the year of the given date", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=10., ())

    let result = date->ReDate.getDaysInYear

    result |> expect |> toEqual(365)
  })

  test("works on a leap year", () => {
    let date = makeWithYMD(~year=2020., ~month=1., ~date=10., ())

    let result = date->ReDate.getDaysInYear

    result |> expect |> toEqual(366)
  })
})
