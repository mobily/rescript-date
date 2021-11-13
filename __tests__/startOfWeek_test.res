open Jest

open Js.Date

describe("startOfWeek", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 00:00:00 and the date set to the first day of a week",
    () => {
      let date = makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=12.,
        ~hours=16.,
        ~minutes=50.,
        ~seconds=12.,
        (),
      )
      let expectedDate = makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=7.,
        ~hours=0.,
        ~minutes=0.,
        ~seconds=0.,
        (),
      )

      let result = date->ReDate.startOfWeek

      result |> expect |> toEqual(expectedDate)
    },
  )

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=12.,
      ~hours=16.,
      ~minutes=50.,
      ~seconds=12.,
      (),
    )
    let expectedDate = makeWithYMDHMS(
      ~year=2018.,
      ~month=0.,
      ~date=8.,
      ~hours=0.,
      ~minutes=0.,
      ~seconds=0.,
      (),
    )
    let startOfWeek = ReDate.startOfWeek(~weekStartsOn=Monday)

    let result = date->startOfWeek

    result |> expect |> toEqual(expectedDate)
  })
})
