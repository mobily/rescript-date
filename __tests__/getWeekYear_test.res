open Jest

open Js.Date

describe("getWeekYear", () => {
  open ExpectJs

  test("returns the local week-numbering year of the given date", () => {
    let date = makeWithYMD(~year=2019., ~month=11., ~date=29., ())

    let result = date->ReDate.getWeekYear

    result |> expect |> toEqual(2020.)
  })

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMD(~year=2019., ~month=11., ~date=23., ())
    let getWeekYear = ReDate.getWeekYear(~weekStartsOn=Monday)

    let result = date->getWeekYear

    result |> expect |> toEqual(2019.)
  })
})
