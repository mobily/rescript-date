open Jest

open Js.Date

describe("endOfWeek", () => {
  open ExpectJs

  test(
    "returns the date with the time set to 23:59:59:999 and the date set to the last day of a week",
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
      let expectedDate =
        setHoursMSMs(
          makeWithYMD(~year=2018., ~month=0., ~date=13., ()),
          ~hours=23.,
          ~minutes=59.,
          ~seconds=59.,
          ~milliseconds=999.,
          (),
        ) |> fromFloat

      let result = date->ReDate.endOfWeek

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
    let expectedDate =
      setHoursMSMs(
        makeWithYMD(~year=2018., ~month=0., ~date=14., ()),
        ~hours=23.,
        ~minutes=59.,
        ~seconds=59.,
        ~milliseconds=999.,
        (),
      ) |> fromFloat
    let endOfWeek = ReDate.endOfWeek(~weekStartsOn=Monday)

    let result = date->endOfWeek

    result |> expect |> toEqual(expectedDate)
  })
})
