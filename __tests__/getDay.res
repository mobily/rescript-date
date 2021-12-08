open Jest

open Js.Date

describe("getDay", () => {
  open ExpectJs

  test("returns the day of the week of the given date", () => {
    let date = makeWithYMD(~year=2021., ~month=11., ~date=10., ())

    let result = date->ReDate.getDay

    result |> expect |> toEqual(ReDate.Friday)
  })
})
