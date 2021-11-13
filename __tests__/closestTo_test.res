open Jest

open Js.Date

describe("closestTo", () => {
  open ExpectJs

  test("returns the date from the given list closest to the given date #1", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ())
    let b = makeWithYMD(~year=2018., ~month=2., ~date=1., ())
    let c = makeWithYMD(~year=2020., ~month=4., ~date=1., ())
    let d = makeWithYMD(~year=2022., ~month=12., ~date=1., ())

    let dates = [a, b, c, d]

    let result = date->ReDate.closestTo(dates)

    result |> expect |> toEqual(Some(b))
  })

  test("returns the date from the given list closest to the given date #2", () => {
    let date = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=15.,
      (),
    )

    let a = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=50.,
      ~seconds=0.,
      (),
    )
    let b = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=20.,
      (),
    )
    let c = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=19.,
      (),
    )
    let d = makeWithYMDHMS(
      ~year=2019.,
      ~month=0.,
      ~date=1.,
      ~hours=8.,
      ~minutes=45.,
      ~seconds=13.,
      (),
    )

    let dates = [a, b, c, d]

    let result = date->ReDate.closestTo(dates)

    result |> expect |> toEqual(Some(d))
  })

  test("returns `None` if the given list is empty", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=2., ())
    let dates = []

    let result = date->ReDate.closestTo(dates)

    result |> expect |> toEqual(None)
  })
})
