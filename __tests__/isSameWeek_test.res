open Jest

open Js.Date

describe("isSameWeek", () => {
  open ExpectJs

  test("returns true if the given dates have the same week", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=16.,
      ~minutes=50.,
      ~seconds=12.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=5.,
      ~hours=10.,
      ~minutes=15.,
      ~seconds=55.,
      (),
    )

    let result = fstDate->ReDate.isSameWeek(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different weeks", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=6.,
      ~hours=23.,
      ~minutes=59.,
      ~seconds=59.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=7.,
      ~hours=0.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )

    let result = fstDate->ReDate.isSameWeek(sndDate)

    result |> expect |> toBeFalsy
  })

  test("allows to specify which day is the first day of the week", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=6.,
      ~hours=23.,
      ~minutes=59.,
      ~seconds=59.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=7.,
      ~hours=0.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )
    let isSameWeek = ReDate.isSameWeek(~weekStartsOn=Monday)

    let result = fstDate->isSameWeek(sndDate)

    result |> expect |> toBeTruthy
  })
})
