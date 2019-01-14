open Jest;

open Js.Date;

describe("eachDayOfIntervalList", () => {
  open ExpectJs;

  let interval =
    ReDate.{
      start:
        makeWithYMDHMS(
          ~year=2018.,
          ~month=0.,
          ~date=1.,
          ~hours=19.,
          ~minutes=30.,
          ~seconds=22.,
          (),
        ),
      end_:
        makeWithYMDHMS(
          ~year=2018.,
          ~month=0.,
          ~date=5.,
          ~hours=8.,
          ~minutes=45.,
          ~seconds=15.,
          (),
        ),
    };

  test(
    "returns a list with starts of days from the day of the start date to the day of the end date",
    () => {
      let a = makeWithYMD(~year=2018., ~month=0., ~date=1., ());
      let b = makeWithYMD(~year=2018., ~month=0., ~date=2., ());
      let c = makeWithYMD(~year=2018., ~month=0., ~date=3., ());
      let d = makeWithYMD(~year=2018., ~month=0., ~date=4., ());
      let e = makeWithYMD(~year=2018., ~month=0., ~date=5., ());

      let expectedDates = [a, b, c, d, e];
      let result = interval |> ReDate.eachDayOfIntervalList;

      Belt.List.eq(result, expectedDates, (a, b) =>
        a |> getTime === (b |> getTime)
      )
      |> expect
      |> toBeTruthy;
    },
  );
});
