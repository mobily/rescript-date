open Jest

open Js.Date

describe("startOfWeekYear", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 00:00:00 and the date set to the first day of a week year",
    () => {
      let date = makeWithYMD(~year=2020., ~month=4., ~date=10., ())
      let expectedDate = makeWithYMDHMS(
        ~year=2019.,
        ~month=11.,
        ~date=29.,
        ~hours=0.,
        ~minutes=0.,
        ~seconds=0.,
        (),
      )

      let result = date->ReDate.startOfWeekYear

      result |> expect |> toEqual(expectedDate)
    },
  )

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMD(~year=2020., ~month=4., ~date=10., ())
    let expectedDate =
      setHoursMSMs(
        makeWithYMD(~year=2019., ~month=11., ~date=30., ()),
        ~hours=0.,
        ~minutes=0.,
        ~seconds=0.,
        ~milliseconds=0.,
        (),
      ) |> fromFloat
    let startOfWeekYear = ReDate.startOfWeekYear(~weekStartsOn=Monday)

    let result = date->startOfWeekYear

    result |> expect |> toEqual(expectedDate)
  })
})
