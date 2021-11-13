open Jest

open Js.Date

describe("isWeekend", () => {
  open ExpectJs

  test("returns true if the given date is in a weekend (Saturday)", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=13., ())

    let result = date->ReDate.isWeekend

    result |> expect |> toBeTruthy
  })

  test("returns true if the given date is in a weekend (Sunday)", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=14., ())

    let result = date->ReDate.isWeekend

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not in a weekend", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=12., ())

    let result = date->ReDate.isWeekend

    result |> expect |> toBeFalsy
  })
})
