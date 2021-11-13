open Jest

open Js.Date

describe("lastMonthOfYear", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 00:00:00 and the date set to the first day of the last month of the year",
    () => {
      let date = makeWithYMDHMS(
        ~year=2018.,
        ~month=8.,
        ~date=10.,
        ~hours=16.,
        ~minutes=50.,
        ~seconds=12.,
        (),
      )
      let expectedDate =
        setHoursMSMs(
          makeWithYMD(~year=2018., ~month=11., ~date=1., ()),
          ~hours=0.,
          ~minutes=0.,
          ~seconds=0.,
          ~milliseconds=0.,
          (),
        ) |> fromFloat

      let result = date->ReDate.lastMonthOfYear

      result |> expect |> toEqual(expectedDate)
    },
  )
})
