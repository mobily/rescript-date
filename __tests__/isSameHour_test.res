open Jest

open Js.Date

describe("isSameHour", () => {
  open ExpectJs

  test("returns true if the given dates have the same hour", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=16.,
      ~minutes=50.,
      ~seconds=10.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=16.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )

    let result = fstDate->ReDate.isSameHour(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different hours", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=23.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=22.,
      ~minutes=59.,
      ~seconds=59.,
      (),
    )

    let result = fstDate->ReDate.isSameHour(sndDate)

    result |> expect |> toBeFalsy
  })
})
