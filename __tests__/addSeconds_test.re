open Jest;

open Js.Date;

describe("addSeconds", () => {
  open ExpectJs;

  test("adds 1 second", () => {
    let date =
      makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=1.,
        ~hours=19.,
        ~minutes=30.,
        ~seconds=0.,
        (),
      );
    let expectedDate =
      makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=1.,
        ~hours=19.,
        ~minutes=30.,
        ~seconds=1.,
        (),
      );

    date |> ReDate.addSeconds(1) |> expect |> toEqual(expectedDate);
  });

  test("adds 100 seconds", () => {
    let date =
      makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=1.,
        ~hours=19.,
        ~minutes=30.,
        ~seconds=0.,
        (),
      );
    let expectedDate =
      makeWithYMDHMS(
        ~year=2018.,
        ~month=0.,
        ~date=1.,
        ~hours=19.,
        ~minutes=31.,
        ~seconds=40.,
        (),
      );

    date |> ReDate.addSeconds(100) |> expect |> toEqual(expectedDate);
  });
});
