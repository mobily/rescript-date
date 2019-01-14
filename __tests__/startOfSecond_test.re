open Jest;

open Js.Date;

describe("startOfSecond", () =>
  ExpectJs.(
    test(
      "returns the date with the time setted to the first millisecond of a second",
      () => {
      let date =
        setMilliseconds(
          makeWithYMDHMS(
            ~year=2018.,
            ~month=0.,
            ~date=1.,
            ~hours=16.,
            ~minutes=50.,
            ~seconds=10.,
            (),
          ),
          423.,
        )
        |> fromFloat;
      let expectedDate =
        setMilliseconds(
          makeWithYMDHMS(
            ~year=2018.,
            ~month=0.,
            ~date=1.,
            ~hours=16.,
            ~minutes=50.,
            ~seconds=10.,
            (),
          ),
          0.,
        )
        |> fromFloat;

      date |> ReDate.startOfSecond |> expect |> toEqual(expectedDate);
    })
  )
);
