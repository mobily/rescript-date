open Jest;

open Js.Date;

describe("differenceInMonths", () => {
  open ExpectJs;

  test("the difference is less than a month, but the given dates are in different calendar months", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=7., ~date=1., ());
    let sndDate = makeWithYMD(~year=2018., ~month=6., ~date=31., ());

    fstDate->ReDate.differenceInMonths(sndDate)->expect->toEqual(0, _);
  });

  test("the days of months of the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=8., ~date=1., ());
    let sndDate = makeWithYMD(~year=2018., ~month=7., ~date=1., ());

    fstDate->ReDate.differenceInMonths(sndDate)->expect->toEqual(1, _);
  });

  test("the given dates are the same", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    fstDate->ReDate.differenceInMonths(sndDate)->expect->toEqual(0, _);
  });

  test("returns the number of full months between the given dates", () => {
    /* https://www.timeanddate.com/date/durationresult.html?y1=2018&m1=1&d1=10&y2=2018&m2=1&d2=2&h1=10&i1=15&s1=55&h2=20&i2=50&s2=10 */
    let fstDate = makeWithYMD(~year=2018., ~month=1., ~date=10., ());
    let sndDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());

    fstDate->ReDate.differenceInMonths(sndDate)->expect->toEqual(1, _);
  });

  test("returns a negative number if the time value of the first date is smaller", () => {
    let fstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());
    let sndDate = makeWithYMD(~year=2018., ~month=1., ~date=10., ());

    fstDate->ReDate.differenceInMonths(sndDate)->expect->toEqual(-1, _);
  });
});
