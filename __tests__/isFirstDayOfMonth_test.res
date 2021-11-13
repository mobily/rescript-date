open Jest

open Js.Date

describe("isFirstDayOfMonth", () => {
  open ExpectJs

  test("returns true if the given date is in the last day of month", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.isFirstDayOfMonth

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not in the last day of month", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = date->ReDate.isFirstDayOfMonth

    result |> expect |> toBeFalsy
  })
})
