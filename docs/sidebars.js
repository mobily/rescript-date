const fs = require('fs')
const path = require('path')

const re = /.mdx?/
const resolveFiles = dir => {
  const files = fs.readdirSync(path.resolve(__dirname, 'docs', dir), { encoding: 'utf-8' })
  return files.map(file => file.replace(re, '')).sort().map(file => [dir, file].join('/'))
}

module.exports = {
  sidebar: [
    {
      type: 'doc',
      id: 'getting-started',
    },
    {
      type: 'doc',
      id: 'installation',
    },
    {
      type: 'category',
      label: 'API',
      collapsed: false,
      items: [
        'api/common',
        'api/interval',
        'api/second',
        'api/minute',
        'api/hour',
        'api/day',
        'api/week',
        'api/week-numbering',
        'api/weekday',
        'api/month',
        'api/year',
        'api/iso-week',
        'api/iso-week-numbering',
      ],
    },
    {
      type: 'doc',
      id: 'status',
    },
  ],
};
