open Jest

open Js.Date

describe("differenceInCalendarYears", () => {
  open ExpectJs

  test("returns the number of calendar years between the given dates", () => {
    let fstDate = makeWithYMD(~year=2020., ~month=5., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=1., ~date=1., ())

    let result = fstDate->ReDate.differenceInCalendarYears(sndDate)

    result |> expect |> toEqual(2.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=1.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=22.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2019.,
      ~month=5.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=15.,
      (),
    )

    let result = fstDate->ReDate.differenceInCalendarYears(sndDate)

    result |> expect |> toEqual(-1.)
  })
})
