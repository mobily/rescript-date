open Jest;

open Js.Date;

describe("startOfWeek", () => {
  open ExpectJs;

  test("returns the date with the time setted to 00:00:00 and the date setted to the first day of a week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate = makeWithYMDHMS(~year=2018., ~month=0., ~date=7., ~hours=0., ~minutes=0., ~seconds=0., ());

    date->ReDate.startOfWeek->expect->toEqual(expectedDate, _);
  });

  test("returns the date with the time setted to 00:00:00 and the date setted to the first day of a week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate = makeWithYMDHMS(~year=2018., ~month=0., ~date=8., ~hours=0., ~minutes=0., ~seconds=0., ());

    ReDate.startOfWeek(~weekStartsOn=1, date)->expect->toEqual(expectedDate, _);
  });
});
