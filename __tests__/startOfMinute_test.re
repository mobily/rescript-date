open Jest;

open Js.Date;

describe("startOfMinute", () =>
  ExpectJs.(
    test("returns the date with the time set to the first millisecond of an minute", () => {
      let date = makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=8., ~minutes=20., ~seconds=35., ());
      let expectedDate =
        makeWithYMDHMS(~year=2018., ~month=8., ~date=10., ~hours=8., ~minutes=20., ~seconds=0., ())
        ->setMilliseconds(0.)
        ->fromFloat;

      date->ReDate.startOfMinute->expect->toEqual(expectedDate, _);
    })
  )
);
