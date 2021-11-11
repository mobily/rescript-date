open Jest

open Js.Date

describe("subSeconds", () => {
  open ExpectJs

  test("subtracts 1 second", () => {
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
      ~minutes=29.,
      ~seconds=59.,
      (),
    )

    date |> ReDate.subSeconds(1.) |> expect |> toEqual(expectedDate)
  })

  test("subtracts 100 seconds", () => {
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
      ~minutes=28.,
      ~seconds=20.,
      (),
    )

    date |> ReDate.subSeconds(100.) |> expect |> toEqual(expectedDate)
  })
})
