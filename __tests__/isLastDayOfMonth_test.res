open Jest

open Js.Date

describe("isLastDayOfMonth", () => {
  open ExpectJs

  test("returns true if the given date is in the last day of month", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=31., ())

    let result = date->ReDate.isLastDayOfMonth

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not in the last day of month", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=30., ())

    let result = date->ReDate.isLastDayOfMonth

    result |> expect |> toBeFalsy
  })
})
