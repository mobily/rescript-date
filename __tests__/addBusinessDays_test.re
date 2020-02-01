open Jest;

open Js.Date;

describe("addBusinessDays", () => {
  open ExpectJs;

  test("adds 0 business days", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=1., ());

    date |> ReDate.addBusinessDays(0) |> expect |> toEqual(expectedDate);
  });

  test("adds 1 business day", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=2., ());

    date |> ReDate.addBusinessDays(1) |> expect |> toEqual(expectedDate);
  });

  test("adds 100 business days", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=1., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=4., ~date=20., ());

    date |> ReDate.addBusinessDays(100) |> expect |> toEqual(expectedDate);
  });

  test("handles negative number", () => {
    let date = makeWithYMD(~year=2020., ~month=4., ~date=20., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=1., ());

    date |> ReDate.addBusinessDays(-100) |> expect |> toEqual(expectedDate);
  });

  test("returns Monday when 1 day is added on Friday", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=10., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=13., ());

    date |> ReDate.addBusinessDays(1) |> expect |> toEqual(expectedDate);
  });

  test("returns Monday when 1 day is added on Saturday", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=11., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=13., ());

    date |> ReDate.addBusinessDays(1) |> expect |> toEqual(expectedDate);
  });

  test("returns Monday when 1 day is added on Sunday", () => {
    let date = makeWithYMD(~year=2020., ~month=0., ~date=12., ());
    let expectedDate = makeWithYMD(~year=2020., ~month=0., ~date=13., ());

    date |> ReDate.addBusinessDays(1) |> expect |> toEqual(expectedDate);
  });
});
