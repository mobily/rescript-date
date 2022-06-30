open Jest

open Js.Date

describe("setSeconds", () => {
  open ExpectJs

  test("sets the minutes of the given date", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=18.,
      ~minutes=1.,
      ~seconds=0.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=1.,
      ~hours=18.,
      ~minutes=1.,
      ~seconds=50.,
      (),
    )

    let result = date->ReDate.setSeconds(50.)

    result |> expect |> toEqual(expectedDate)
  })
})
