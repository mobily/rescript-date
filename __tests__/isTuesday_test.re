open Jest;

open Js.Date;

describe("isTuesday", () => {
  open ExpectJs;

  test("returns true if the given date is Tuesday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=9., ());

    date |> ReDate.isTuesday |> expect |> toBeTruthy;
  });

  test("returns false if the given date is not Tuesday", () => {
    let date = makeWithYMD(~year=2018., ~month=0., ~date=10., ());

    date |> ReDate.isTuesday |> expect |> toBeFalsy;
  });
});
