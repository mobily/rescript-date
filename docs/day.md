
# Day helpers

#### addDays

> Add the specified number of days to the given date.

`let addDays: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.make();
date->addDays(5);
```

#### subDays

> Subtract the specified number of days from the given date.

`let subDays: (Js.Date.t, int) => Js.Date.t`

```reason
let date = Js.Date.make();
date->subDays(5);
```

#### startOfDay

> Return the start of a day for the given date.

`let startOfDay: Js.Date.t => Js.Date.t`

#### endOfDay

> Return the end of a day for the given date.

`let endOfDay: Js.Date.t => Js.Date.t`

#### differenceInCalendarDays

> Get the number of calendar days between the given dates. This means that the times are removed from the dates and then the difference in days is calculated.

`let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => int`

#### differenceInDays

> Get the number of full day periods between the given dates.

`let differenceInDays: (Js.Date.t, Js.Date.t) => int`

#### getDayOfYear

> Get the day of the year of the given date.

`let getDayOfYear: Js.Date.t => int`

#### isSameDay

> Are the given dates in the same day?

`let isSameDay: (Js.Date.t, Js.Date.t) => bool`

#### isToday

> Is the given date today?

`let isToday: Js.Date.t => bool`

#### isTomorrow

> Is the given date tomorrow?

`let isTomorrow: Js.Date.t => bool`

#### isYesterday

> Is the given date yesterday?

`let isYesterday: Js.Date.t => bool`
