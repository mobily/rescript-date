open Jest;

open Js.Date;

describe("subWeeks", () => {
  open ExpectJs;

  test("adds 1 week", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=8., ());
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    date->ReDate.subWeeks(1)->expect->toEqual(expectedDate, _);
  });

  test("adds 10 weeks", () => {
    let date = makeWithYMD(~year=2018., ~month=2., ~date=12., ());
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    date->ReDate.subWeeks(10)->expect->toEqual(expectedDate, _);
  });
});
