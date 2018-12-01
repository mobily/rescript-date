# Hour helpers

#### addHours

> Add the specified number of hours to the given date.

`let addHours: (Js.Date.t, int) => Js.Date.t`

#### subHours

> Subtract the specified number of hours from the given date.

`let subHours: (Js.Date.t, int) => Js.Date.t`

#### differenceInHours

> Get the number of hours between the given dates.

`let differenceInHours: (Js.Date.t, Js.Date.t) => int`

#### startOfHour

> Return the start of an hour for the given date.

`let startOfHour: Js.Date.t => Js.Date.t`

#### endOfHour

> Return the end of an hour for the given date.

`let endOfHour: Js.Date.t => Js.Date.t`

#### isSameHour

> Are the given dates in the same hour?

`let isSameHour: (Js.Date.t, Js.Date.t) => bool`
