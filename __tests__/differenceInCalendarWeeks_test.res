open Jest

open Js.Date

describe("differenceInWeeks", () => {
  open ExpectJs

  test("returns the number of calendar weeks between the given dates", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=8., ~date=20., ())
    let sndDate = makeWithYMD(~year=2018., ~month=7., ~date=7., ())

    let result = fstDate->ReDate.differenceInCalendarWeeks(sndDate)

    result |> expect |> toEqual(6.)
  })

  test("allows to specify which day is the first day of the week", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=6., ~date=15., ())
    let sndDate = makeWithYMD(~year=2018., ~month=5., ~date=20., ())
    let differenceInCalendarWeeks' = ReDate.differenceInCalendarWeeks(~weekStartsOn=Monday)

    let result = fstDate->differenceInCalendarWeeks'(sndDate)

    result |> expect |> toEqual(3.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=7.,
      ~date=7.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=22.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=20.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=15.,
      (),
    )

    let result = fstDate->ReDate.differenceInCalendarWeeks(sndDate)

    result |> expect |> toEqual(-6.)
  })
})
