open Jest;

open Js.Date;

describe("isSameISOWeek", () => {
  open ExpectJs;

  test("returns true if the given dates have the same ISO week", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=8., ~date=1., ());
    let sndDate = makeWithYMD(~year=2014., ~month=8., ~date=7., ());

    sndDate |> ReDate.isSameISOWeek(fstDate) |> expect |> toEqual(true);
  });

  test("returns false if the given dates have different ISO weeks", () => {
    let fstDate = makeWithYMD(~year=2014., ~month=8., ~date=1., ());
    let sndDate = makeWithYMD(~year=2014., ~month=8., ~date=14., ());

    sndDate |> ReDate.isSameISOWeek(fstDate) |> expect |> toEqual(false);
  });
});