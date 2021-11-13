open Jest

open Js.Date

describe("isBefore", () => {
  open ExpectJs

  test("returns true if the first date is before the second one", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = fstDate->ReDate.isBefore(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the first date is before the second one", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.isBefore(sndDate)

    result |> expect |> toBeFalsy
  })
})
