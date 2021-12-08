open Jest

open Js.Date

describe("isWeekDay", () => {
  open ExpectJs

  test("returns true if the given day of the week equals to the provided day", () => {
    let date = makeWithYMD(~year=2021., ~month=11., ~date=10., ())

    let result = date->ReDate.isWeekDay(ReDate.Friday)

    result |> expect |> toBeTruthy
  })

  test("returns true if the given day of the week does not equal to the provided day", () => {
    let date = makeWithYMD(~year=2021., ~month=11., ~date=11., ())

    let result = date->ReDate.isWeekDay(ReDate.Friday)

    result |> expect |> toBeFalsy
  })
})
