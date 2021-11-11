type interval = {
  start: Js.Date.t,
  end_: Js.Date.t,
}

type offset =
  | Start(Js.Date.t)
  | End(Js.Date.t)

type day =
  | Sunday
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday

type closestTo = {
  distance: option<float>,
  date: option<Js.Date.t>,
}
