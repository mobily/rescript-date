open Jest

open Js.Date

describe("endOfSecond", () => {
  open ExpectJs

  test("returns the date with the time set to the last millisecond before a second ends", () => {
    let date =
      setMilliseconds(
        makeWithYMDHMS(
          ~year=2018.,
          ~month=0.,
          ~date=1.,
          ~hours=16.,
          ~minutes=50.,
          ~seconds=10.,
          (),
        ),
        423.,
      ) |> fromFloat
    let expectedDate =
      setMilliseconds(
        makeWithYMDHMS(
          ~year=2018.,
          ~month=0.,
          ~date=1.,
          ~hours=16.,
          ~minutes=50.,
          ~seconds=10.,
          (),
        ),
        999.,
      ) |> fromFloat

    let result = date->ReDate.endOfSecond

    result |> expect |> toEqual(expectedDate)
  })
})
