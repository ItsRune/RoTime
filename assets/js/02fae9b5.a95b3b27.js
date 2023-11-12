"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[331],{3905:(e,t,n)=>{n.d(t,{Zo:()=>u,kt:()=>g});var a=n(67294);function r(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function i(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);t&&(a=a.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,a)}return n}function o(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?i(Object(n),!0).forEach((function(t){r(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):i(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function l(e,t){if(null==e)return{};var n,a,r=function(e,t){if(null==e)return{};var n,a,r={},i=Object.keys(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||(r[n]=e[n]);return r}(e,t);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);for(a=0;a<i.length;a++)n=i[a],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var s=a.createContext({}),m=function(e){var t=a.useContext(s),n=t;return e&&(n="function"==typeof e?e(t):o(o({},t),e)),n},u=function(e){var t=m(e.components);return a.createElement(s.Provider,{value:t},e.children)},c="mdxType",p={inlineCode:"code",wrapper:function(e){var t=e.children;return a.createElement(a.Fragment,{},t)}},d=a.forwardRef((function(e,t){var n=e.components,r=e.mdxType,i=e.originalType,s=e.parentName,u=l(e,["components","mdxType","originalType","parentName"]),c=m(n),d=r,g=c["".concat(s,".").concat(d)]||c[d]||p[d]||i;return n?a.createElement(g,o(o({ref:t},u),{},{components:n})):a.createElement(g,o({ref:t},u))}));function g(e,t){var n=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var i=n.length,o=new Array(i);o[0]=d;var l={};for(var s in t)hasOwnProperty.call(t,s)&&(l[s]=t[s]);l.originalType=e,l[c]="string"==typeof e?e:r,o[1]=l;for(var m=2;m<i;m++)o[m]=n[m];return a.createElement.apply(null,o)}return a.createElement.apply(null,n)}d.displayName="MDXCreateElement"},24948:(e,t,n)=>{n.r(t),n.d(t,{contentTitle:()=>o,default:()=>c,frontMatter:()=>i,metadata:()=>l,toc:()=>s});var a=n(87462),r=(n(67294),n(3905));const i={},o="RoTime",l={type:"mdx",permalink:"/RoTime/",source:"@site/pages/index.md",title:"RoTime",description:"Table of Contents",frontMatter:{}},s=[{value:"Table of Contents",id:"table-of-contents",level:2},{value:'About <a name = "about"></a>',id:"about-",level:2},{value:'Getting Started <a name = "getting_started"></a>',id:"getting-started-",level:2},{value:'Usage <a name = "usage"></a>',id:"usage-",level:2},{value:"Formatting",id:"formatting",level:4},{value:"Timezones",id:"timezones",level:4},{value:"Adding / Subtracting",id:"adding--subtracting",level:4},{value:"Timers",id:"timers",level:4},{value:"Creating Timers",id:"creating-timers",level:5},{value:"Functions",id:"functions",level:5},{value:"Connections",id:"connections",level:5}],m={toc:s},u="wrapper";function c(e){let{components:t,...n}=e;return(0,r.kt)(u,(0,a.Z)({},m,n,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("h1",{id:"rotime"},"RoTime"),(0,r.kt)("h2",{id:"table-of-contents"},"Table of Contents"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"#about"},"About")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"#getting_started"},"Getting Started")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"#usage"},"Usage"))),(0,r.kt)("h2",{id:"about-"},"About ",(0,r.kt)("a",{name:"about"})),(0,r.kt)("p",null,"RoTime is a lightweight roblox module for manipulating, parsing, and validating times."),(0,r.kt)("h2",{id:"getting-started-"},"Getting Started ",(0,r.kt)("a",{name:"getting_started"})),(0,r.kt)("p",null,"These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Installation is pretty simple, just get the ",(0,r.kt)("a",{parentName:"p",href:"https://www.roblox.com/library/10459870631/RoTime"},"module")," and place it into ",(0,r.kt)("inlineCode",{parentName:"p"},"ReplicatedStorage")," then you're basically finished."),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},"local RoTime = require(10459870631)\n")),(0,r.kt)("h2",{id:"usage-"},"Usage ",(0,r.kt)("a",{name:"usage"})),(0,r.kt)("h4",{id:"formatting"},"Formatting"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'-- Formats to UTC time.\nlocal formatted = RoTime.new():format("#MM #d, #YYYY #h:#m") --\x3e August 3, 2022 4:31\n')),(0,r.kt)("h4",{id:"timezones"},"Timezones"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'local losAngelesTime = RoTime.new():timezone("America/Los_Angeles")\n\nprint(losAngelesTime:format("#mm/#d/#yyyy #h:#m #a")) --\x3e 8/2/2022 9:33 PM\n')),(0,r.kt)("h4",{id:"adding--subtracting"},"Adding / Subtracting"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'local oneHourAhead = RoTime.new():add(1, "hour")\nlocal oneMinuteBehind = RoTime.new():subtract(1, "minute")\n\n-- Assuming right now is 1:36\nprint(oneHourAhead:format("#h:#m")) --\x3e 2:36\nprint(oneMinuteBehind:format("#h:#m")) --\x3e 1:35\n')),(0,r.kt)("h4",{id:"timers"},"Timers"),(0,r.kt)("h5",{id:"creating-timers"},"Creating Timers"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'-- (howLong : number, type : string, step, startAt)\nlocal myTimer = RoTime.new().Timer(1, "minute", 1, 0)\n')),(0,r.kt)("h5",{id:"functions"},"Functions"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},"myTimer:Start() -- Starts the timer.\nmyTimer:Pause() -- Pauses the timer.\nmyTimer:Resume() -- Resumes the timer after being paused.\nmyTimer:Cancel() -- Cancels the timer entirely.\n")),(0,r.kt)("h5",{id:"connections"},"Connections"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-lua"},'-- elapsedTime will always be how many seconds since start.\nmyTimer.Changed:Connect(function(elapsedTime)\n    print("myTimer\'s elapsed time: " .. elapsedTime)\nend)\n\nmyTimer.Completed:Connect(function(elapsedTime, startingTime)\n    print("myTimer\'s finished!", "It elapsed " .. elapsedTime .. " seconds since start, and started at " .. startingTime .. " seconds.")\nend)\n')))}c.isMDXComponent=!0}}]);