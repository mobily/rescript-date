open Jest

open Js.Date

describe("startOfISOWeekYear", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 00:00:00 and the date set to the first day of an ISO year",
    () => {
      let date = makeWithYMDHMS(
        ~year=2009.,
        ~month=0.,
        ~date=1.,
        ~hours=16.,
        ~minutes=0.,
        ~seconds=0.,
        (),
      )

      let expectedDate =
        setHoursMSMs(
          makeWithYMD(~year=2008., ~month=11., ~date=29., ()),
          ~hours=0.,
          ~minutes=0.,
          ~seconds=0.,
          ~milliseconds=0.,
          (),
        ) |> fromFloat

      let result = date->ReDate.startOfISOWeekYear

      result |> expect |> toEqual(expectedDate)
    },
  )

  test("handles dates before 100 AD", () => {
    let date =
      setFullYearMD(
        fromFloat(
          setHoursMSMs(fromFloat(0.), ~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ()),
        ),
        ~year=9.,
        ~month=0.,
        ~date=1.,
        (),
      ) |> fromFloat

    let expectedDate =
      setFullYearMD(
        fromFloat(
          setHoursMSMs(fromFloat(0.), ~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ()),
        ),
        ~year=8.,
        ~month=11.,
        ~date=29.,
        (),
      ) |> fromFloat

    let result = date->ReDate.startOfISOWeekYear

    result |> expect |> toEqual(expectedDate)
  })

  test("correctly handles years in which 4 January is Sunday", () => {
    let date = makeWithYMD(~year=2009., ~month=6., ~date=2., ())

    let expectedDate = makeWithYMD(~year=2008., ~month=11., ~date=29., ())

    let result = date->ReDate.startOfISOWeekYear

    result |> expect |> toEqual(expectedDate)
  })
})
