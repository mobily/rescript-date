open Jest

open Js.Date

describe("getWeeksInMonth", () => {
  open ExpectJs

  test("returns the number of calendar weeks the month in the given date spans", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=1., ())

    let result = date->ReDate.getWeeksInMonth

    result |> expect |> toEqual(5.)
  })

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=14., ())
    let getWeeksInMonth = ReDate.getWeeksInMonth(~weekStartsOn=Friday)

    let result = date->getWeeksInMonth

    result |> expect |> toEqual(6.)
  })
})
