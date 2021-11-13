open Jest

open Js.Date

describe("isSaturday", () => {
  open ExpectJs

  test("returns true if the given date is Saturday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=13., ())

    let result = date->ReDate.isSaturday

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date is not Saturday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=14., ())

    let result = date->ReDate.isSaturday

    result |> expect |> toBeFalsy
  })
})
