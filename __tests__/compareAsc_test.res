open Jest

open Js.Date

describe("compareAsc", () => {
  open ExpectJs

  test("returns 0 if the given dates are equal", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = ReDate.compareAsc(fstDate, sndDate)

    result |> expect |> toEqual(0)
  })

  test("returns 1 if the first date is after the second one", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())

    let result = ReDate.compareAsc(fstDate, sndDate)

    result |> expect |> toEqual(1)
  })

  test("returns -1 if the first date is before the second one", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ())
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ())

    let result = ReDate.compareAsc(fstDate, sndDate)

    result |> expect |> toEqual(-1)
  })

  test(
    "sorts the dates array in the chronological order when function is passed as the argument to sort function",
    () => {
      let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ())
      let b = makeWithYMD(~year=2017., ~month=2., ~date=1., ())
      let c = makeWithYMD(~year=2017., ~month=4., ~date=1., ())
      let d = makeWithYMD(~year=2018., ~month=12., ~date=1., ())

      let unsortedArray = [d, b, c, a]
      let expected = [a, b, c, d]
      let sortedArray = Belt.SortArray.stableSortBy(unsortedArray, ReDate.compareAsc)

      let result = Belt.Array.eq(sortedArray, expected, (x, y) => x == y)

      result |> expect |> toBeTruthy
    },
  )
})
