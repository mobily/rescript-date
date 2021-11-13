open Jest

open Js.Date

describe("subHours", () => {
  open ExpectJs

  test("subtracts 1 hour", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=18.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )

    let result = date->ReDate.subHours(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("subtracts 60 hours", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=19.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2017.,
      ~month=11.,
      ~date=30.,
      ~hours=7.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )

    let result = date->ReDate.subHours(60.)

    result |> expect |> toEqual(expectedDate)
  })
})
