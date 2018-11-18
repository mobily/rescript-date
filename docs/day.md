# `Day` helpers

### `addDays: (Js.Date.t, int) => Js.Date.t`

Add the specified number of days to the given date.

### `subDays: (Js.Date.t, int) => Js.Date.t`

Subtract the specified number of days from the given date.

### `startOfDay: Js.Date.t => Js.Date.t`

Return the start of a day for the given date.

### `endOfDay: Js.Date.t => Js.Date.t`

Return the end of a day for the given date.

### `differenceInCalendarDays: (Js.Date.t, Js.Date.t) => int`

Get the number of calendar days between the given dates. This means that the times are removed from the dates and then the difference in days is calculated.

### `differenceInDays: (Js.Date.t, Js.Date.t) => int`

Get the number of full day periods between the given dates.

### `getDayOfYear: Js.Date.t => int`

Get the day of the year of the given date.

### `isSameDay: (Js.Date.t, Js.Date.t) => bool`

Are the given dates in the same day?

### `isToday: Js.Date.t => bool`

Is the given date today?

### `isTomorrow: Js.Date.t => bool`

Is the given date tomorrow?

### `isYesterday: Js.Date.t => bool`

Is the given date yesterday?
