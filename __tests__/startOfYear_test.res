open Jest

open Js.Date

describe("startOfYear", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 00:00:00 and the date set to the first day of a year",
    () => {
      let date = makeWithYMDHMS(
        ~year=2018.,
        ~month=5.,
        ~date=1.,
        ~hours=16.,
        ~minutes=50.,
        ~seconds=12.,
        (),
      )
      let expectedDate = makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=1.,
        ~hours=0.,
        ~minutes=0.,
        ~seconds=0.,
        (),
      )

      let result = date->ReDate.startOfYear

      result |> expect |> toEqual(expectedDate)
    },
  )
})
