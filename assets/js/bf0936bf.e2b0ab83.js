"use strict";(self.webpackChunkrescript_date_docs=self.webpackChunkrescript_date_docs||[]).push([[561],{3905:function(e,t,n){n.d(t,{Zo:function(){return c},kt:function(){return d}});var a=n(7294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function l(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?l(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):l(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},l=Object.keys(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)n=l[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var s=a.createContext({}),p=function(e){var t=a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},c=function(e){var t=p(e.components);return a.createElement(s.Provider,{value:t},e.children)},v={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},u=a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,l=e.originalType,s=e.parentName,c=o(e,["components","mdxType","originalType","parentName"]),u=p(n),d=r,m=u["".concat(s,".").concat(d)]||u[d]||v[d]||l;return n?a.createElement(m,i(i({ref:t},c),{},{components:n})):a.createElement(m,i({ref:t},c))}));function d(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=n.length,i=new Array(l);i[0]=u;var o={};for(var s in t)hasOwnProperty.call(t,s)&&(o[s]=t[s]);o.originalType=e,o.mdxType="string"==typeof e?e:r,i[1]=o;for(var p=2;p<l;p++)i[p]=n[p];return a.createElement.apply(null,i)}return a.createElement.apply(null,n)}u.displayName="MDXCreateElement"},7734:function(e,t,n){n.r(t),n.d(t,{frontMatter:function(){return o},contentTitle:function(){return s},metadata:function(){return p},toc:function(){return c},default:function(){return u}});var a=n(7462),r=n(3366),l=(n(7294),n(3905)),i=["components"],o={id:"interval",title:"Interval"},s=void 0,p={unversionedId:"interval",id:"interval",title:"Interval",description:"isWithinInterval",source:"@site/api/interval.md",sourceDirName:".",slug:"/interval",permalink:"/rescript-date/api/interval",tags:[],version:"current",frontMatter:{id:"interval",title:"Interval"},sidebar:"sidebar",previous:{title:"Common",permalink:"/rescript-date/api/common"},next:{title:"Second",permalink:"/rescript-date/api/second"}},c=[{value:"isWithinInterval",id:"iswithininterval",children:[],level:3},{value:"areIntervalsOverlapping",id:"areintervalsoverlapping",children:[],level:3},{value:"getOverlappingDaysInIntervals",id:"getoverlappingdaysinintervals",children:[],level:3},{value:"eachDayOfInterval",id:"eachdayofinterval",children:[],level:3}],v={toc:c};function u(e){var t=e.components,n=(0,r.Z)(e,i);return(0,l.kt)("wrapper",(0,a.Z)({},v,n,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"type interval = {\n  start: Js.Date.t,\n  end_: Js.Date.t,\n}\n")),(0,l.kt)("h3",{id:"iswithininterval"},"isWithinInterval"),(0,l.kt)("p",null,"Is the given date within the interval?"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let isWithinInterval: (Js.Date.t, interval) => bool\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let interval = {\n  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),\n  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),\n}\nlet date = Js.Date.makeWithYMD(~year=2018., ~month=0., ~date=5., ())\n\ndate->ReDate.isWithinInterval(interval)\n")),(0,l.kt)("h3",{id:"areintervalsoverlapping"},"areIntervalsOverlapping"),(0,l.kt)("p",null,"the given time interval overlapping with another time interval?"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let areIntervalsOverlapping: (interval, interval) => bool\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let interval = {\n  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),\n  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),\n}\nlet includedInterval = {\n  start: makeWithYMD(~year=2018., ~month=3., ~date=5., ()),\n  end_: makeWithYMD(~year=2018., ~month=4., ~date=5., ()),\n}\n\ninterval->ReDate.areIntervalsOverlapping(includedInterval)\n")),(0,l.kt)("h3",{id:"getoverlappingdaysinintervals"},"getOverlappingDaysInIntervals"),(0,l.kt)("p",null,"Get the number of days that overlap in two time intervals."),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let getOverlappingDaysInIntervals: (interval, interval) => float\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let interval = {\n  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=1., ()),\n  end_: Js.Date.makeWithYMD(~year=2018., ~month=4., ~date=10., ()),\n}\nlet includedInterval = {\n  start: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=5., ()),\n  end_: Js.Date.makeWithYMD(~year=2018., ~month=3., ~date=15., ()),\n}\n\ninterval->ReDate.getOverlappingDaysInIntervals(includedInterval)\n")),(0,l.kt)("h3",{id:"eachdayofinterval"},"eachDayOfInterval"),(0,l.kt)("p",null,"Return the array of dates within the specified time interval."),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let eachDayOfInterval: interval => array<Js.Date.t>\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-js"},"let interval = {\n  start: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=1., ~hours=19., ~minutes=30., ~seconds=22., ()),\n  end_: Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=5., ~hours=8., ~minutes=45., ~seconds=15., ()),\n}\n\ninterval->ReDate.eachDayOfInterval\n")))}u.isMDXComponent=!0}}]);