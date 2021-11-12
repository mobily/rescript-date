module.exports = {
  title: 'rescript-date',
  tagline: '',
  url: 'https://mobily.github.io',
  baseUrl: '/rescript-date/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'mobily',
  projectName: 'rescript-date',
  themeConfig: {
    sidebarCollapsible: false,
    navbar: {
      title: '',
       logo: {
        alt: 'ReDate',
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
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl:
            'https://github.com/facebook/docusaurus/edit/master/website/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
