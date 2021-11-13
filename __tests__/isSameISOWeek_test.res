open Jest

open Js.Date

describe("isSameISOWeek", () => {
  open ExpectJs

  test("returns true if the given dates have the same ISO week", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=8., ~date=1., ())
    let sndDate = makeWithYMD(~year=2014., ~month=8., ~date=7., ())

    let result = sndDate->ReDate.isSameISOWeek(fstDate)

    result |> expect |> toEqual(true)
  })

  test("returns false if the given dates have different ISO weeks", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=8., ~date=1., ())
    let sndDate = makeWithYMD(~year=2014., ~month=8., ~date=14., ())

    let result = sndDate->ReDate.isSameISOWeek(fstDate)

    result |> expect |> toEqual(false)
  })
})
