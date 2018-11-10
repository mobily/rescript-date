open Jest;

open Js.Date;

describe("addYears", () => {
  open ExpectJs;

  test("adds 1 year", () => {
    let date = makeWithYMD(~year=2018., ~month=4., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2019., ~month=4., ~date=1., ());

    date->ReDate.addYears(1)->expect->toEqual(expectedDate, _);
  });

  test("adds 10 years", () => {
    let date = makeWithYMD(~year=1999., ~month=4., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2009., ~month=4., ~date=1., ());

    date->ReDate.addYears(10)->expect->toEqual(expectedDate, _);
  });
});
