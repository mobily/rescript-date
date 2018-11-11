open Jest;

open Js.Date;

describe("getDayOfYear", () =>
  ExpectJs.(
    test("returns the day of the year of the given date", () => {
      let date = makeWithYMDHMS(~year=2018., ~month=7., ~date=23., ~hours=16., ~minutes=50., ~seconds=12., ());

      /* https://asd.gsfc.nasa.gov/Craig.Markwardt/doy2018.html= */
      date->ReDate.getDayOfYear->expect->toEqual(235, _);
    })
  )
);
