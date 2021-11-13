open Jest

open Js.Date

describe("differenceInSeconds", () => {
  open ExpectJs

  test("returns the number of seconds between the given dates", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=40.,
      ~seconds=15.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )

    let result = fstDate->ReDate.differenceInSeconds(sndDate)

    result |> expect |> toEqual(615.)
  })

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=40.,
      ~seconds=15.,
      (),
    )

    let result = fstDate->ReDate.differenceInSeconds(sndDate)

    result |> expect |> toEqual(-615.)
  })
})
