open Jest

open Js.Date

describe("isSunday", () => {
  open ExpectJs

  test("returns true if the given date is Sunday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=7., ())

    let result = date->ReDate.isSunday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Sunday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=8., ())

    let result = date->ReDate.isSunday

    result |> expect |> toBeFalsy
  })
})
