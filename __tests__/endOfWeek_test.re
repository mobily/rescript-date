open Jest;

open Js.Date;

describe("endOfWeek", () => {
  open ExpectJs;

  test("returns the date with the time setted to 23:59:59:999 and the date setted to the last day of a week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate =
      makeWithYMD(~year=2018., ~month=0., ~date=13., ())
      ->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())
      ->fromFloat;

    date->ReDate.endOfWeek->expect->toEqual(expectedDate, _);
  });

  test("allows to specify which day is the first day of the week", () => {
    let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ());
    let expectedDate =
      makeWithYMD(~year=2018., ~month=0., ~date=14., ())
      ->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())
      ->fromFloat;
    let endOfWeek' = ReDate.endOfWeek(~weekStartsOn=1);

    date->endOfWeek'->expect->toEqual(expectedDate, _);
  });
});