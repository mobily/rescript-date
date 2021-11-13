open Jest

open Js.Date

describe("isSameDay", () => {
  open ExpectJs

  test("returns true if the given dates have the same day", () => {
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
      ~date=1.,
      ~hours=10.,
      ~minutes=15.,
      ~seconds=55.,
      (),
    )

    let result = fstDate->ReDate.isSameDay(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different days", () => {
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
      ~date=2.,
      ~hours=0.,
      ~minutes=0.,
      ~seconds=1.,
      (),
    )

    let result = fstDate->ReDate.isSameDay(sndDate)

    result |> expect |> toBeFalsy
  })
})
