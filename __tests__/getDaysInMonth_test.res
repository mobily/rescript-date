open Jest

open Js.Date

describe("getDaysInMonth", () => {
  open ExpectJs

  test("returns the number of days in the month of the given date", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=10., ())

    let result = date->ReDate.getDaysInMonth

    result |> expect |> toEqual(30.)
  })

  test("works for the February of a leap year", () => {
    let date = makeWithYMD(~year=2004., ~month=1., ~date=10., ())

    let result = date->ReDate.getDaysInMonth

    result |> expect |> toEqual(29.)
  })
})
