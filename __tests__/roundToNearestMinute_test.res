open Jest

open Js.Date

describe("roundToNearestMinute", () => {
  open ExpectJs

  test("returns true if the given dates round to the closest minute", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=6.,
      ~seconds=31.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=7.,
      ~seconds=0.,
      (),
    )

    let result = date->ReDate.roundToNearestMinute

    result |> expect |> toEqual(expectedDate)
  })

  test("returns true if the given dates round to the nearest 15 minutes", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=12.,
      ~seconds=10.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=19.,
      ~minutes=15.,
      ~seconds=0.,
      (),
    )
    let roundToNearest15Minute = ReDate.roundToNearestMinute(~nearestTo=15.)

    let result = date->roundToNearest15Minute

    result |> expect |> toEqual(expectedDate)
  })
})
