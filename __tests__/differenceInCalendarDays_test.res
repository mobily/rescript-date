open Jest

open Js.Date

describe("differenceInCalendarDays", () => {
  open ExpectJs

  test("returns the number of calendar days between the given dates", () => {
    let fstDate = makeWithYMD(~year=2019., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.differenceInCalendarDays(sndDate)

    result |> expect |> toEqual(365.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=22.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=15.,
      (),
    )

    let result = fstDate->ReDate.differenceInCalendarDays(sndDate)

    result |> expect |> toEqual(-365.)
  })
})
