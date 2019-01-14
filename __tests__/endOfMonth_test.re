open Jest;

open Js.Date;

describe("endOfMonth", () =>
  ExpectJs.(
    test(
      "returns the date with the time setted to 23:59:59.999 and the date setted to the last day of a month",
      () => {
        let date =
          makeWithYMDHMS(
            ~year=2018.,
            ~month=0.,
            ~date=24.,
            ~hours=16.,
            ~minutes=50.,
            ~seconds=12.,
            (),
          );
        let expectedDate =
          setHoursMSMs(
            makeWithYMD(~year=2018., ~month=0., ~date=31., ()),
            ~hours=23.,
            ~minutes=59.,
            ~seconds=59.,
            ~milliseconds=999.,
            (),
          )
          |> fromFloat;

        date |> ReDate.endOfMonth |> expect |> toEqual(expectedDate);
      },
    )
  )
);
