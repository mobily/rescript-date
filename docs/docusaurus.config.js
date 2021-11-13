const root = require('../package.json')

module.exports = {
  title: 'rescript-date',
  tagline: '📅 Date manipulation in ReScript.',
  url: 'https://mobily.github.io',
  baseUrl: '/rescript-date/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'mobily',
  projectName: 'rescript-date',
  themeConfig: {
    prism: {
      defaultLanguage: 'javascript',
      // theme: require('prism-react-renderer/themes/github'),
    },
    navbar: {
      title: `v${root.version}`,
      logo: {
        alt: 'rescript-date',
        src: 'img/rescript-date-logo.png',
      },
      items: [
        {
          href: 'https://www.buymeacoffee.com/utSC0k7',
          label: 'Sponsor ❤️',
          position: 'right',
        },
        {
          href: 'https://github.com/mobily/rescript-date',
          label: 'Github',
          position: 'right',
        },
        {
          href: 'https://twitter.com/__marcin_',
          label: 'Twitter',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'light',
      links: [
        {
          title: 'Github',
          items: [
            {
              label: 'Pull Requests',
              href: 'https://github.com/mobily/rescript-date/pulls',
            },
            {
              label: 'Issues',
              href: 'https://github.com/mobily/rescript-date/issues',
            },
          ],
        },
        {
          title: 'Contact',
          items: [
            {
              label: 'Twitter',
              href: 'https://twitter.com/__marcin_',
            },
            {
              label: 'Github',
              href: 'https://github.com/mobily',
            },
            {
              label: 'Dev.to',
              href: 'https://dev.to/mobily',
            },
          ],
        },
      ],
      copyright: `Built with Docusaurus ❤️`,
    },
    colorMode: {
      defaultMode: 'light',
      disableSwitch: true,
      respectPrefersColorScheme: false,
    },
  },
  themes: [],
  plugins: [
    [
      require.resolve('@easyops-cn/docusaurus-search-local'),
      {
        hashed: true,
      },
    ],
  ],
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          sidebarCollapsible: false,
          showLastUpdateTime: true,
          editUrl:
            'https://github.com/mobily/rescript-date/edit/master/docs/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
