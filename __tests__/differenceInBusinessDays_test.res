open Jest

open Js.Date

describe("differenceInBusinessDays", () => {
  open ExpectJs

  test("returns 0 if the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(0.)
  })

  test("returns the number of business days between the given dates, excluding weekends", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=10., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(6.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=10., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(-6.)
  })

  test("returns a correct number when the first date falls on a weekend", () => {
    let fstDate = makeWithYMD(~year=2019., ~month=6., ~date=20., ())
    let sndDate = makeWithYMD(~year=2019., ~month=6., ~date=18., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(2.)
  })

  test("returns a correct number when the second date falls on a weekend", () => {
    let fstDate = makeWithYMD(~year=2019., ~month=6., ~date=23., ())
    let sndDate = makeWithYMD(~year=2019., ~month=6., ~date=20., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(1.)
  })

  test("returns a correct number when both dates fall on a weekend", () => {
    let fstDate = makeWithYMD(~year=2019., ~month=6., ~date=28., ())
    let sndDate = makeWithYMD(~year=2019., ~month=6., ~date=20., ())

    let result = fstDate->ReDate.differenceInBusinessDays(sndDate)

    result |> expect |> toEqual(5.)
  })
})
