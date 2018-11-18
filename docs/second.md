# `Second` helpers

### `addSeconds`

Add the specified number of seconds to the given date.

`let addSeconds: (Js.Date.t, int) => Js.Date.t;`

### `subSeconds`

Subtract the specified number of seconds from the given date.

`let subSeconds: (Js.Date.t, int) => Js.Date.t;`

### `differenceInSeconds`

Get the number of seconds between the given dates.

`let differenceInSeconds: (Js.Date.t, Js.Date.t) => int;`

### `startOfSecond`

Return the start of a second for the given date.

`let startOfSecond: Js.Date.t => Js.Date.t;`

### `endOfSecond`

Return the end of a second for the given date.

`let endOfSecond: Js.Date.t => Js.Date.t;`

### `isSameSecond`

Are the given dates in the same second?

`let isSameSecond: (Js.Date.t, Js.Date.t) => bool;`