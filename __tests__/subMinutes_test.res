open Jest

open Js.Date

describe("subMinutes", () => {
  open ExpectJs

  test("subtracts 1 minute", () => {
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
      ~minutes=29.,
      ~seconds=30.,
      (),
    )

    let result = date->ReDate.subMinutes(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 100 minutes", () => {
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
      ~hours=17.,
      ~minutes=50.,
      ~seconds=30.,
      (),
    )

    let result = date->ReDate.subMinutes(100.)

    result |> expect |> toEqual(expectedDate)
  })
})
