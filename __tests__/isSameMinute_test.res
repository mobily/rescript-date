open Jest

open Js.Date

describe("isSameMinute", () => {
  open ExpectJs

  test("returns true if the given dates have the same minute", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=6.,
      ~seconds=10.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=6.,
      ~seconds=35.,
      (),
    )

    let result = fstDate->ReDate.isSameMinute(sndDate)

    result |> expect |> toBeTruthy
  })

  test("returns false if the given dates have different minutes", () => {
    let fstDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=8.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )
    let sndDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=8.,
      ~minutes=10.,
      ~seconds=15.,
      (),
    )

    let result = fstDate->ReDate.isSameMinute(sndDate)

    result |> expect |> toBeFalsy
  })
})
