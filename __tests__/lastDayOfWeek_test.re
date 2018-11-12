open Jest;

open Js.Date;

describe("lastDayOfWeek", () => {
  open ExpectJs;

  test("returns the date with the time setted to 00:00:00 and the date setted to the last day of a week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate =
      makeWithYMD(~year=2018., ~month=0., ~date=13., ())
      ->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())
      ->fromFloat;

    date->ReDate.lastDayOfWeek->expect->toEqual(expectedDate, _);
  });

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate =
      makeWithYMD(~year=2018., ~month=0., ~date=14., ())
      ->setHoursMSMs(~hours=0., ~minutes=0., ~seconds=0., ~milliseconds=0., ())
      ->fromFloat;
    let lastDayOfWeek' = ReDate.lastDayOfWeek(~weekStartsOn=Monday);

    date->lastDayOfWeek'->expect->toEqual(expectedDate, _);
  });
});
