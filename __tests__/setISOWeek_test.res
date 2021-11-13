open Jest

open Js.Date

describe("setISOWeek", () => {
  open ExpectJs

  test("sets the ISO week (first week)", () => {
    let date = makeWithYMDH(~year=2004., ~month=7., ~date=7., ~hours=12., ())
    let expectedDate = makeWithYMDH(~year=2004., ~month=0., ~date=3., ~hours=12., ())

    let result = date->ReDate.setISOWeek(1.)

    result |> expect |> toEqual(expectedDate)
  })

  test("sets the ISO week (last week)", () => {
    let date = makeWithYMDH(~year=2004., ~month=7., ~date=7., ~hours=12., ())
    let expectedDate = makeWithYMDH(~year=2005., ~month=0., ~date=1., ~hours=12., ())

    let result = date->ReDate.setISOWeek(53.)
    result |> expect |> toEqual(expectedDate)
  })

  test("original date should not be changed when ISO week is changed", () => {
    let date = makeWithYMDH(~year=2004., ~month=7., ~date=7., ~hours=12., ())
    let expectedDate = date->Js.Date.getTime->Js.Date.fromFloat

    date->ReDate.setISOWeek(53.)->ignore

    date |> expect |> toEqual(expectedDate)
  })
})
