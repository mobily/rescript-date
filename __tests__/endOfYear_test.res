open Jest

open Js.Date

describe("endOfYear", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 23:59:59.999 and the date set to the last day of a year",
    () => {
      let date = makeWithYMDHMS(
        ~year=2018.,
        ~month=8.,
        ~date=10.,
        ~hours=19.,
        ~minutes=6.,
        ~seconds=6.,
        (),
      )
      let expectedDate =
        setHoursMSMs(
          makeWithYMD(~year=2018., ~month=11., ~date=31., ()),
          ~hours=23.,
          ~minutes=59.,
          ~seconds=59.,
          ~milliseconds=999.,
          (),
        ) |> fromFloat

      let result = date->ReDate.endOfYear

      result |> expect |> toEqual(expectedDate)
    },
  )
})
