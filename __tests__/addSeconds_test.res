open Jest

open Js.Date

describe("addSeconds", () => {
  open ExpectJs

  test("adds 1 second", () => {
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
      ~hours=19.,
      ~minutes=30.,
      ~seconds=1.,
      (),
    )

    let result = date->ReDate.addSeconds(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("adds 100 seconds", () => {
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
      ~hours=19.,
      ~minutes=31.,
      ~seconds=40.,
      (),
    )

    let result = date->ReDate.addSeconds(100.)

    result |> expect |> toEqual(expectedDate)
  })
})
