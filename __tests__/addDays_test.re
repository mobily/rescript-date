open Jest;

open Js.Date;

describe("addDays", () => {
  open ExpectJs;

  test("adds 1 day", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());

    date->ReDate.addDays(1)->expect->toEqual(expectedDate, _);
  });

  test("adds 100 days", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2018., ~month=3., ~date=11., ());

    date->ReDate.addDays(100)->expect->toEqual(expectedDate, _);
  });
});
