"use strict";(self.webpackChunkrescript_date_docs=self.webpackChunkrescript_date_docs||[]).push([[812],{3905:function(e,t,a){a.d(t,{Zo:function(){return k},kt:function(){return p}});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function s(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function i(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?s(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):s(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function l(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},s=Object.keys(e);for(n=0;n<s.length;n++)a=s[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var s=Object.getOwnPropertySymbols(e);for(n=0;n<s.length;n++)a=s[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var o=n.createContext({}),d=function(e){var t=n.useContext(o),a=t;return e&&(a="function"==typeof e?e(t):i(i({},t),e)),a},k=function(e){var t=d(e.components);return n.createElement(o.Provider,{value:t},e.children)},c={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},u=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,s=e.originalType,o=e.parentName,k=l(e,["components","mdxType","originalType","parentName"]),u=d(a),p=r,m=u["".concat(o,".").concat(p)]||u[p]||c[p]||s;return a?n.createElement(m,i(i({ref:t},k),{},{components:a})):n.createElement(m,i({ref:t},k))}));function p(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var s=a.length,i=new Array(s);i[0]=u;var l={};for(var o in t)hasOwnProperty.call(t,o)&&(l[o]=t[o]);l.originalType=e,l.mdxType="string"==typeof e?e:r,i[1]=l;for(var d=2;d<s;d++)i[d]=a[d];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}u.displayName="MDXCreateElement"},5625:function(e,t,a){a.r(t),a.d(t,{frontMatter:function(){return l},contentTitle:function(){return o},metadata:function(){return d},toc:function(){return k},default:function(){return u}});var n=a(7462),r=a(3366),s=(a(7294),a(3905)),i=["components"],l={id:"iso-week",title:"ISO Week"},o=void 0,d={unversionedId:"iso-week",id:"iso-week",title:"ISO Week",description:"ISO week date//en.wikipedia.org/wiki/ISOweekdate",source:"@site/api/iso-week.md",sourceDirName:".",slug:"/iso-week",permalink:"/rescript-date/api/iso-week",tags:[],version:"current",frontMatter:{id:"iso-week",title:"ISO Week"},sidebar:"sidebar",previous:{title:"Year",permalink:"/rescript-date/api/year"},next:{title:"ISO Week Numbering",permalink:"/rescript-date/api/iso-week-numbering"}},k=[{value:"endOfISOWeek",id:"endofisoweek",children:[],level:3},{value:"getISOWeek",id:"getisoweek",children:[],level:3},{value:"isSameISOWeek",id:"issameisoweek",children:[],level:3},{value:"isThisISOWeek",id:"isthisisoweek",children:[],level:3},{value:"lastDayOfISOWeek",id:"lastdayofisoweek",children:[],level:3},{value:"setISOWeek",id:"setisoweek",children:[],level:3},{value:"startOfISOWeek",id:"startofisoweek",children:[],level:3},{value:"differenceInCalendarISOWeeks",id:"differenceincalendarisoweeks",children:[],level:3}],c={toc:k};function u(e){var t=e.components,a=(0,r.Z)(e,i);return(0,s.kt)("wrapper",(0,n.Z)({},c,a,{components:t,mdxType:"MDXLayout"}),(0,s.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,s.kt)("div",{parentName:"div",className:"admonition-heading"},(0,s.kt)("h5",{parentName:"div"},(0,s.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,s.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,s.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"info")),(0,s.kt)("div",{parentName:"div",className:"admonition-content"},(0,s.kt)("p",{parentName:"div"},"ISO week date: ",(0,s.kt)("a",{parentName:"p",href:"http://en.wikipedia.org/wiki/ISO_week_date"},"http://en.wikipedia.org/wiki/ISO_week_date")))),(0,s.kt)("h3",{id:"endofisoweek"},"endOfISOWeek"),(0,s.kt)("p",null,"Return the end of a week for the given date."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let endOfISOWeek: Js.Date.t => Js.Date.t\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=10., ~hours=16., ~minutes=50., ~seconds=12., ())\n\ndate->ReDate.endOfISOWeek\n")),(0,s.kt)("h3",{id:"getisoweek"},"getISOWeek"),(0,s.kt)("p",null,"Get the ISO week of the given date."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let getISOWeek: Js.Date.t => float\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMDHMS(~year=2005., ~month=0., ~date=2., ~hours=16., ~minutes=50., ~seconds=12., ())\n\ndate->ReDate.getISOWeek\n")),(0,s.kt)("h3",{id:"issameisoweek"},"isSameISOWeek"),(0,s.kt)("p",null,"Are the given dates in the same ISO week?"),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let isSameISOWeek: (Js.Date.t, Js.Date.t) => bool\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let fstDate = Js.Date.makeWithYMDHMS(~year=2005., ~month=11., ~date=31., ~hours=16., ~minutes=50., ~seconds=12., ())\nlet sndDate = Js.Date.makeWithYMDHMS(~year=2006., ~month=0., ~date=1., ~hours=10., ~minutes=15., ~seconds=55., ())\n\nfstDate->ReDate.isSameISOWeek(sndDate)\n")),(0,s.kt)("h3",{id:"isthisisoweek"},"isThisISOWeek"),(0,s.kt)("p",null,"Is the given date in the same ISO week as the current date?"),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let isThisISOWeek: Js.Date.t => bool\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMDHMS(~year=2018., ~month=0., ~date=12., ~hours=16., ~minutes=50., ~seconds=12., ())\n\ndate->ReDate.isThisISOWeek\n")),(0,s.kt)("h3",{id:"lastdayofisoweek"},"lastDayOfISOWeek"),(0,s.kt)("p",null,"Return the last day of an ISO week for the given date. The result will be in the local timezone."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let lastDayOfISOWeek: Js.Date.t => bool\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMDHMS(~year=2014., ~month=8., ~date=2., ~hours=11., ~minutes=55., ~seconds=12., ())\n\ndate->ReDate.lastDayOfISOWeek\n")),(0,s.kt)("h3",{id:"setisoweek"},"setISOWeek"),(0,s.kt)("p",null,"Set the ISO week for the given date, preserving the weekday number. A new date will be returned, the original date will not be changed."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let setISOWeek: (Js.Date.t, float) => Js.Date.t\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMD(~year=2004., ~month=7., ~date=7., ())\n\ndate->ReDate.setISOWeek(53.)\n")),(0,s.kt)("h3",{id:"startofisoweek"},"startOfISOWeek"),(0,s.kt)("p",null,"Return the start of an ISO week for the given date. The result will be in the local timezone."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let startOfISOWeek: Js.Date.t => Js.Date.t\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let date = Js.Date.makeWithYMDHMS(~year=2014., ~month=8., ~date=2., ~hours=11., ~minutes=55., ~seconds=0., ())\n\ndate->ReDate.startOfISOWeek\n")),(0,s.kt)("h3",{id:"differenceincalendarisoweeks"},"differenceInCalendarISOWeeks"),(0,s.kt)("p",null,"Get the number of calendar ISO weeks between the given dates."),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let differenceInCalendarISOWeeks: (Js.Date.t, Js.Date.t) => int\n")),(0,s.kt)("pre",null,(0,s.kt)("code",{parentName:"pre",className:"language-js"},"let fstDate = Js.Date.makeWithYMDHMS(~year=2014., ~month=6., ~date=21., ~hours=23., ~minutes=59., ~seconds=59., ())\nlet sndDate = Js.Date.makeWithYMDHMS(~year=2014., ~month=6., ~date=6., ~hours=0., ~minutes=0., ~seconds=0., ())\n\nfstDate->ReDate.differenceInCalendarISOWeeks(sndDate)\n")))}u.isMDXComponent=!0}}]);