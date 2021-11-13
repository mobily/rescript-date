open Jest

open Js.Date

describe("isSameSecond", () => {
  open ExpectJs

  test("returns true if the given dates have the same second", () => {
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
      ~minutes=50.,
      ~seconds=10.,
      (),
    )

    let result = fstDate->ReDate.isSameSecond(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different seconds", () => {
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
      ~hours=23.,
      ~minutes=59.,
      ~seconds=58.,
      (),
    )

    let result = fstDate->ReDate.isSameSecond(sndDate)

    result |> expect |> toBeFalsy
  })
})
