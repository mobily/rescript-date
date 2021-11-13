open Jest

open Js.Date

describe("endOfMinute", () => {
  open ExpectJs

  test("returns the date with the time set to the last millisecond of an minute", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=8.,
      ~date=10.,
      ~hours=8.,
      ~minutes=20.,
      ~seconds=35.,
      (),
    )
    let expectedDate =
      setMilliseconds(
        makeWithYMDHMS(
          ~year=2018.,
          ~month=8.,
          ~date=10.,
          ~hours=8.,
          ~minutes=20.,
          ~seconds=59.,
          (),
        ),
        999.,
      ) |> fromFloat

    let result = date->ReDate.endOfMinute

    result |> expect |> toEqual(expectedDate)
  })
})
