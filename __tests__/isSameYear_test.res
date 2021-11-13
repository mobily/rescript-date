open Jest

open Js.Date

describe("isSameYear", () => {
  open ExpectJs

  test("returns true if the given dates have the same year", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=8., ~date=10., ())
    let sndDate = makeWithYMD(~year=2018., ~month=6., ~date=20., ())

    let result = fstDate->ReDate.isSameYear(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different years", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=8., ~date=10., ())
    let sndDate = makeWithYMD(~year=2015., ~month=6., ~date=20., ())

    let result = fstDate->ReDate.isSameYear(sndDate)

    result |> expect |> toBeFalsy
  })
})
