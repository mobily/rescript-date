const root = require('../package.json')

module.exports = {
  title: 'rescript-date',
  tagline: 'Date manipulation in ReScript.',
  url: 'https://mobily.github.io',
  baseUrl: '/rescript-date/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'mobily',
  projectName: 'rescript-date',
  scripts: [
    {
      src: 'https://cdn.splitbee.io/sb.js',
      async: true,
    },
  ],
  themeConfig: {
    image: 'img/hero-logo.png',
    prism: {
      theme: require('prism-react-renderer/themes/github'),
    },
    navbar: {
      title: `v${root.version}`,
      logo: {
        alt: 'rescript-date',
        src: 'img/rescript-date-logo.png',
      },
      items: [
        {
          to: 'docs',
          activeBasePath: 'docs',
          label: 'Docs',
          position: 'left',
        },
        {
          to: 'api/common',
          activeBasePath: 'api',
          label: 'API',
          position: 'left',
        },
        {
          href: 'https://www.buymeacoffee.com/utSC0k7',
          label: 'Buy me a coffee ❤️',
          position: 'right',
        },
        {
          href: 'https://github.com/mobily/rescript-date',
          position: 'right',
          className: 'header-github-link',
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
  plugins: [
    [
      require.resolve('@easyops-cn/docusaurus-search-local'),
      {
        hashed: true,
        docsRouteBasePath: ['/docs', '/api', '/benchmarks'],
        docsDir: ['docs', 'api', 'benchmarks'],
      },
    ],
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'api',
        path: 'api',
        routeBasePath: 'api',
        sidebarPath: require.resolve('./sidebars.api.js'),
      },
    ],
  ],
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          path: 'docs',
          routeBasePath: 'docs',
          editUrl: 'https://github.com/mobily/rescript-date/edit/master/docs/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
