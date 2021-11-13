open Jest

open Js.Date

describe("isMonday", () => {
  open ExpectJs

  test("returns true if the given date is Monday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=8., ())

    let result = date->ReDate.isMonday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Monday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=9., ())

    let result = date->ReDate.isMonday

    result |> expect |> toBeFalsy
  })
})
