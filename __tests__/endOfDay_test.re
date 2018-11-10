open Jest;

open Js.Date;

describe("endOfDay", () =>
  ExpectJs.(
    test("returns the date with the time setted to 23:59:59.999", () => {
      let date = makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ());
      let expectedDate =
        makeWithYMD(~year=2018., ~month=0., ~date=1., ())
        ->setHoursMSMs(~hours=23., ~minutes=59., ~seconds=59., ~milliseconds=999., ())
        ->fromFloat;

      date->ReDate.endOfDay->expect->toEqual(expectedDate, _);
    })
  )
);
