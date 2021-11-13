open Jest

open Js.Date

describe("isFriday", () => {
  open ExpectJs

  test("returns true if the given date is Friday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=12., ())

    let result = date->ReDate.isFriday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Friday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=13., ())

    let result = date->ReDate.isFriday

    result |> expect |> toBeFalsy
  })
})
