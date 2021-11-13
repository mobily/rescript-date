open Jest

open Js.Date

describe("differenceInDays", () => {
  open ExpectJs

  test("returns 0 if the difference is less than a day", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=23.,
      ~minutes=59.,
      ~seconds=59.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=0.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )

    let result = fstDate->ReDate.differenceInDays(sndDate)

    result |> expect |> toEqual(0.)
  })

  test("returns 0 if the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = fstDate->ReDate.differenceInDays(sndDate)

    result |> expect |> toEqual(0.)
  })

  test("returns the number of full days between the given dates", () => {
    /* https://www.timeanddate.com/date/durationresult.html?y1=2018&m1=1&d1=10&y2=2018&m2=1&d2=2&h1=10&i1=15&s1=55&h2=20&i2=50&s2=10 */
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=10.,
      ~hours=10.,
      ~minutes=15.,
      ~seconds=55.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=2.,
      ~hours=20.,
      ~minutes=50.,
      ~seconds=10.,
      (),
    )

    let result = fstDate->ReDate.differenceInDays(sndDate)

    result |> expect |> toEqual(7.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=2.,
      ~hours=20.,
      ~minutes=50.,
      ~seconds=10.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=10.,
      ~hours=10.,
      ~minutes=15.,
      ~seconds=55.,
      (),
    )

    let result = fstDate->ReDate.differenceInDays(sndDate)

    result |> expect |> toEqual(-7.)
  })
})
