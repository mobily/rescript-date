open Jest

open Js.Date

describe("isLeapYear", () => {
  open ExpectJs

  test("returns true if the given date is a leap year", () => {
    let date = makeWithYMD(~year=2020., ~month=8., ~date=10., ())

    let result = date->ReDate.isLeapYear

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date isn't a leap year", () => {
    let date = makeWithYMD(~year=2018., ~month=8., ~date=10., ())

    let result = date->ReDate.isLeapYear

    result |> expect |> toBeFalsy
  })
})
