open Jest;

open Js.Date;

describe("getOverlappingDaysInIntervals", () => {
  open ExpectJs;
  open ReDate;

  let interval = {
    start: makeWithYMD(~year=2018., ~month=3., ~date=1., ()),
    end_: makeWithYMD(~year=2018., ~month=4., ~date=10., ()),
  };

  test("returns the correct value for an interval included within another interval", () => {
    let includedInterval = {
      start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
      end_: makeWithYMD(~year=2018., ~month=3., ~date=15., ()),
    };

    interval->ReDate.getOverlappingDaysInIntervals(includedInterval)->expect->toEqual(10, _);
  });

  test("returns the correct value for an interval including another interval", () => {
    let includingInterval = {
      start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),
      end_: makeWithYMD(~year=2018., ~month=3., ~date=10., ()),
    };

    includingInterval->ReDate.getOverlappingDaysInIntervals(interval)->expect->toEqual(5, _);
  });

  test("returns 0 for a valid non overlapping interval before another interval", () => {
    let earlierInterval = {
      start: makeWithYMD(~year=2018., ~month=2., ~date=20., ()),
      end_: makeWithYMD(~year=2018., ~month=2., ~date=30., ()),
    };

    earlierInterval->ReDate.getOverlappingDaysInIntervals(interval)->expect->toEqual(0, _);
  });

  test("returns 0 for a valid non overlapping interval after another interval", () => {
    let laterInterval = {
      start: makeWithYMD(~year=2018., ~month=4., ~date=11., ()),
      end_: makeWithYMD(~year=2018., ~month=4., ~date=30., ()),
    };

    laterInterval->ReDate.getOverlappingDaysInIntervals(interval)->expect->toEqual(0, _);
  });
});
