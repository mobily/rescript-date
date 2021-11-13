open Jest

open Js.Date

describe("isThursday", () => {
  open ExpectJs

  test("returns true if the given date is Thursday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=11., ())

    let result = date->ReDate.isThursday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Thursday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=12., ())

    let result = date->ReDate.isThursday

    result |> expect |> toBeFalsy
  })
})
