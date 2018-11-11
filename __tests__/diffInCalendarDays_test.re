open Jest;

open Js.Date;

describe("diffInCalendarDays", () => {
  open ExpectJs;

  test("returns the number of calendar days between the given dates", () => {
    let fstDate = makeWithYMD(~year=2019., ~month=0., ~date=1., ());
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    fstDate->ReDate.diffInCalendarDays(sndDate)->expect->toEqual(365, _);
  });

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=22., ());
    let sndDate = makeWithYMDHMS(~year=2019., ~month=0., ~date=1., ~hours=8., ~minutes=45., ~seconds=15., ());

    fstDate->ReDate.diffInCalendarDays(sndDate)->expect->toEqual(-365, _);
  });
});
