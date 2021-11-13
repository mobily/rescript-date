open Jest

open Js.Date

describe("getWeekOfMonth", () => {
  open ExpectJs

  test("returns the week of the month of the given date #1", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = date->ReDate.getWeekOfMonth

    result |> expect |> toEqual(1.)
  })

  test("returns the week of the month of the given date #2", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=14., ())

    let result = date->ReDate.getWeekOfMonth

    result |> expect |> toEqual(3.)
  })

  test("returns the week of the month of the given date #3", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=25., ())

    let result = date->ReDate.getWeekOfMonth

    result |> expect |> toEqual(5.)
  })

  test("allows to specify which day is the first day of the week #1", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=25., ())
    let getWeekOfMonth' = ReDate.getWeekOfMonth(~weekStartsOn=Monday)

    let result = date->getWeekOfMonth'

    result |> expect |> toEqual(4.)
  })

  test("allows to specify which day is the first day of the week #2", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=23., ())
    let getWeekOfMonth = ReDate.getWeekOfMonth(~weekStartsOn=Saturday)

    let result = date->getWeekOfMonth

    result |> expect |> toEqual(4.)
  })

  test("allows to specify which day is the first day of the week #3", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=2., ())
    let getWeekOfMonth = ReDate.getWeekOfMonth(~weekStartsOn=Friday)

    let result = date->getWeekOfMonth

    result |> expect |> toEqual(2.)
  })

  test("allows to specify which day is the first day of the week #4", () => {
    let date = makeWithYMD(~year=2018., ~month=10., ~date=1., ())
    let getWeekOfMonth = ReDate.getWeekOfMonth(~weekStartsOn=Friday)

    let result = date->getWeekOfMonth

    result |> expect |> toEqual(1.)
  })
})
