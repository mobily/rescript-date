open Jest;

open Js.Date;

describe("isThisISOWeek", () => {
  open ExpectJs;

  /* Source: https://blog.blakesimpson.co.uk/page.php?id=98&title=how-to-stub-date-in-jest-tests-building-a-stubdate-helper
        and https://github.com/facebook/jest/issues/2234#issuecomment-384884729

        Alternative: https://github.com/mikaello/bs-jest-date-mock
     */
  let stubDate: Js.Date.t => unit = [%bs.raw
    {|
    fixedDate => {
      let RealDate;

      beforeAll(() => {
        RealDate = Date;

        Date = class extends Date {
          constructor(...theArgs) {
            if (theArgs.length) {
              return new RealDate(...theArgs);
            } else {
              return new RealDate(fixedDate);
            }
          }
        };
      });

      afterAll(() => {
        Date = RealDate;
      });
    }
    |}
  ];

  stubDate(makeWithYMDH(~year=2014., ~month=8., ~date=25., ~hours=12., ()));

  test(
    "returns true if the given date and the current date have the same ISO week",
    () => {
    let date = makeWithYMD(~year=2014., ~month=8., ~date=22., ());

    date |> ReDate.isThisISOWeek |> expect |> toEqual(true);
  });

  test(
    "returns false if the given date and the current date have different ISO weeks",
    () => {
      let date = makeWithYMD(~year=2014., ~month=8., ~date=21., ());

      date |> ReDate.isThisISOWeek |> expect |> toEqual(false);
    },
  );
});