open Jest;

open Js.Date;

describe("max", () => {
  open ExpectJs;

  test("returns the latest date (List)", () => {
    let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ());
    let b = makeWithYMD(~year=2017., ~month=2., ~date=1., ());
    let c = makeWithYMD(~year=2017., ~month=4., ~date=1., ());
    let d = makeWithYMD(~year=2018., ~month=12., ~date=1., ());

    let dates = [b, c, d, a];

    ReDate.List(dates)->ReDate.max->expect->toEqual(d, _);
  });

  test("returns the latest date (Array)", () => {
    let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ());
    let b = makeWithYMD(~year=2017., ~month=2., ~date=1., ());
    let c = makeWithYMD(~year=2017., ~month=4., ~date=1., ());
    let d = makeWithYMD(~year=2018., ~month=12., ~date=1., ());

    let dates = [|b, c, d, a|];

    ReDate.Array(dates)->ReDate.max->expect->toEqual(d, _);
  });
});
