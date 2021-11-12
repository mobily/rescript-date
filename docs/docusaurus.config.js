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
    navbar: {
      title: '',
       logo: {
        alt: 'ReDate',
        src: 'img/rescript-date-logo.png',
      },
      items: [
        {
          to: 'docs/',
          activeBasePath: 'docs',
          label: 'Docs',
          position: 'left',
        },
        {
          href: 'https://github.com/mobily/rescript-date',
          label: 'GitHub',
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
