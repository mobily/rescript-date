(window.webpackJsonp=window.webpackJsonp||[]).push([[15],{82:function(e,t,a){"use strict";a.r(t),a.d(t,"frontMatter",(function(){return c})),a.d(t,"metadata",(function(){return d})),a.d(t,"rightToc",(function(){return l})),a.d(t,"default",(function(){return i}));var n=a(3),s=a(7),r=(a(0),a(88)),c={id:"day",title:"Day"},d={unversionedId:"api/day",id:"api/day",isDocsHomePage:!1,title:"Day",description:"addDays",source:"@site/docs/api/day.md",slug:"/api/day",permalink:"/rescript-date/docs/api/day",editUrl:"https://github.com/facebook/docusaurus/edit/master/website/docs/api/day.md",version:"current",sidebar:"sidebar",previous:{title:"Hour",permalink:"/rescript-date/docs/api/hour"},next:{title:"Week",permalink:"/rescript-date/docs/api/week"}},l=[{value:"addDays",id:"adddays",children:[]},{value:"addBusinessDays",id:"addbusinessdays",children:[]},{value:"subDays",id:"subdays",children:[]},{value:"getDate",id:"getdate",children:[]},{value:"setDate",id:"setdate",children:[]},{value:"startOfDay",id:"startofday",children:[]},{value:"endOfDay",id:"endofday",children:[]},{value:"differenceInCalendarDays",id:"differenceincalendardays",children:[]},{value:"differenceInDays",id:"differenceindays",children:[]},{value:"differenceInBusinessDays",id:"differenceinbusinessdays",children:[]},{value:"getDayOfYear",id:"getdayofyear",children:[]},{value:"isSameDay",id:"issameday",children:[]},{value:"isToday",id:"istoday",children:[]},{value:"isTomorrow",id:"istomorrow",children:[]},{value:"isYesterday",id:"isyesterday",children:[]}],b={rightToc:l};function i(e){var t=e.components,a=Object(s.a)(e,["components"]);return Object(r.b)("wrapper",Object(n.a)({},b,a,{components:t,mdxType:"MDXLayout"}),Object(r.b)("h3",{id:"adddays"},"addDays"),Object(r.b)("p",null,"Add the specified number of days to the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let addDays: (float, Js.Date.t) => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\ndate |> ReDate.addDays(5.)\n")),Object(r.b)("h3",{id:"addbusinessdays"},"addBusinessDays"),Object(r.b)("p",null,"Add the specified number of business days to the given date (excluding weekends)."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let addBusinessDays: (float, Js.Date.t) => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\ndate |> ReDate.addBusinessDays(5.)\n")),Object(r.b)("h3",{id:"subdays"},"subDays"),Object(r.b)("p",null,"Subtract the specified number of days from the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let subDays: (float, Js.Date.t) => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\ndate |> ReDate.subDays(5.)\n")),Object(r.b)("h3",{id:"getdate"},"getDate"),Object(r.b)("p",null,"Get the day of the month of the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let getSeconds: Js.Date.t => float\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\ndate |> ReDate.getDate\n")),Object(r.b)("h3",{id:"setdate"},"setDate"),Object(r.b)("p",null,"Set the day of the month to the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let setDate: (float, Js.Date.t) => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\ndate |> ReDate.setDate(23.)\n")),Object(r.b)("h3",{id:"startofday"},"startOfDay"),Object(r.b)("p",null,"Return the start of a day for the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let startOfDay: Js.Date.t => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())\n\ndate |> ReDate.startOfDay\n")),Object(r.b)("h3",{id:"endofday"},"endOfDay"),Object(r.b)("p",null,"Return the end of a day for the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let endOfDay: Js.Date.t => Js.Date.t\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())\n\ndate |> ReDate.endOfDay\n")),Object(r.b)("h3",{id:"differenceincalendardays"},"differenceInCalendarDays"),Object(r.b)("p",null,"Get the number of calendar days between the given dates. This means that the times are removed from the dates and then the difference in days is calculated."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let differenceInCalendarDays: (Js.Date.t, Js.Date.t) => float\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let fstDate = Js.Date.makeWithYMD(~year=2019., ~month=0., ~date=1., ())\nlet sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=1., ())\n\nfstDate |> ReDate.differenceInCalendarDays(sndDate)\n")),Object(r.b)("h3",{id:"differenceindays"},"differenceInDays"),Object(r.b)("p",null,"Get the number of full day periods between the given dates."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let differenceInDays: (Js.Date.t, Js.Date.t) => float\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=10., ~hours=10., ~minutes=15., ~seconds=55., ())\nlet sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=2., ~hours=20., ~minutes=50., ~seconds=10., ())\n\nfstDate |> ReDate.differenceInDays(sndDate)\n")),Object(r.b)("h3",{id:"differenceinbusinessdays"},"differenceInBusinessDays"),Object(r.b)("p",null,"Get the number of full day periods between the given dates."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let differenceInBusinessDays: (Js.Date.t, Js.Date.t) => float\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let fstDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=10., ())\nlet sndDate = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=2., ())\n\nfstDate |> ReDate.differenceInBusinessDays(sndDate)\n")),Object(r.b)("h3",{id:"getdayofyear"},"getDayOfYear"),Object(r.b)("p",null,"Get the day of the year of the given date."),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let getDayOfYear: Js.Date.t => float\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=7., ~date=23., ())\n\ndate |> ReDate.getDayOfYear\n")),Object(r.b)("h3",{id:"issameday"},"isSameDay"),Object(r.b)("p",null,"Are the given dates in the same day?"),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isSameDay: (Js.Date.t, Js.Date.t) => bool\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let fstDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=16., ~minutes=50., ~seconds=12., ())\nlet sndDate = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=10., ~minutes=15., ~seconds=55., ())\n\nfstDate |> ReDate.isSameDay(sndDate)\n")),Object(r.b)("h3",{id:"istoday"},"isToday"),Object(r.b)("p",null,"Is the given date today?"),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isToday: Js.Date.t => bool\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.make()\n\ndate |> ReDate.isToday\n")),Object(r.b)("h3",{id:"istomorrow"},"isTomorrow"),Object(r.b)("p",null,"Is the given date tomorrow?"),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isTomorrow: Js.Date.t => bool\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.make()\n\ndate |> ReDate.addDays(.1) |> ReDate.isTomorrow\n")),Object(r.b)("h3",{id:"isyesterday"},"isYesterday"),Object(r.b)("p",null,"Is the given date yesterday?"),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isYesterday: Js.Date.t => bool\n")),Object(r.b)("pre",null,Object(r.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.make()\n\ndate |> ReDate.subDays(1.) |> ReDate.isYesterday\n")))}i.isMDXComponent=!0},88:function(e,t,a){"use strict";a.d(t,"a",(function(){return o})),a.d(t,"b",(function(){return j}));var n=a(0),s=a.n(n);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function c(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function d(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?c(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):c(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function l(e,t){if(null==e)return{};var a,n,s=function(e,t){if(null==e)return{};var a,n,s={},r=Object.keys(e);for(n=0;n<r.length;n++)a=r[n],t.indexOf(a)>=0||(s[a]=e[a]);return s}(e,t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);for(n=0;n<r.length;n++)a=r[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(s[a]=e[a])}return s}var b=s.a.createContext({}),i=function(e){var t=s.a.useContext(b),a=t;return e&&(a="function"==typeof e?e(t):d(d({},t),e)),a},o=function(e){var t=i(e.components);return s.a.createElement(b.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return s.a.createElement(s.a.Fragment,{},t)}},p=s.a.forwardRef((function(e,t){var a=e.components,n=e.mdxType,r=e.originalType,c=e.parentName,b=l(e,["components","mdxType","originalType","parentName"]),o=i(a),p=n,j=o["".concat(c,".").concat(p)]||o[p]||u[p]||r;return a?s.a.createElement(j,d(d({ref:t},b),{},{components:a})):s.a.createElement(j,d({ref:t},b))}));function j(e,t){var a=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var r=a.length,c=new Array(r);c[0]=p;var d={};for(var l in t)hasOwnProperty.call(t,l)&&(d[l]=t[l]);d.originalType=e,d.mdxType="string"==typeof e?e:n,c[1]=d;for(var b=2;b<r;b++)c[b]=a[b];return s.a.createElement.apply(null,c)}return s.a.createElement.apply(null,a)}p.displayName="MDXCreateElement"}}]);