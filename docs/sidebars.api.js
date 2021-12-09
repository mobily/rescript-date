const makeSidebar = names =>
  names.map(name => {
    return {
      type: 'doc',
      id: name,
      className: `sidebar-api sidebar-api-${name}`,
    }
  })

module.exports = {
  sidebar: makeSidebar([
    'common',
    'interval',
    'second',
    'minute',
    'hour',
    'day',
    'week',
    'week-numbering',
    'weekday',
    'month',
    'year',
    'iso-week',
    'iso-week-numbering',
  ]),
}
