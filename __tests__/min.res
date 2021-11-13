open Jest

open Js.Date

describe("min", () => {
  open ExpectJs

  test("returns the earliest date (list)", () => {
    let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ())
    let b = makeWithYMD(~year=2017., ~month=2., ~date=1., ())
    let c = makeWithYMD(~year=2017., ~month=4., ~date=1., ())
    let d = makeWithYMD(~year=2018., ~month=12., ~date=1., ())

    let dates = [b, c, d, a]

    let result = dates->ReDate.min

    result |> expect |> toEqual(a)
  })
})
