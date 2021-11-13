open Jest

open Js.Date

describe("differenceInYears", () => {
  open ExpectJs

  test(
    "the difference is less than a year, but the given dates are in different calendar years",
    () => {
      let fstDate = makeWithYMD(~year=2019., ~month=0., ~date=1., ())
      let sndDate = makeWithYMD(~year=2018., ~month=1., ~date=1., ())

      let result = fstDate->ReDate.differenceInYears(sndDate)

      result |> expect |> toEqual(0.)
    },
  )

  test("the days and months of the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2016., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.differenceInYears(sndDate)

    result |> expect |> toEqual(2.)
  })

  test("the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.differenceInYears(sndDate)

    result |> expect |> toEqual(0.)
  })

  test("returns the number of full years between the given dates", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=6., ~date=18., ())
    let sndDate = makeWithYMD(~year=2015., ~month=0., ~date=14., ())

    let result = fstDate->ReDate.differenceInYears(sndDate)

    result |> expect |> toEqual(3.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMD(~year=2015., ~month=0., ~date=14., ())
    let sndDate = makeWithYMD(~year=2018., ~month=6., ~date=18., ())

    let result = fstDate->ReDate.differenceInYears(sndDate)

    result |> expect |> toEqual(-3.)
  })
})
