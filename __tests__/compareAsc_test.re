open Jest;

open Js.Date;

describe("compareAsc", () => {
  open ExpectJs;

  test("returns 0 if the given dates are equal", () => {
    let firstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let secondDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    firstDate->ReDate.compareAsc(secondDate)->expect->toEqual(0, _);
  });

  test("returns 1 if the first date is after the second one", () => {
    let firstDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());
    let secondDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());

    firstDate->ReDate.compareAsc(secondDate)->expect->toEqual(1, _);
  });

  test("returns -1 if the first date is before the second one", () => {
    let firstDate = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
    let secondDate = makeWithYMD(~year=2018., ~month=0., ~date=2., ());

    firstDate->ReDate.compareAsc(secondDate)->expect->toEqual(-1, _);
  });

  test("sorts the dates array in the chronological order when function is passed as the argument to sort function", () => {
    let a = makeWithYMD(~year=1999., ~month=0., ~date=1., ());
    let b = makeWithYMD(~year=2017., ~month=2., ~date=1., ());
    let c = makeWithYMD(~year=2017., ~month=4., ~date=1., ());
    let d = makeWithYMD(~year=2018., ~month=12., ~date=1., ());

    let unsortedArray = [|d, b, c, a|];
    let sortedArray = [|a, b, c, d|];

    unsortedArray
    ->Belt.SortArray.stableSortBy(ReDate.compareAsc)
    ->Belt.Array.eq(sortedArray, (===))
    ->expect
    ->toBeTruthy;
  });
});
