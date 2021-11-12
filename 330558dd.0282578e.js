(window.webpackJsonp=window.webpackJsonp||[]).push([[4],{71:function(e,t,a){"use strict";a.r(t),a.d(t,"frontMatter",(function(){return c})),a.d(t,"metadata",(function(){return i})),a.d(t,"rightToc",(function(){return d})),a.d(t,"default",(function(){return b}));var n=a(3),r=a(7),s=(a(0),a(88)),c={id:"weekday",title:"Weekday"},i={unversionedId:"api/weekday",id:"api/weekday",isDocsHomePage:!1,title:"Weekday",description:"isSunday",source:"@site/docs/api/weekday.md",slug:"/api/weekday",permalink:"/rescript-date/docs/api/weekday",editUrl:"https://github.com/facebook/docusaurus/edit/master/website/docs/api/weekday.md",version:"current",sidebar:"sidebar",previous:{title:"Week Numbering",permalink:"/rescript-date/docs/api/week-numbering"},next:{title:"Month",permalink:"/rescript-date/docs/api/month"}},d=[{value:"isSunday",id:"issunday",children:[]},{value:"isMonday",id:"ismonday",children:[]},{value:"isTuesday",id:"istuesday",children:[]},{value:"isWednesday",id:"iswednesday",children:[]},{value:"isThursday",id:"isthursday",children:[]},{value:"isFriday",id:"isfriday",children:[]},{value:"isSaturday",id:"issaturday",children:[]},{value:"isWeekend",id:"isweekend",children:[]}],l={rightToc:d};function b(e){var t=e.components,a=Object(r.a)(e,["components"]);return Object(s.b)("wrapper",Object(n.a)({},l,a,{components:t,mdxType:"MDXLayout"}),Object(s.b)("h3",{id:"issunday"},"isSunday"),Object(s.b)("p",null,"Is the given date Sunday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isSunday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=7., ())\n\ndate |> ReDate.isSunday\n")),Object(s.b)("h3",{id:"ismonday"},"isMonday"),Object(s.b)("p",null,"Is the given date Monday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isMonday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=8., ())\n\ndate |> ReDate.isMonday\n")),Object(s.b)("h3",{id:"istuesday"},"isTuesday"),Object(s.b)("p",null,"Is the given date Tuesday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isTuesday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=9., ())\n\ndate |> ReDate.isTuesday\n")),Object(s.b)("h3",{id:"iswednesday"},"isWednesday"),Object(s.b)("p",null,"Is the given date Wednesday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isWednesday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=10., ())\n\ndate |> ReDate.isWednesday\n")),Object(s.b)("h3",{id:"isthursday"},"isThursday"),Object(s.b)("p",null,"Is the given date Thursday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isThursday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=11., ())\n\ndate |> ReDate.isThursday\n")),Object(s.b)("h3",{id:"isfriday"},"isFriday"),Object(s.b)("p",null,"Is the given date Friday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isFriday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=12., ())\n\ndate |> ReDate.isFriday\n")),Object(s.b)("h3",{id:"issaturday"},"isSaturday"),Object(s.b)("p",null,"Is the given date Saturday?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isSaturday: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ())\n\ndate |> ReDate.isSaturday\n")),Object(s.b)("h3",{id:"isweekend"},"isWeekend"),Object(s.b)("p",null,"Does the given date fall on a weekend?"),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let isWeekend: Js.Date.t => bool\n")),Object(s.b)("pre",null,Object(s.b)("code",Object(n.a)({parentName:"pre"},{className:"language-js"}),"let date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=13., ())\n\ndate |> ReDate.isWeekend\n")))}b.isMDXComponent=!0},88:function(e,t,a){"use strict";a.d(t,"a",(function(){return o})),a.d(t,"b",(function(){return y}));var n=a(0),r=a.n(n);function s(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function c(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function i(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?c(Object(a),!0).forEach((function(t){s(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):c(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function d(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},s=Object.keys(e);for(n=0;n<s.length;n++)a=s[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(e);for(n=0;n<s.length;n++)a=s[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var l=r.a.createContext({}),b=function(e){var t=r.a.useContext(l),a=t;return e&&(a="function"==typeof e?e(t):i(i({},t),e)),a},o=function(e){var t=b(e.components);return r.a.createElement(l.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return r.a.createElement(r.a.Fragment,{},t)}},p=r.a.forwardRef((function(e,t){var a=e.components,n=e.mdxType,s=e.originalType,c=e.parentName,l=d(e,["components","mdxType","originalType","parentName"]),o=b(a),p=n,y=o["".concat(c,".").concat(p)]||o[p]||u[p]||s;return a?r.a.createElement(y,i(i({ref:t},l),{},{components:a})):r.a.createElement(y,i({ref:t},l))}));function y(e,t){var a=arguments,n=t&&t.mdxType;if("string"==typeof e||n){var s=a.length,c=new Array(s);c[0]=p;var i={};for(var d in t)hasOwnProperty.call(t,d)&&(i[d]=t[d]);i.originalType=e,i.mdxType="string"==typeof e?e:n,c[1]=i;for(var l=2;l<s;l++)c[l]=a[l];return r.a.createElement.apply(null,c)}return r.a.createElement.apply(null,a)}p.displayName="MDXCreateElement"}}]);