open Jest;

open Js.Date;

describe("startOfHour", () =>
  ExpectJs.(
    test("returns the date with the time setted to the first millisecond of an hour", () => {
      let date =
        makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=10., ())
        ->setMilliseconds(423.)
        ->fromFloat;
      let expectedDate =
        makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=0., ~seconds=0., ())
        ->setMilliseconds(0.)
        ->fromFloat;

      date->ReDate.startOfHour->expect->toEqual(expectedDate, _);
    })
  )
);
