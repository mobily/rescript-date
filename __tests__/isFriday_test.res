open Jest

open Js.Date

describe("isFriday", () => {
  open ExpectJs

  test("returns true if the given date is Friday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=12., ())

    date |> ReDate.isFriday |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Friday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=13., ())

    date |> ReDate.isFriday |> expect |> toBeFalsy
  })
})
