open Jest

open Js.Date

describe("getISOWeekYear", () => {
  open ExpectJs

  test("returns the ISO week-numbering year of the given date", () => {
    let date = makeWithYMD(~year=2007., ~month=11., ~date=31., ())

    date |> ReDate.getISOWeekYear |> expect |> toEqual(2008.)
  })
})
