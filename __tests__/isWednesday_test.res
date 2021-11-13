open Jest

open Js.Date

describe("isWednesday", () => {
  open ExpectJs

  test("returns true if the given date is Wednesday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=10., ())

    let result = date->ReDate.isWednesday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Wednesday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=11., ())

    let result = date->ReDate.isWednesday

    result |> expect |> toBeFalsy
  })
})
