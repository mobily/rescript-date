open Jest

open Js.Date

describe("isThisISOWeek", () => {
  open ExpectJs
  // HACK:
  // https://blog.blakesimpson.co.uk/page.php?id=98&title=how-to-stub-date-in-jest-tests-building-a-stubdate-helper
  // https://github.com/facebook/jest/issues/2234#issuecomment-384884729
  // alternative solution: https://github.com/mikaello/rescript-jest-date-mock

  let stubDate: Js.Date.t => unit = %raw(`
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
  `)

  stubDate(makeWithYMDH(~year=2014., ~month=8., ~date=25., ~hours=12., ()))

  test("returns true if the given date and the current date have the same ISO week", () => {
    let date = makeWithYMD(~year=2014., ~month=8., ~date=22., ())

    let result = date->ReDate.isThisISOWeek

    result |> expect |> toBeTruthy
  })

  test("returns false if the given date and the current date have different ISO weeks", () => {
    let date = makeWithYMD(~year=2014., ~month=8., ~date=21., ())

    let result = date->ReDate.isThisISOWeek

    result |> expect |> toBeFalsy
  })
})
