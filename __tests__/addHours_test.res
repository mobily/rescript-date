open Jest

open Js.Date

describe("addHours", () => {
  open ExpectJs

  test("adds 1 hour", () => {
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
      ~hours=20.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )

    let result = date->ReDate.addHours(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("adds 60 hours", () => {
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
      ~date=4.,
      ~hours=7.,
      ~minutes=30.,
      ~seconds=0.,
      (),
    )

    let result = date->ReDate.addHours(60.)

    result |> expect |> toEqual(expectedDate)
  })
})
