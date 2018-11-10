open Jest;

open Js.Date;

describe("isAfter", () => {
  open ExpectJs;

  test("returns true if the first date is after the second one", () => {
    let firstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());
    let secondDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    ReDate.isAfter(firstDate, secondDate)->expect->toBeTruthy;
  });

  test("returns false if the first date is after the second one", () => {
    let firstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let secondDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());

    ReDate.isAfter(firstDate, secondDate)->expect->toBeFalsy;
  });
});
