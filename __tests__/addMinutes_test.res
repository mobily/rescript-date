open Jest

open Js.Date

describe("addMinutes", () => {
  open ExpectJs

  test("adds 1 minute", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=30.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=31.,
      ~seconds=30.,
      (),
    )

    let result = date->ReDate.addMinutes(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("adds 100 minutes", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=30.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=21.,
      ~minutes=10.,
      ~seconds=30.,
      (),
    )

    let result = date->ReDate.addMinutes(100.)

    result |> expect |> toEqual(expectedDate)
  })
})
