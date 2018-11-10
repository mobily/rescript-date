open Jest;

open Js.Date;

describe("isFuture", () => {
  open ExpectJs;

  test("returns true if the given date is future one", () => {
    let date = makeWithYMD(~year=2030., ~month=0., ~date=1., ());

    date->ReDate.isFuture->expect->toBeTruthy;
  });

  test("returns false if the given date is not future one", () => {
    let date = makeWithYMD(~year=1999., ~month=0., ~date=1., ());

    date->ReDate.isFuture->expect->toBeFalsy;
  });

  test("returns false if the given date is current time", () => {
    let date = make();

    date->ReDate.isFuture->expect->toBeFalsy;
  });
});
