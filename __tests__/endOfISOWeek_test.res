open Jest

open Js.Date

describe("endOfISOWeek", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 23:59:59:999 and the date set to the last day of an ISO week",
    () => {
      let date = makeWithYMDHMS(
        ~year=2014.,
        ~month=8.,
        ~date=2.,
        ~hours=11.,
        ~minutes=55.,
        ~seconds=0.,
        (),
      )

      let expectedDate =
        setHoursMSMs(
          makeWithYMD(~year=2014., ~month=8., ~date=7., ()),
          ~hours=23.,
          ~minutes=59.,
          ~seconds=59.,
          ~milliseconds=999.,
          (),
        ) |> fromFloat

      let result = date->ReDate.endOfISOWeek

      result |> expect |> toEqual(expectedDate)
    },
  )
})
