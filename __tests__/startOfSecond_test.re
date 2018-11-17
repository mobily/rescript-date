open Jest;

open Js.Date;

describe("startOfWeek", () =>
  ExpectJs.(
    test("returns the date with the time setted to the first millisecond of a second", () => {
      let date =
        makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ())
        ->setMilliseconds(423.)
        ->fromFloat;
      let expectedDate =
        makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ())
        ->setMilliseconds(0.)
        ->fromFloat;

      date->ReDate.startOfSecond->expect->toEqual(expectedDate, _);
    })
  )
);
