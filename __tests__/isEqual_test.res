open Jest

open Js.Date

describe("isEqual", () => {
  open ExpectJs

  test("returns true if the given dates are equal", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.isEqual(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates are not equal", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = fstDate->ReDate.isEqual(sndDate)

    result |> expect |> toBeFalsy
  })
})
