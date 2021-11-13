open Jest

open Js.Date

describe("differenceInCalendarISOWeeks", () => {
  open ExpectJs

  test("returns the number of calendar ISO weeks between the given dates", () => {
    let fstDate = makeWithYMDHM(~year=2014., ~month=6., ~date=8., ~hours=18., ~minutes=0., ())
    let sndDate = makeWithYMDHM(~year=2014., ~month=5., ~date=29., ~hours=6., ~minutes=0., ())

    let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

    result |> expect |> toEqual(2.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHM(~year=2014., ~month=5., ~date=29., ~hours=6., ~minutes=0., ())
    let sndDate = makeWithYMDHM(~year=2014., ~month=6., ~date=8., ~hours=18., ~minutes=0., ())

    let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

    result |> expect |> toEqual(-2.)
  })

  // edge cases
  test(
    "the difference is less than an ISO week, but the given dates are in different calendar ISO weeks",
    () => {
      let fstDate = makeWithYMD(~year=2014., ~month=6., ~date=7., ())
      let sndDate = makeWithYMD(~year=2014., ~month=6., ~date=6., ())

      let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

      result |> expect |> toEqual(1.)
    },
  )

  test("the same for the swapped dates", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=6., ~date=6., ())
    let sndDate = makeWithYMD(~year=2014., ~month=6., ~date=7., ())

    let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

    result |> expect |> toEqual(-1.)
  })

  test("the days of weeks of the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=6., ~date=9., ())
    let sndDate = makeWithYMD(~year=2014., ~month=6., ~date=2., ())

    let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

    result |> expect |> toEqual(1.)
  })

  test("the given dates are the same", () => {
    let fstDate = makeWithYMDHM(~year=2014., ~month=8., ~date=5., ~hours=0., ~minutes=0., ())
    let sndDate = makeWithYMDHM(~year=2014., ~month=8., ~date=5., ~hours=0., ~minutes=0., ())

    let result = fstDate->ReDate.differenceInCalendarISOWeeks(sndDate)

    result |> expect |> toEqual(0.)
  })
})
