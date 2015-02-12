window.google = window["google"] || {};google.friendconnect = google.friendconnect_ || {};if (!window['__ps_loaded__']) {/*http://www-a-fc-opensocial.googleusercontent.com/gadgets/js/rpc:core.util.js?c=1*/
window['___jsl'] = window['___jsl'] || {};(window['___jsl']['ci'] = (window['___jsl']['ci'] || [])).push({"rpc":{"commSwf":"//xpc.googleusercontent.com/gadgets/xpc.swf","passReferrer":"p2c:query","parentRelayUrl":"/rpc_relay.html"}});window['___jsl']=window['___jsl']||{};(window['___jsl']['ci'] = (window['___jsl']['ci'] || [])).push({"rpc":{"commSwf":"//xpc.googleusercontent.com/gadgets/xpc.swf","passReferrer":"p2c:query","parentRelayUrl":"/rpc_relay.html"}});
/* [start] feature=taming */
var safeJSON=window.safeJSON;
var tamings___=window.tamings___||[];
var bridge___;
var caja___=window.caja___;
var ___=window.___;;

/* [end] feature=taming */

/* [start] feature=gapi-globals */
var gapi=window.gapi||{};gapi.client=window.gapi&&window.gapi.client||{};
;
;

/* [end] feature=gapi-globals */

/* [start] feature=globals */
var gadgets=window.gadgets||{},shindig=window.shindig||{},osapi=window.osapi=window.osapi||{},google=window.google||{};
;
;

/* [end] feature=globals */

/* [start] feature=core.config.base */
window['___cfg'] = window['___cfg'] || window['___gcfg'];;
if(!window.gadgets["config"]){gadgets.config=function(){var f;
var h={};
var b={};
function c(j,l){for(var k in l){if(!l.hasOwnProperty(k)){continue
}if(typeof j[k]==="object"&&typeof l[k]==="object"){c(j[k],l[k])
}else{j[k]=l[k]
}}}function i(){var j=document.scripts||document.getElementsByTagName("script");
if(!j||j.length==0){return null
}var m;
if(f.u){for(var k=0;
!m&&k<j.length;
++k){var l=j[k];
if(l.src&&l.src.indexOf(f.u)==0){m=l
}}}if(!m){m=j[j.length-1]
}if(!m.src){return null
}return m
}function a(j){var k="";
if(j.nodeType==3||j.nodeType==4){k=j.nodeValue
}else{if(j.innerText){k=j.innerText
}else{if(j.innerHTML){k=j.innerHTML
}else{if(j.firstChild){var l=[];
for(var m=j.firstChild;
m;
m=m.nextSibling){l.push(a(m))
}k=l.join("")
}}}}return k
}function e(k){if(!k){return{}
}var j;
while(k.charCodeAt(k.length-1)==0){k=k.substring(0,k.length-1)
}try{j=(new Function("return ("+k+"\n)"))()
}catch(l){}if(typeof j==="object"){return j
}try{j=(new Function("return ({"+k+"\n})"))()
}catch(l){}return typeof j==="object"?j:{}
}function g(n){var p=window.___cfg;
if(p){c(n,p)
}var o=i();
if(!o){return
}var k=a(o);
var j=e(k);
if(f.f&&f.f.length==1){var m=f.f[0];
if(!j[m]){var l={};
l[f.f[0]]=j;
j=l
}}c(n,j)
}function d(o){for(var l in h){if(h.hasOwnProperty(l)){var n=h[l];
for(var m=0,k=n.length;
m<k;
++m){o(l,n[m])
}}}}return{register:function(l,k,j,m){var n=h[l];
if(!n){n=[];
h[l]=n
}n.push({validators:k||{},callback:j,callOnUpdate:m})
},get:function(j){if(j){return b[j]||{}
}return b
},init:function(k,j){f=window.___jsl||{};
c(b,k);
g(b);
var l=window.___config||{};
c(b,l);
d(function(q,p){var o=b[q];
if(o&&!j){var m=p.validators;
for(var n in m){if(m.hasOwnProperty(n)){if(!m[n](o[n])){throw new Error('Invalid config value "'+o[n]+'" for parameter "'+n+'" in component "'+q+'"')
}}}}if(p.callback){p.callback(b)
}})
},update:function(k,p){var o=(window.gapi&&window.gapi["config"]&&window.gapi["config"]["update"]);
if(!p&&o){o(k)
}var n=[];
d(function(q,j){if(k.hasOwnProperty(q)||(p&&b&&b[q])){if(j.callback&&j.callOnUpdate){n.push(j.callback)
}}});
b=p?{}:b||{};
c(b,k);
for(var m=0,l=n.length;
m<l;
++m){n[m](b)
}}}
}()
}else{gadgets.config=window.gadgets["config"];
gadgets.config.register=gadgets.config.register;
gadgets.config.get=gadgets.config.get;
gadgets.config.init=gadgets.config.init;
gadgets.config.update=gadgets.config.update
};;

/* [end] feature=core.config.base */

/* [start] feature=core.log */
gadgets.log=(function(){var e=1;
var a=2;
var f=3;
var c=4;
var d=function(i){b(e,i)
};
gadgets.warn=function(i){b(a,i)
};
gadgets.error=function(i){b(f,i)
};
gadgets.debug=function(i){};
gadgets.setLogLevel=function(i){h=i
};
function b(k,i){if(k<h||!g){return
}if(k===a&&g.warn){g.warn(i)
}else{if(k===f&&g.error){try{g.error(i)
}catch(j){}}else{if(g.log){g.log(i)
}}}}d.INFO=e;
d.WARNING=a;
d.NONE=c;
var h=e;
var g=window.console?window.console:window.opera?window.opera.postError:undefined;
return d
})();;
;

/* [end] feature=core.log */

/* [start] feature=gapi.util-globals */
gapi.util=window.gapi&&window.gapi.util||{};
;

/* [end] feature=gapi.util-globals */

/* [start] feature=core.config */
(function(){gadgets.config.EnumValidator=function(d){var c=[];
if(arguments.length>1){for(var b=0,a;
(a=arguments[b]);
++b){c.push(a)
}}else{c=d
}return function(f){for(var e=0,g;
(g=c[e]);
++e){if(f===c[e]){return true
}}return false
}
};
gadgets.config.RegExValidator=function(a){return function(b){return a.test(b)
}
};
gadgets.config.ExistsValidator=function(a){return typeof a!=="undefined"
};
gadgets.config.NonEmptyStringValidator=function(a){return typeof a==="string"&&a.length>0
};
gadgets.config.BooleanValidator=function(a){return typeof a==="boolean"
};
gadgets.config.LikeValidator=function(a){return function(c){for(var d in a){if(a.hasOwnProperty(d)){var b=a[d];
if(!b(c[d])){return false
}}}return true
}
}
})();;

/* [end] feature=core.config */

/* [start] feature=core.util.base */
gadgets.util=gadgets.util||{};
(function(){gadgets.util.makeClosure=function(d,f,e){var c=[];
for(var b=2,a=arguments.length;
b<a;
++b){c.push(arguments[b])
}return function(){var g=c.slice();
for(var k=0,h=arguments.length;
k<h;
++k){g.push(arguments[k])
}return f.apply(d,g)
}
};
gadgets.util.makeEnum=function(b){var c,a,d={};
for(c=0;
(a=b[c]);
++c){d[a]=a
}return d
}
})();;

/* [end] feature=core.util.base */

/* [start] feature=core.util.dom */
gadgets.util=gadgets.util||{};
(function(){var c="http://www.w3.org/1999/xhtml";
function b(f,e){var h=e||{};
for(var g in h){if(h.hasOwnProperty(g)){f[g]=h[g]
}}}function d(g,f){var e=["<",g];
var i=f||{};
for(var h in i){if(i.hasOwnProperty(h)){e.push(" ");
e.push(h);
e.push('="');
e.push(gadgets.util.escapeString(i[h]));
e.push('"')
}}e.push("></");
e.push(g);
e.push(">");
return e.join("")
}function a(f){var g="";
if(f.nodeType==3||f.nodeType==4){g=f.nodeValue
}else{if(f.innerText){g=f.innerText
}else{if(f.innerHTML){g=f.innerHTML
}else{if(f.firstChild){var e=[];
for(var h=f.firstChild;
h;
h=h.nextSibling){e.push(a(h))
}g=e.join("")
}}}}return g
}gadgets.util.createElement=function(f){var e;
if((!document.body)||document.body.namespaceURI){try{e=document.createElementNS(c,f)
}catch(g){}}return e||document.createElement(f)
};
gadgets.util.createIframeElement=function(g){var i=gadgets.util.createElement("iframe");
try{var e=d("iframe",g);
var f=gadgets.util.createElement(e);
if(f&&((!i)||((f.tagName==i.tagName)&&(f.namespaceURI==i.namespaceURI)))){i=f
}}catch(h){}b(i,g);
return i
};
gadgets.util.getBodyElement=function(){if(document.body){return document.body
}try{var f=document.getElementsByTagNameNS(c,"body");
if(f&&(f.length==1)){return f[0]
}}catch(e){}return document.documentElement||document
};
gadgets.util.getInnerText=function(e){return a(e)
}
})();;

/* [end] feature=core.util.dom */

/* [start] feature=core.util.event */
gadgets.util=gadgets.util||{};
(function(){gadgets.util.attachBrowserEvent=function(c,b,d,a){if(typeof c.addEventListener!="undefined"){c.addEventListener(b,d,a)
}else{if(typeof c.attachEvent!="undefined"){c.attachEvent("on"+b,d)
}else{gadgets.warn("cannot attachBrowserEvent: "+b)
}}};
gadgets.util.removeBrowserEvent=function(c,b,d,a){if(c.removeEventListener){c.removeEventListener(b,d,a)
}else{if(c.detachEvent){c.detachEvent("on"+b,d)
}else{gadgets.warn("cannot removeBrowserEvent: "+b)
}}}
})();;

/* [end] feature=core.util.event */

/* [start] feature=core.util.onload */
gadgets.util=gadgets.util||{};
(function(){var a=[];
gadgets.util.registerOnLoadHandler=function(b){a.push(b)
};
gadgets.util.runOnLoadHandlers=function(){for(var c=0,b=a.length;
c<b;
++c){a[c]()
}}
})();;

/* [end] feature=core.util.onload */

/* [start] feature=core.util.string */
gadgets.util=gadgets.util||{};
(function(){var a={0:false,10:true,13:true,34:true,39:true,60:true,62:true,92:true,8232:true,8233:true,65282:true,65287:true,65308:true,65310:true,65340:true};
function b(c,d){return String.fromCharCode(d)
}gadgets.util.escape=function(c,g){if(!c){return c
}else{if(typeof c==="string"){return gadgets.util.escapeString(c)
}else{if(typeof c==="Array"){for(var f=0,d=c.length;
f<d;
++f){c[f]=gadgets.util.escape(c[f])
}}else{if(typeof c==="object"&&g){var e={};
for(var h in c){if(c.hasOwnProperty(h)){e[gadgets.util.escapeString(h)]=gadgets.util.escape(c[h],true)
}}return e
}}}}return c
};
gadgets.util.escapeString=function(g){if(!g){return g
}var d=[],f,h;
for(var e=0,c=g.length;
e<c;
++e){f=g.charCodeAt(e);
h=a[f];
if(h===true){d.push("&#",f,";")
}else{if(h!==false){d.push(g.charAt(e))
}}}return d.join("")
};
gadgets.util.unescapeString=function(c){if(!c){return c
}return c.replace(/&#([0-9]+);/g,b)
}
})();;

/* [end] feature=core.util.string */

/* [start] feature=core.util.urlparams */
gadgets.util=gadgets.util||{};
(function(){var a=null;
function b(e){var f;
var c=e.indexOf("?");
var d=e.indexOf("#");
if(d===-1){f=e.substr(c+1)
}else{f=[e.substr(c+1,d-c-1),"&",e.substr(d+1)].join("")
}return f.split("&")
}gadgets.util.getUrlParameters=function(p){var d=typeof p==="undefined";
if(a!==null&&d){return a
}var l={};
var f=b(p||window.location.href);
var n=window.decodeURIComponent?decodeURIComponent:unescape;
for(var h=0,g=f.length;
h<g;
++h){var m=f[h].indexOf("=");
if(m===-1){continue
}var c=f[h].substring(0,m);
var o=f[h].substring(m+1);
o=o.replace(/\+/g," ");
try{l[c]=n(o)
}catch(k){}}if(d){a=l
}return l
};
gadgets.util.getUrlParameters()
})();;

/* [end] feature=core.util.urlparams */

/* [start] feature=gapi.util.getOrigin */
gapi.util.getOrigin=function(a){if(!a)return"";a=a.split("#")[0].split("?")[0];a=a.toLowerCase();0==a.indexOf("//")&&(a=window.location.protocol+a);/^[\w\-]*:\/\//.test(a)||(a=window.location.href);var b=a.substring(a.indexOf("://")+3),c=b.indexOf("/");-1!=c&&(b=b.substring(0,c));a=a.substring(0,a.indexOf("://"));if("http"!==a&&"https"!==a&&"chrome-extension"!==a&&"file"!==a)throw Error("Invalid URI scheme in origin");var c="",d=b.indexOf(":");if(-1!=d){var e=b.substring(d+1),b=b.substring(0,d);if("http"===
a&&"80"!==e||"https"===a&&"443"!==e)c=":"+e}return a+"://"+b+c};
;

/* [end] feature=gapi.util.getOrigin */

/* [start] feature=core.json */
if(window.JSON&&window.JSON.parse&&window.JSON.stringify){gadgets.json=(function(){var a=/___$/;
function b(d,e){var c=this[d];
return c
}return{parse:function(d){try{return window.JSON.parse(d)
}catch(c){return false
}},stringify:function(d){var h=window.JSON.stringify;
function f(e){return h.call(this,e,b)
}var g=(Array.prototype.toJSON&&h([{x:1}])==='"[{\\"x\\": 1}]"')?f:h;
try{return g(d,function(i,e){return !a.test(i)?e:void 0
})
}catch(c){return null
}}}
})()
};;
;
if(!(window.JSON&&window.JSON.parse&&window.JSON.stringify)){gadgets.json=function(){function f(n){return n<10?"0"+n:n
}Date.prototype.toJSON=function(){return[this.getUTCFullYear(),"-",f(this.getUTCMonth()+1),"-",f(this.getUTCDate()),"T",f(this.getUTCHours()),":",f(this.getUTCMinutes()),":",f(this.getUTCSeconds()),"Z"].join("")
};
var m={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"};
function stringify(value){var a,i,k,l,r=/[\"\\\x00-\x1f\x7f-\x9f]/g,v;
switch(typeof value){case"string":return r.test(value)?'"'+value.replace(r,function(a){var c=m[a];
if(c){return c
}c=a.charCodeAt();
return"\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16)
})+'"':'"'+value+'"';
case"number":return isFinite(value)?String(value):"null";
case"boolean":case"null":return String(value);
case"object":if(!value){return"null"
}a=[];
if(typeof value.length==="number"&&!value.propertyIsEnumerable("length")){l=value.length;
for(i=0;
i<l;
i+=1){a.push(stringify(value[i])||"null")
}return"["+a.join(",")+"]"
}for(k in value){if(/___$/.test(k)){continue
}if(value.hasOwnProperty(k)){if(typeof k==="string"){v=stringify(value[k]);
if(v){a.push(stringify(k)+":"+v)
}}}}return"{"+a.join(",")+"}"
}return""
}return{stringify:stringify,parse:function(text){if(/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/b-u]/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){return eval("("+text+")")
}return false
}}
}()
};;
gadgets.json.flatten=function(c){var d={};
if(c===null||c===undefined){return d
}for(var a in c){if(c.hasOwnProperty(a)){var b=c[a];
if(null===b||undefined===b){continue
}d[a]=(typeof b==="string")?b:gadgets.json.stringify(b)
}}return d
};;

/* [end] feature=core.json */

/* [start] feature=core.util */
gadgets.util=gadgets.util||{};
(function(){var b={};
var a={};
function c(d){b=d["core.util"]||{}
}if(gadgets.config){gadgets.config.register("core.util",null,c)
}gadgets.util.getFeatureParameters=function(d){return typeof b[d]==="undefined"?null:b[d]
};
gadgets.util.hasFeature=function(d){return typeof b[d]!=="undefined"
};
gadgets.util.getServices=function(){return a
}
})();;

/* [end] feature=core.util */

/* [start] feature=rpc */
gadgets.rpctx=gadgets.rpctx||{};
if(!gadgets.rpctx.wpm){gadgets.rpctx.wpm=function(){var e,d;
var c=true;
function b(h,j,g){if(typeof window.addEventListener!="undefined"){window.addEventListener(h,j,g)
}else{if(typeof window.attachEvent!="undefined"){window.attachEvent("on"+h,j)
}}if(h==="message"){window.___jsl=window.___jsl||{};
var i=window.___jsl;
i.RPMQ=i.RPMQ||[];
i.RPMQ.push(j)
}}function a(h,i,g){if(window.removeEventListener){window.removeEventListener(h,i,g)
}else{if(window.detachEvent){window.detachEvent("on"+h,i)
}}}function f(h){var i=gadgets.json.parse(h.data);
if(!i||!i.f){return
}gadgets.debug("gadgets.rpc.receive("+window.name+"): "+h.data);
var g=gadgets.rpc.getTargetOrigin(i.f);
if(c&&(typeof h.origin!=="undefined"?h.origin!==g:h.domain!==/^.+:\/\/([^:]+).*/.exec(g)[1])){gadgets.error("Invalid rpc message origin. "+g+" vs "+(h.origin||""));
return
}e(i,h.origin)
}return{getCode:function(){return"wpm"
},isParentVerifiable:function(){return true
},init:function(h,i){function g(k){var j=k&&k.rpc||{};
if(String(j.disableForceSecure)==="true"){c=false
}}gadgets.config.register("rpc",null,g);
e=h;
d=i;
b("message",f,false);
d("..",true);
return true
},setup:function(h,g){d(h,true);
return true
},call:function(h,k,j){var g=gadgets.rpc.getTargetOrigin(h);
var i=gadgets.rpc._getTargetWin(h);
if(g){window.setTimeout(function(){var l=gadgets.json.stringify(j);
gadgets.debug("gadgets.rpc.send("+window.name+"): "+l);
i.postMessage(l,g)
},0)
}else{if(h!=".."){gadgets.error("No relay set (used as window.postMessage targetOrigin), cannot send cross-domain message")
}}return true
}}
}()
};;

       gadgets.rpctx.ifpc = gadgets.rpctx.wpm;
    ;
if(!window.gadgets||!window.gadgets["rpc"]){gadgets.rpc=function(){var M="__cb";
var S="";
var T="__ack";
var f=500;
var G=10;
var b="|";
var u="callback";
var g="origin";
var r="referer";
var s="legacy__";
var q={};
var W={};
var D={};
var B={};
var z=0;
var l={};
var m={};
var d={};
var n={};
var E={};
var e=null;
var p=null;
var A=(window.top!==window.self);
var v=window.name;
var J=function(){};
var P=0;
var Y=1;
var a=2;
var x=window.console;
var V=x&&x.log&&function(ae){x.log(ae)
}||function(){};
var R=(function(){function ae(af){return function(){V(af+": call ignored")
}
}return{getCode:function(){return"noop"
},isParentVerifiable:function(){return true
},init:ae("init"),setup:ae("setup"),call:ae("call")}
})();
if(gadgets.util){d=gadgets.util.getUrlParameters()
}function K(){if(d.rpctx=="flash"){return gadgets.rpctx.flash
}if(d.rpctx=="rmr"){return gadgets.rpctx.rmr
}var ae=typeof window.postMessage==="function"?gadgets.rpctx.wpm:typeof window.postMessage==="object"?gadgets.rpctx.wpm:window.ActiveXObject?(gadgets.rpctx.flash?gadgets.rpctx.flash:(gadgets.rpctx.nix?gadgets.rpctx.nix:gadgets.rpctx.ifpc)):navigator.userAgent.indexOf("WebKit")>0?gadgets.rpctx.rmr:navigator.product==="Gecko"?gadgets.rpctx.frameElement:gadgets.rpctx.ifpc;
if(!ae){ae=R
}return ae
}function k(aj,ah){if(n[aj]){return
}var af=H;
if(!ah){af=R
}n[aj]=af;
var ae=E[aj]||[];
for(var ag=0;
ag<ae.length;
++ag){var ai=ae[ag];
ai.t=F(aj);
af.call(aj,ai.f,ai)
}E[aj]=[]
}var I=false,U=false;
function N(){if(U){return
}function ae(){I=true
}if(typeof window.addEventListener!="undefined"){window.addEventListener("unload",ae,false)
}else{if(typeof window.attachEvent!="undefined"){window.attachEvent("onunload",ae)
}}U=true
}function j(ae,ai,af,ah,ag){if(!B[ai]||B[ai]!==af){gadgets.error("Invalid gadgets.rpc token. "+B[ai]+" vs "+af);
J(ai,a)
}ag.onunload=function(){if(m[ai]&&!I){J(ai,Y);
gadgets.rpc.removeReceiver(ai)
}};
N();
ah=gadgets.json.parse(decodeURIComponent(ah))
}function Z(ak,af){if(ak&&typeof ak.s==="string"&&typeof ak.f==="string"&&ak.a instanceof Array){if(B[ak.f]){if(B[ak.f]!==ak.t){gadgets.error("Invalid gadgets.rpc token. "+B[ak.f]+" vs "+ak.t);
J(ak.f,a)
}}if(ak.s===T){window.setTimeout(function(){k(ak.f,true)
},0);
return
}if(ak.c){ak[u]=function(al){var am=ak.g?s:"";
gadgets.rpc.call(ak.f,am+M,null,ak.c,al)
}
}if(af){var ag=t(af);
ak[g]=af;
var ah=ak.r,aj;
try{aj=t(ah)
}catch(ai){}if(!ah||aj!=ag){ah=af
}ak[r]=ah
}var ae=(q[ak.s]||q[S]).apply(ak,ak.a);
if(ak.c&&typeof ae!=="undefined"){gadgets.rpc.call(ak.f,M,null,ak.c,ae)
}}}function t(ag){if(!ag){return""
}ag=((ag.split("#"))[0].split("?"))[0];
ag=ag.toLowerCase();
if(ag.indexOf("//")==0){ag=window.location.protocol+ag
}if(ag.indexOf("://")==-1){ag=window.location.protocol+"//"+ag
}var ah=ag.substring(ag.indexOf("://")+3);
var ae=ah.indexOf("/");
if(ae!=-1){ah=ah.substring(0,ae)
}var aj=ag.substring(0,ag.indexOf("://"));
if(aj!=="http"&&aj!=="https"&&aj!=="chrome-extension"&&aj!=="file"){throw Error("Invalid URI scheme in origin")
}var ai="";
var ak=ah.indexOf(":");
if(ak!=-1){var af=ah.substring(ak+1);
ah=ah.substring(0,ak);
if((aj==="http"&&af!=="80")||(aj==="https"&&af!=="443")){ai=":"+af
}}return aj+"://"+ah+ai
}function C(af,ae){return"/"+af+(ae?b+ae:"")
}function y(ah){if(ah.charAt(0)=="/"){var af=ah.indexOf(b);
var ag=af>0?ah.substring(1,af):ah.substring(1);
var ae=af>0?ah.substring(af+1):null;
return{id:ag,origin:ae}
}else{return null
}}function ad(ag){if(typeof ag==="undefined"||ag===".."){return window.parent
}var af=y(ag);
if(af){return window.top.frames[af.id]
}ag=String(ag);
var ae=window.frames[ag];
if(ae){return ae
}ae=document.getElementById(ag);
if(ae&&ae.contentWindow){return ae.contentWindow
}return null
}function L(ah){var ag=null;
var ae=O(ah);
if(ae){ag=ae
}else{var af=y(ah);
if(af){ag=af.origin
}else{if(ah==".."){ag=d.parent
}else{ag=document.getElementById(ah).src
}}}return t(ag)
}var H=K();
q[S]=function(){V("Unknown RPC service: "+this["s"])
};
q[M]=function(af,ae){var ag=l[af];
if(ag){delete l[af];
ag.call(this,ae)
}};
function X(ag,ae){if(m[ag]===true){return
}if(typeof m[ag]==="undefined"){m[ag]=0
}var af=ad(ag);
if(ag===".."||af!=null){if(H.setup(ag,ae)===true){m[ag]=true;
return
}}if(m[ag]!==true&&m[ag]++<G){window.setTimeout(function(){X(ag,ae)
},f)
}else{n[ag]=R;
m[ag]=true
}}function O(af){var ae=W[af];
if(ae&&ae.substring(0,1)==="/"){if(ae.substring(1,2)==="/"){ae=document.location.protocol+ae
}else{ae=document.location.protocol+"//"+document.location.host+ae
}}return ae
}function ac(af,ae,ag){if(ae&&!/http(s)?:\/\/.+/.test(ae)){if(ae.indexOf("//")==0){ae=window.location.protocol+ae
}else{if(ae.charAt(0)=="/"){ae=window.location.protocol+"//"+window.location.host+ae
}else{if(ae.indexOf("://")==-1){ae=window.location.protocol+"//"+ae
}}}}W[af]=ae;
if(typeof ag!=="undefined"){D[af]=!!ag
}}function F(ae){return B[ae]
}function c(ae,af){af=af||"";
B[ae]=String(af);
X(ae,af)
}function ab(af){var ae=af.passReferrer||"";
var ag=ae.split(":",2);
e=ag[0]||"none";
p=ag[1]||"origin"
}function aa(ae){if(Q(ae)){H=gadgets.rpctx.ifpc||R;
H.init(Z,k)
}}function Q(ae){return String(ae.useLegacyProtocol)==="true"
}function h(af,ae){function ag(aj){var ai=aj&&aj.rpc||{};
ab(ai);
var ah=ai.parentRelayUrl||"";
ah=t(d.parent||ae)+ah;
ac("..",ah,Q(ai));
aa(ai);
c("..",af)
}if(!d.parent&&ae){ag({});
return
}gadgets.config.register("rpc",null,ag)
}function o(af,aj,al){var ai=null;
if(af.charAt(0)!="/"){if(!gadgets.util){return
}ai=document.getElementById(af);
if(!ai){throw new Error("Cannot set up gadgets.rpc receiver with ID: "+af+", element not found.")
}}var ae=ai&&ai.src;
var ag=aj||gadgets.rpc.getOrigin(ae);
ac(af,ag);
var ak=gadgets.util.getUrlParameters(ae);
var ah=al||ak.rpctoken;
c(af,ah)
}function i(ae,ag,ah){if(ae===".."){var af=ah||d.rpctoken||d.ifpctok||"";
h(af,ag)
}else{o(ae,ag,ah)
}}function w(ag){if(e==="bidir"||(e==="c2p"&&ag==="..")||(e==="p2c"&&ag!=="..")){var af=window.location.href;
var ah="?";
if(p==="query"){ah="#"
}else{if(p==="hash"){return af
}}var ae=af.lastIndexOf(ah);
ae=ae===-1?af.length:ae;
return af.substring(0,ae)
}return null
}return{config:function(ae){if(typeof ae.securityCallback==="function"){J=ae.securityCallback
}},register:function(af,ae){if(af===M||af===T){throw new Error("Cannot overwrite callback/ack service")
}if(af===S){throw new Error("Cannot overwrite default service: use registerDefault")
}q[af]=ae
},unregister:function(ae){if(ae===M||ae===T){throw new Error("Cannot delete callback/ack service")
}if(ae===S){throw new Error("Cannot delete default service: use unregisterDefault")
}delete q[ae]
},registerDefault:function(ae){q[S]=ae
},unregisterDefault:function(){delete q[S]
},forceParentVerifiable:function(){if(!H.isParentVerifiable()){H=gadgets.rpctx.ifpc
}},call:function(ae,ag,al,aj){ae=ae||"..";
var ak="..";
if(ae===".."){ak=v
}else{if(ae.charAt(0)=="/"){ak=C(v,gadgets.rpc.getOrigin(window.location.href))
}}++z;
if(al){l[z]=al
}var ai={s:ag,f:ak,c:al?z:0,a:Array.prototype.slice.call(arguments,3),t:B[ae],l:!!D[ae]};
var af=w(ae);
if(af){ai.r=af
}if(ae!==".."&&y(ae)==null&&!document.getElementById(ae)){return
}var ah=n[ae];
if(!ah&&y(ae)!==null){ah=H
}if(ag.indexOf(s)===0){ah=H;
ai.s=ag.substring(s.length);
ai.c=ai.c?ai.c:z
}ai.g=true;
ai.r=ak;
if(!ah){if(!E[ae]){E[ae]=[ai]
}else{E[ae].push(ai)
}return
}if(D[ae]){ah=gadgets.rpctx.ifpc
}if(ah.call(ae,ak,ai)===false){n[ae]=R;
H.call(ae,ak,ai)
}},getRelayUrl:O,setRelayUrl:ac,setAuthToken:c,setupReceiver:i,getAuthToken:F,removeReceiver:function(ae){delete W[ae];
delete D[ae];
delete B[ae];
delete m[ae];
delete n[ae]
},getRelayChannel:function(){return H.getCode()
},receive:function(af,ae){if(af.length>4){H._receiveMessage(af,Z)
}else{j.apply(null,af.concat(ae))
}},receiveSameDomain:function(ae){ae.a=Array.prototype.slice.call(ae.a);
window.setTimeout(function(){Z(ae)
},0)
},getOrigin:t,getTargetOrigin:L,init:function(){if(H.init(Z,k)===false){H=R
}if(A){i("..")
}else{gadgets.config.register("rpc",null,function(af){var ae=af.rpc||{};
ab(ae);
aa(ae)
})
}},_getTargetWin:ad,_parseSiblingId:y,ACK:T,RPC_ID:v||"..",SEC_ERROR_LOAD_TIMEOUT:P,SEC_ERROR_FRAME_PHISH:Y,SEC_ERROR_FORGED_MSG:a}
}();
gadgets.rpc.init()
}else{if(typeof gadgets.rpc=="undefined"||!gadgets.rpc){gadgets.rpc=window.gadgets["rpc"];
gadgets.rpc.config=gadgets.rpc.config;
gadgets.rpc.register=gadgets.rpc.register;
gadgets.rpc.unregister=gadgets.rpc.unregister;
gadgets.rpc.registerDefault=gadgets.rpc.registerDefault;
gadgets.rpc.unregisterDefault=gadgets.rpc.unregisterDefault;
gadgets.rpc.forceParentVerifiable=gadgets.rpc.forceParentVerifiable;
gadgets.rpc.call=gadgets.rpc.call;
gadgets.rpc.getRelayUrl=gadgets.rpc.getRelayUrl;
gadgets.rpc.setRelayUrl=gadgets.rpc.setRelayUrl;
gadgets.rpc.setAuthToken=gadgets.rpc.setAuthToken;
gadgets.rpc.setupReceiver=gadgets.rpc.setupReceiver;
gadgets.rpc.getAuthToken=gadgets.rpc.getAuthToken;
gadgets.rpc.removeReceiver=gadgets.rpc.removeReceiver;
gadgets.rpc.getRelayChannel=gadgets.rpc.getRelayChannel;
gadgets.rpc.receive=gadgets.rpc.receive;
gadgets.rpc.receiveSameDomain=gadgets.rpc.receiveSameDomain;
gadgets.rpc.getOrigin=gadgets.rpc.getOrigin;
gadgets.rpc.getTargetOrigin=gadgets.rpc.getTargetOrigin;
gadgets.rpc._getTargetWin=gadgets.rpc._getTargetWin;
gadgets.rpc._parseSiblingId=gadgets.rpc._parseSiblingId
}};;

/* [end] feature=rpc */
gadgets.config.init({"rpc":{"commSwf":"//xpc.googleusercontent.com/gadgets/xpc.swf","passReferrer":"p2c:query","parentRelayUrl":"/rpc_relay.html"}});
(function(){var j=window['___jsl']=window['___jsl']||{};j['l']=(j['l']||[]).concat(['rpc','core.util']);})();(function(){var j=window['___jsl']=window['___jsl']||{};if(j['c']){j['c']();delete j['c'];}})();var friendconnect_serverBase = "http://www.google.com";var friendconnect_loginUrl = "https://www.google.com/accounts";var friendconnect_gadgetPrefix = "http://www-a-fc-opensocial.googleusercontent.com/gadgets";
var friendconnect_serverVersion = "0.1-22c1fc1e_73bd0b97_5210c63e_9006a6ed_2b8a2ccb.7";
var friendconnect_imageUrl = "http://www.google.com/friendconnect/scs/images";
var friendconnect_lightbox = true;
var fca=gadgets,fcb=Error,fcc=friendconnect_serverBase,fcd=encodeURIComponent,fcaa=parseInt,fce=String,fcf=window,fcba=setTimeout,fcca=Object,fcg=document,fch=Array,fci=Math;function fcda(a,b){return a.length=b}function fcea(a,b){return a.className=b}function fcj(a,b){return a.width=b}function fck(a,b){return a.innerHTML=b}function fcl(a,b){return a.height=b}
var fcm="appendChild",fcn="push",fcfa="toString",fco="length",fcga="propertyIsEnumerable",fcha="stringify",fc="prototype",fcia="test",fcja="shift",fcp="width",fcq="round",fcr="slice",fcs="replace",fct="document",fcka="data",fcu="split",fcv="getElementById",fcw="charAt",fcx="location",fcy="getUrlParameters",fcz="indexOf",fcla="Dialog",fcA="style",fcB="body",fcma="left",fcC="call",fcD="match",fcE="options",fcna="lastIndexOf",fcoa="random",fcF="createElement",fcG="json",fcH="addEventListener",fcI="setAttribute",
fcpa="href",fcqa="substring",fcra="getContentElement",fcJ="util",fcsa="maxHeight",fcta="type",fcK="apply",fcua="auth",fcva="reset",fcwa="getSecurityToken",fcxa="bind",fcL="name",fcya="display",fcM="height",fcN="register",fcO="join",fcza="unshift",fcAa="toLowerCase",fcP="right",goog=goog||{},fcQ=this,fcBa=function(a,b,c){a=a[fcu](".");c=c||fcQ;a[0]in c||!c.execScript||c.execScript("var "+a[0]);for(var d;a[fco]&&(d=a[fcja]());)a[fco]||void 0===b?c=c[d]?c[d]:c[d]={}:c[d]=b},fcCa=function(a){var b=typeof a;
if("object"==b)if(a){if(a instanceof fch)return"array";if(a instanceof fcca)return b;var c=fcca[fc][fcfa][fcC](a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a[fco]&&"undefined"!=typeof a.splice&&"undefined"!=typeof a[fcga]&&!a[fcga]("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a[fcC]&&"undefined"!=typeof a[fcga]&&!a[fcga]("call"))return"function"}else return"null";else if("function"==b&&"undefined"==typeof a[fcC])return"object";return b},
fcDa=function(a){return void 0!==a},fcEa=function(a){var b=fcCa(a);return"array"==b||"object"==b&&"number"==typeof a[fco]},fcR=function(a){return"string"==typeof a},fcFa=function(a){var b=typeof a;return"object"==b&&null!=a||"function"==b};fci[fcoa]();
var fcS=function(a){var b=fcCa(a);if("object"==b||"array"==b){if(a.clone)return a.clone();var b="array"==b?[]:{},c;for(c in a)b[c]=fcS(a[c]);return b}return a},fcGa=function(a,b,c){return a[fcC][fcK](a[fcxa],arguments)},fcHa=function(a,b,c){if(!a)throw fcb();if(2<arguments[fco]){var d=fch[fc][fcr][fcC](arguments,2);return function(){var c=fch[fc][fcr][fcC](arguments);fch[fc][fcza][fcK](c,d);return a[fcK](b,c)}}return function(){return a[fcK](b,arguments)}},fcT=function(a,b,c){fcT=Function[fc][fcxa]&&
-1!=Function[fc][fcxa][fcfa]()[fcz]("native code")?fcGa:fcHa;return fcT[fcK](null,arguments)},fcIa=function(a,b){var c=fch[fc][fcr][fcC](arguments,1);return function(){var b=fch[fc][fcr][fcC](arguments);b[fcza][fcK](b,c);return a[fcK](this,b)}},fcJa=function(a,b){for(var c in b)a[c]=b[c]},fcKa=Date.now||function(){return+new Date},fcU=function(a,b,c){fcBa(a,b,c)},fcV=function(a,b){function c(){}c.prototype=b[fc];a.Qc=b[fc];a.prototype=new c;a[fc].constructor=a};
Function[fc].bind=Function[fc][fcxa]||function(a,b){if(1<arguments[fco]){var c=fch[fc][fcr][fcC](arguments,1);c[fcza](this,a);return fcT[fcK](null,c)}return fcT(this,a)};SHA1=function(){this.c=fch(5);this.da=fch(64);this.Hc=fch(80);this.ua=fch(64);this.ua[0]=128;for(var a=1;64>a;++a)this.ua[a]=0;this[fcva]()};SHA1[fc].reset=function(){this.c[0]=1732584193;this.c[1]=4023233417;this.c[2]=2562383102;this.c[3]=271733878;this.c[4]=3285377520;this.J=this.A=0};SHA1[fc].za=function(a,b){return(a<<b|a>>>32-b)&4294967295};
SHA1[fc].M=function(a){for(var b=this.Hc,c=0;64>c;c+=4){var d=a[c]<<24|a[c+1]<<16|a[c+2]<<8|a[c+3];b[c/4]=d}for(c=16;80>c;++c)b[c]=this.za(b[c-3]^b[c-8]^b[c-14]^b[c-16],1);a=this.c[0];for(var d=this.c[1],e=this.c[2],f=this.c[3],l=this.c[4],k,m,c=0;80>c;++c)40>c?20>c?(k=f^d&(e^f),m=1518500249):(k=d^e^f,m=1859775393):60>c?(k=d&e|f&(d|e),m=2400959708):(k=d^e^f,m=3395469782),k=this.za(a,5)+k+l+m+b[c]&4294967295,l=f,f=e,e=this.za(d,30),d=a,a=k;this.c[0]=this.c[0]+a&4294967295;this.c[1]=this.c[1]+d&4294967295;
this.c[2]=this.c[2]+e&4294967295;this.c[3]=this.c[3]+f&4294967295;this.c[4]=this.c[4]+l&4294967295};SHA1[fc].update=function(a,b){b||(b=a[fco]);var c=0;if(0==this.A)for(;c+64<b;)this.M(a[fcr](c,c+64)),c+=64,this.J+=64;for(;c<b;)if(this.da[this.A++]=a[c++],++this.J,64==this.A)for(this.A=0,this.M(this.da);c+64<b;)this.M(a[fcr](c,c+64)),c+=64,this.J+=64};
SHA1[fc].digest=function(){var a=fch(20),b=8*this.J;56>this.A?this.update(this.ua,56-this.A):this.update(this.ua,64-(this.A-56));for(var c=63;56<=c;--c)this.da[c]=b&255,b>>>=8;this.M(this.da);for(c=b=0;5>c;++c)for(var d=24;0<=d;d-=8)a[b++]=this.c[c]>>d&255;return a};G_HMAC=function(a,b,c){if(!(a&&"object"==typeof a&&a[fcva]&&a.update&&a.digest))throw fcb("Invalid hasher object. Hasher unspecified or does not implement expected interface.");if(b.constructor!=fch)throw fcb("Invalid key.");if(c&&"number"!=typeof c)throw fcb("Invalid block size.");this.k=a;this.ca=c||16;this.Wb=fch(this.ca);this.Vb=fch(this.ca);b[fco]>this.ca&&(this.k.update(b),b=this.k.digest());for(c=0;c<this.ca;c++)a=c<b[fco]?b[c]:0,this.Wb[c]=a^G_HMAC.OPAD,this.Vb[c]=a^G_HMAC.IPAD};
G_HMAC.OPAD=92;G_HMAC.IPAD=54;G_HMAC[fc].reset=function(){this.k[fcva]();this.k.update(this.Vb)};G_HMAC[fc].update=function(a){if(a.constructor!=fch)throw fcb("Invalid data. Data must be an array.");this.k.update(a)};G_HMAC[fc].digest=function(){var a=this.k.digest();this.k[fcva]();this.k.update(this.Wb);this.k.update(a);return this.k.digest()};G_HMAC[fc].Ib=function(a){this[fcva]();this.update(a);return this.digest()};var fcLa=function(a,b){for(var c=a[fcu]("%s"),d="",e=fch[fc][fcr][fcC](arguments,1);e[fco]&&1<c[fco];)d+=c[fcja]()+e[fcja]();return d+c[fcO]("%s")},fcMa=function(a,b){var c=fce(a)[fcAa](),d=fce(b)[fcAa]();return c<d?-1:c==d?0:1},fcSa=function(a,b){if(b)return a[fcs](fcNa,"&amp;")[fcs](fcOa,"&lt;")[fcs](fcPa,"&gt;")[fcs](fcQa,"&quot;");if(!fcRa[fcia](a))return a;-1!=a[fcz]("&")&&(a=a[fcs](fcNa,"&amp;"));-1!=a[fcz]("<")&&(a=a[fcs](fcOa,"&lt;"));-1!=a[fcz](">")&&(a=a[fcs](fcPa,"&gt;"));-1!=a[fcz]('"')&&
(a=a[fcs](fcQa,"&quot;"));return a},fcNa=/&/g,fcOa=/</g,fcPa=/>/g,fcQa=/\"/g,fcRa=/[&<>\"]/,fcTa=function(a,b){for(var c=0,d=fce(a)[fcs](/^[\s\xa0]+|[\s\xa0]+$/g,"")[fcu]("."),e=fce(b)[fcs](/^[\s\xa0]+|[\s\xa0]+$/g,"")[fcu]("."),f=fci.max(d[fco],e[fco]),l=0;0==c&&l<f;l++){var k=d[l]||"",m=e[l]||"",n=RegExp("(\\d*)(\\D*)","g"),h=RegExp("(\\d*)(\\D*)","g");do{var g=n.exec(k)||["","",""],p=h.exec(m)||["","",""];if(0==g[0][fco]&&0==p[0][fco])break;var c=0==g[1][fco]?0:fcaa(g[1],10),r=0==p[1][fco]?0:fcaa(p[1],
10),c=(c<r?-1:c>r?1:0)||((0==g[2][fco])<(0==p[2][fco])?-1:(0==g[2][fco])>(0==p[2][fco])?1:0)||(g[2]<p[2]?-1:g[2]>p[2]?1:0)}while(0==c)}return c};fci[fcoa]();var fcUa=function(a){return fce(a)[fcs](/\-([a-z])/g,function(a,c){return c.toUpperCase()})},fcVa=function(a,b){var c=fcR(b)?fce(b)[fcs](/([-()\[\]{}+?*.$\^|,:#<!\\])/g,"\\$1")[fcs](/\x08/g,"\\x08"):"\\s",c=c?"|["+c+"]+":"",c=RegExp("(^"+c+")([a-z])","g");return a[fcs](c,function(a,b,c){return b+c.toUpperCase()})};var fcW,fcWa,fcXa,fcYa,fcZa=function(){return fcQ.navigator?fcQ.navigator.userAgent:null},fc_a=function(){return fcQ.navigator},fc0a=function(){fcYa=fcXa=fcWa=fcW=!1;var a;if(a=fcZa()){var b=fc_a();fcW=0==a[fcna]("Opera",0);fcWa=!fcW&&(-1!=a[fcz]("MSIE")||-1!=a[fcz]("Trident"));(fcXa=!fcW&&-1!=a[fcz]("WebKit"))&&a[fcz]("Mobile");fcYa=!fcW&&!fcXa&&!fcWa&&"Gecko"==b.product}};fc0a();
var fc1a=fcW,fcX=fcWa,fc2a=fcYa,fcY=fcXa,fc3a=function(){var a=fc_a();return a&&a.platform||""},fc4a=fc3a(),fc5a=function(){fc4a[fcz]("Mac");fc4a[fcz]("Win");fc4a[fcz]("Linux");fc_a()&&(fc_a().appVersion||"")[fcz]("X11");var a=fcZa();a&&a[fcz]("Android");a&&a[fcz]("iPhone");a&&a[fcz]("iPad")};fc5a();
var fc7a=function(){var a="",b;fc1a&&fcQ.opera?(a=fcQ.opera.version,a="function"==typeof a?a():a):(fc2a?b=/rv\:([^\);]+)(\)|;)/:fcX?b=/\b(?:MSIE|rv)\s+([^\);]+)(\)|;)/:fcY&&(b=/WebKit\/(\S+)/),b&&(a=(a=b.exec(fcZa()))?a[1]:""));return fcX&&(b=fc6a(),b>parseFloat(a))?fce(b):a},fc6a=function(){var a=fcQ[fct];return a?a.documentMode:void 0},fc8a=fc7a(),fc9a={},fc$a=function(a){return fc9a[a]||(fc9a[a]=0<=fcTa(fc8a,a))},fcab=function(){var a=fcQ[fct];if(a&&fcX){var b=fc6a();return b||("CSS1Compat"==a.compatMode?
fcaa(fc8a,10):5)}}();var fcbb=function(a){fcb.captureStackTrace?fcb.captureStackTrace(this,fcbb):this.stack=fcb().stack||"";a&&(this.message=fce(a))};fcV(fcbb,fcb);fcbb[fc].name="CustomError";var fccb=function(a,b){b[fcza](a);fcbb[fcC](this,fcLa[fcK](null,b));b[fcja]();this.messagePattern=a};fcV(fccb,fcbb);fccb[fc].name="AssertionError";var fcdb=function(a,b,c,d){var e="Assertion failed";if(c)var e=e+(": "+c),f=d;else a&&(e+=": "+a,f=b);throw new fccb(""+e,f||[]);},fceb=function(a,b,c){a||fcdb("",null,b,fch[fc][fcr][fcC](arguments,2));return a};var fcfb=fch[fc],fcgb=fcfb[fcz]?function(a,b,c){fceb(null!=a[fco]);return fcfb[fcz][fcC](a,b,c)}:function(a,b,c){c=null==c?0:0>c?fci.max(0,a[fco]+c):c;if(fcR(a))return fcR(b)&&1==b[fco]?a[fcz](b,c):-1;for(;c<a[fco];c++)if(c in a&&a[c]===b)return c;return-1},fchb=fcfb.forEach?function(a,b,c){fceb(null!=a[fco]);fcfb.forEach[fcC](a,b,c)}:function(a,b,c){for(var d=a[fco],e=fcR(a)?a[fcu](""):a,f=0;f<d;f++)f in e&&b[fcC](c,e[f],f,a)},fcib=function(a,b){return 0<=fcgb(a,b)},fcjb=function(a){var b=a[fco];
if(0<b){for(var c=fch(b),d=0;d<b;d++)c[d]=a[d];return c}return[]},fckb=function(a,b,c){fceb(null!=a[fco]);return 2>=arguments[fco]?fcfb[fcr][fcC](a,b):fcfb[fcr][fcC](a,b,c)};var fclb=function(a){for(var b=[],c=0,d=0;d<a[fco];d++){for(var e=a.charCodeAt(d);255<e;)b[c++]=e&255,e>>=8;b[c++]=e}return b};var fcmb=null,fcnb=null,fcob=null,fcpb=null,fcrb=function(a,b){if(!fcEa(a))throw fcb("encodeByteArray takes an array as a parameter");fcqb();for(var c=b?fcob:fcmb,d=[],e=0;e<a[fco];e+=3){var f=a[e],l=e+1<a[fco],k=l?a[e+1]:0,m=e+2<a[fco],n=m?a[e+2]:0,h=f>>2,f=(f&3)<<4|k>>4,k=(k&15)<<2|n>>6,n=n&63;m||(n=64,l||(k=64));d[fcn](c[h],c[f],c[k],c[n])}return d[fcO]("")},fcsb=function(a,b){fcqb();for(var c=b?fcpb:fcnb,d=[],e=0;e<a[fco];){var f=c[a[fcw](e++)],l=e<a[fco],l=l?c[a[fcw](e)]:0;++e;var k=e<a[fco],
k=k?c[a[fcw](e)]:0;++e;var m=e<a[fco],m=m?c[a[fcw](e)]:0;++e;if(null==f||null==l||null==k||null==m)throw fcb();f=f<<2|l>>4;d[fcn](f);64!=k&&(f=l<<4&240|k>>2,d[fcn](f),64!=m&&(f=k<<6&192|m,d[fcn](f)))}return d},fcqb=function(){if(!fcmb){fcmb={};fcnb={};fcob={};fcpb={};for(var a=0;65>a;a++)fcmb[a]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="[fcw](a),fcnb[fcmb[a]]=a,fcob[a]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_."[fcw](a),fcpb[fcob[a]]=a}};var fcZ=function(a){this.wb=a},fctb=/\s*;\s*/;fcZ[fc].Tb=function(a){return!/[;=\s]/[fcia](a)};fcZ[fc].Ub=function(a){return!/[;\r\n]/[fcia](a)};fcZ[fc].set=function(a,b,c,d,e,f){if(!this.Tb(a))throw fcb('Invalid cookie name "'+a+'"');if(!this.Ub(b))throw fcb('Invalid cookie value "'+b+'"');fcDa(c)||(c=-1);e=e?";domain="+e:"";d=d?";path="+d:"";f=f?";secure":"";0>c?c="":(c=0==c?new Date(1970,1,1):new Date(fcKa()+1E3*c),c=";expires="+c.toUTCString());this.vc(a+"="+b+e+d+c+f)};
fcZ[fc].get=function(a,b){for(var c=a+"=",d=this.la(),e=0,f;f=d[e];e++){if(0==f[fcna](c,0))return f.substr(c[fco]);if(f==a)return""}return b};fcZ[fc].remove=function(a,b,c){var d=this.N(a);this.set(a,"",0,b,c);return d};fcZ[fc].z=function(){return this.ja().keys};fcZ[fc].F=function(){return this.ja().values};fcZ[fc].Q=function(){var a=this.Oa();return a?this.la()[fco]:0};fcZ[fc].N=function(a){return fcDa(this.get(a))};fcZ[fc].clear=function(){for(var a=this.ja().keys,b=a[fco]-1;0<=b;b--)this.remove(a[b])};
fcZ[fc].vc=function(a){this.wb.cookie=a};fcZ[fc].Oa=function(){return this.wb.cookie};fcZ[fc].la=function(){return(this.Oa()||"")[fcu](fctb)};fcZ[fc].ja=function(){for(var a=this.la(),b=[],c=[],d,e,f=0;e=a[f];f++)d=e[fcz]("="),-1==d?(b[fcn](""),c[fcn](e)):(b[fcn](e[fcqa](0,d)),c[fcn](e[fcqa](d+1)));return{keys:b,values:c}};var fcub=new fcZ(fcg);fcub.MAX_COOKIE_LENGTH=3950;var fc_=function(a,b){fcj(this,a);fcl(this,b)};fc_[fc].clone=function(){return new fc_(this[fcp],this[fcM])};fc_[fc].toString=function(){return"("+this[fcp]+" x "+this[fcM]+")"};fc_[fc].ceil=function(){fcj(this,fci.ceil(this[fcp]));fcl(this,fci.ceil(this[fcM]));return this};fc_[fc].floor=function(){fcj(this,fci.floor(this[fcp]));fcl(this,fci.floor(this[fcM]));return this};fc_[fc].round=function(){fcj(this,fci[fcq](this[fcp]));fcl(this,fci[fcq](this[fcM]));return this};
fc_[fc].scale=function(a,b){var c="number"==typeof b?b:a;fcj(this,this[fcp]*a);fcl(this,this[fcM]*c);return this};var fcvb=function(a,b,c){for(var d in a)b[fcC](c,a[d],d,a)},fcwb=function(a){var b=[],c=0,d;for(d in a)b[c++]=a[d];return b},fcxb=function(a){var b=[],c=0,d;for(d in a)b[c++]=d;return b},fcyb="constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" "),fczb=function(a,b){for(var c,d,e=1;e<arguments[fco];e++){d=arguments[e];for(c in d)a[c]=d[c];for(var f=0;f<fcyb[fco];f++)c=fcyb[f],fcca[fc].hasOwnProperty[fcC](d,c)&&(a[c]=d[c])}};var fcAb=!fcX||fcX&&9<=fcab;!fc2a&&!fcX||fcX&&fcX&&9<=fcab||fc2a&&fc$a("1.9.1");fcX&&fc$a("9");var fcBb=function(a,b){fcea(a,b)},fcCb=function(a){a=a.className;return fcR(a)&&a[fcD](/\S+/g)||[]},fcEb=function(a,b){var c=fcCb(a),d=fckb(arguments,1),e=c[fco]+d[fco];fcDb(c,d);fcBb(a,c[fcO](" "));return c[fco]==e},fcDb=function(a,b){for(var c=0;c<b[fco];c++)fcib(a,b[c])||a[fcn](b[c])};var fcFb=function(a){return fcR(a)?fcg[fcv](a):a},fcGb=fcFb,fcHb=function(a,b,c,d){a=d||a;b=b&&"*"!=b?b.toUpperCase():"";if(a.querySelectorAll&&a.querySelector&&(b||c))return c=b+(c?"."+c:""),a.querySelectorAll(c);if(c&&a.getElementsByClassName){a=a.getElementsByClassName(c);if(b){d={};for(var e=0,f=0,l;l=a[f];f++)b==l.nodeName&&(d[e++]=l);fcda(d,e);return d}return a}a=a.getElementsByTagName(b||"*");if(c){d={};for(f=e=0;l=a[f];f++)b=l.className,"function"==typeof b[fcu]&&fcib(b[fcu](/\s+/),c)&&(d[e++]=
l);fcda(d,e);return d}return a},fcJb=function(a,b){fcvb(b,function(b,d){"style"==d?a[fcA].cssText=b:"class"==d?fcea(a,b):"for"==d?a.htmlFor=b:d in fcIb?a[fcI](fcIb[d],b):0==d[fcna]("aria-",0)||0==d[fcna]("data-",0)?a[fcI](d,b):a[d]=b})},fcIb={cellpadding:"cellPadding",cellspacing:"cellSpacing",colspan:"colSpan",frameborder:"frameBorder",height:"height",maxlength:"maxLength",role:"role",rowspan:"rowSpan",type:"type",usemap:"useMap",valign:"vAlign",width:"width"},fcKb=function(a){a=a[fct];a="CSS1Compat"==
a.compatMode?a.documentElement:a[fcB];return new fc_(a.clientWidth,a.clientHeight)},fc0=function(a,b,c){return fcLb(fcg,arguments)},fcLb=function(a,b){var c=b[0],d=b[1];if(!fcAb&&d&&(d[fcL]||d[fcta])){c=["<",c];d[fcL]&&c[fcn](' name="',fcSa(d[fcL]),'"');if(d[fcta]){c[fcn](' type="',fcSa(d[fcta]),'"');var e={};fczb(e,d);delete e[fcta];d=e}c[fcn](">");c=c[fcO]("")}c=a[fcF](c);d&&(fcR(d)?fcea(c,d):"array"==fcCa(d)?fcEb[fcK](null,[c].concat(d)):fcJb(c,d));2<b[fco]&&fcMb(a,c,b,2);return c},fcMb=function(a,
b,c,d){function e(c){c&&b[fcm](fcR(c)?a.createTextNode(c):c)}for(;d<c[fco];d++){var f=c[d];!fcEa(f)||fcFa(f)&&0<f.nodeType?e(f):fchb(fcNb(f)?fcjb(f):f,e)}},fcNb=function(a){if(a&&"number"==typeof a[fco]){if(fcFa(a))return"function"==typeof a.item||"string"==typeof a.item;if("function"==fcCa(a))return"function"==typeof a.item}return!1};var fcOb="StopIteration"in fcQ?fcQ.StopIteration:fcb("StopIteration"),fcPb=function(){};fcPb[fc].next=function(){throw fcOb;};fcPb[fc].__iterator__=function(){return this};var fc1=function(a,b){this.i={};this.e=[];var c=arguments[fco];if(1<c){if(c%2)throw fcb("Uneven number of arguments");for(var d=0;d<c;d+=2)this.set(arguments[d],arguments[d+1])}else a&&this.nb(a)};fc1[fc].r=0;fc1[fc].K=0;fc1[fc].Q=function(){return this.r};fc1[fc].F=function(){this.L();for(var a=[],b=0;b<this.e[fco];b++){var c=this.e[b];a[fcn](this.i[c])}return a};fc1[fc].z=function(){this.L();return this.e.concat()};fc1[fc].N=function(a){return fcQb(this.i,a)};
fc1[fc].clear=function(){this.i={};fcda(this.e,0);this.K=this.r=0};fc1[fc].remove=function(a){return fcQb(this.i,a)?(delete this.i[a],this.r--,this.K++,this.e[fco]>2*this.r&&this.L(),!0):!1};fc1[fc].L=function(){if(this.r!=this.e[fco]){for(var a=0,b=0;a<this.e[fco];){var c=this.e[a];fcQb(this.i,c)&&(this.e[b++]=c);a++}fcda(this.e,b)}if(this.r!=this.e[fco]){for(var d={},b=a=0;a<this.e[fco];)c=this.e[a],fcQb(d,c)||(this.e[b++]=c,d[c]=1),a++;fcda(this.e,b)}};
fc1[fc].get=function(a,b){return fcQb(this.i,a)?this.i[a]:b};fc1[fc].set=function(a,b){fcQb(this.i,a)||(this.r++,this.e[fcn](a),this.K++);this.i[a]=b};fc1[fc].nb=function(a){var b;a instanceof fc1?(b=a.z(),a=a.F()):(b=fcxb(a),a=fcwb(a));for(var c=0;c<b[fco];c++)this.set(b[c],a[c])};fc1[fc].clone=function(){return new fc1(this)};
fc1[fc].__iterator__=function(a){this.L();var b=0,c=this.e,d=this.i,e=this.K,f=this,l=new fcPb;l.next=function(){for(;;){if(e!=f.K)throw fcb("The map has changed since the iterator was created");if(b>=c[fco])throw fcOb;var l=c[b++];return a?l:d[l]}};return l};var fcQb=function(a,b){return fcca[fc].hasOwnProperty[fcC](a,b)};var fcSb=function(a,b,c){fcR(b)?fcRb(a,c,b):fcvb(b,fcIa(fcRb,a))},fcRb=function(a,b,c){(c=fcTb(a,c))&&(a[fcA][c]=b)},fcTb=function(a,b){var c=fcUa(b);if(void 0===a[fcA][c]){var d=(fcY?"Webkit":fc2a?"Moz":fcX?"ms":fc1a?"O":null)+fcVa(b);if(void 0!==a[fcA][d])return d}return c},fcUb=function(a,b){var c=9==a.nodeType?a:a.ownerDocument||a[fct];return c.defaultView&&c.defaultView.getComputedStyle&&(c=c.defaultView.getComputedStyle(a,null))?c[b]||c.getPropertyValue(b)||"":""},fcVb=function(a){var b;try{b=
a.getBoundingClientRect()}catch(c){return{left:0,top:0,right:0,bottom:0}}fcX&&(a=a.ownerDocument,b.left=b[fcma]-(a.documentElement.clientLeft+a[fcB].clientLeft),b.top-=a.documentElement.clientTop+a[fcB].clientTop);return b},fcYb=function(a,b,c){if(b instanceof fc_)c=b[fcM],b=b[fcp];else if(void 0==c)throw fcb("missing height argument");fcWb(a,b);fcXb(a,c)},fcZb=function(a,b){"number"==typeof a&&(a=(b?fci[fcq](a):a)+"px");return a},fcXb=function(a,b){fcl(a[fcA],fcZb(b,!0))},fcWb=function(a,b){fcj(a[fcA],
fcZb(b,!0))},fc_b=function(a,b){if("none"!=(fcUb(b,"display")||(b.currentStyle?b.currentStyle[fcya]:null)||b[fcA]&&b[fcA][fcya]))return a(b);var c=b[fcA],d=c[fcya],e=c.visibility,f=c.position;c.visibility="hidden";c.position="absolute";c.display="inline";var l=a(b);c.display=d;c.position=f;c.visibility=e;return l},fc0b=function(a){var b=a.offsetWidth,c=a.offsetHeight,d=fcY&&!b&&!c;return fcDa(b)&&!d||!a.getBoundingClientRect?new fc_(b,c):(a=fcVb(a),new fc_(a[fcP]-a[fcma],a.bottom-a.top))},fc1b=function(a,
b){a[fcA].display=b?"":"none"};var fc2b={},fc3b={};var fc4b=function(a,b,c,d){b=b||"800";c=c||"550";d=d||"friendconnect";a=fcf.open(a,d,"menubar=no,toolbar=no,dialog=yes,location=yes,alwaysRaised=yes,width="+b+",height="+c+",resizable=yes,scrollbars=1,status=1");fcf.focus&&a&&a.focus()},fc5b=function(a,b){var c=fca[fcJ][fcy]().communityId;fca.rpc[fcC](null,"signin",null,c,a,b)};fcU("goog.peoplesense.util.openPopup",fc4b);fcU("goog.peoplesense.util.finishSignIn",fc5b);var fc8b=function(a,b){var c=fc6b()+"/friendconnect/invite/friends",d=fcd(shindig[fcua][fcwa]());fc7b(c,d,a,b)},fc7b=function(a,b,c,d){a+="?st="+b;c&&(a+="&customMessage="+fcd(c));d&&(a+="&customInviteUrl="+fcd(d));b=760;fcX&&(b+=25);fc4b(a,fce(b),"515","friendconnect_invite")};fcU("goog.peoplesense.util.invite",fc8b);fcU("goog.peoplesense.util.inviteFriends",fc7b);var fc9b=function(a){this.url=a};fc9b[fc].l=function(a,b){if(0<=this.url[fcz]("?"+a+"=")||0<=this.url[fcz]("&"+a+"="))throw fcb("duplicate: "+a);if(null===b||void 0===b)return this;var c=0<=this.url[fcz]("?")?"&":"?";this.url+=c+a+"="+fcd(b);return this};fc9b[fc].toString=function(){return this.url};var fc6b=function(){return fcf.friendconnect_serverBase},fc$b=function(a,b,c,d,e,f,l){b=b||"800";c=c||"550";d=d||"friendconnect";f=f||!1;fca.rpc[fcC](null,"openLightboxIframe",l,a,shindig[fcua][fcwa](),b,c,d,e,null,null,null,f)},fcac=function(a,b){var c=fca[fcJ][fcy]().psinvite||"",d=new fc9b(fc6b()+"/friendconnect/signin/home");d.l("st",fcf.shindig[fcua][fcwa]());d.l("psinvite",c);d.l("iframeId",a);d.l("loginProvider",b);d.l("subscribeOnSignin","1");fc4b(d[fcfa]());return!1},fcbc=function(){var a=
fca[fcJ][fcy]().communityId;fca.rpc[fcC](null,"signout",null,a)},fcdc=function(a,b){var c=fc6b()+"/friendconnect/settings/edit?st="+fcd(shindig[fcua][fcwa]())+(a?"&iframeId="+fcd(a):"");b&&(c=c+"&"+b);fccc(c)},fcec=function(a){a=fc6b()+"/friendconnect/settings/siteProfile?st="+fcd(a);fccc(a)},fccc=function(a){var b=800,c=510;fcX&&(b+=25);fc4b(a,fce(b),fce(c))},fcfc=function(a,b,c,d){d=d||2;var e=null;if("text"==b)e=fc0("div",{"class":"gfc-button-text"},fc0("div",{"class":"gfc-icon"},fc0("a",{href:"javascript:void(0);"},
c))),a[fcm](e);else if("long"==b||"standard"==b)e=1==d?fc0("div",{"class":"gfc-inline-block gfc-primaryactionbutton gfc-button-base"},fc0("div",{"class":"gfc-inline-block gfc-button-base-outer-box"},fc0("div",{"class":"gfc-inline-block gfc-button-base-inner-box"},fc0("div",{"class":"gfc-button-base-pos"},fc0("div",{"class":"gfc-button-base-top-shadow",innerHTML:"&nbsp;"}),fc0("div",{"class":"gfc-button-base-content"},fc0("div",{"class":"gfc-icon"},c)))))):fc0("table",{"class":"gfc-button-base-v2 gfc-button",
cellpadding:"0",cellspacing:"0"},fc0("tbody",{"class":""},fc0("tr",{"class":""},fc0("td",{"class":"gfc-button-base-v2 gfc-button-1"}),fc0("td",{"class":"gfc-button-base-v2 gfc-button-2"},c),fc0("td",{"class":"gfc-button-base-v2 gfc-button-3"})))),a[fcm](e),"standard"==b&&(b=fc0("div",{"class":"gfc-footer-msg"},"with Google Friend Connect"),1==d&&a[fcm](fc0("br")),a[fcm](b));return e},fcgc=function(a,b){if(!a)throw"google.friendconnect.renderSignInButton: missing options";var c=a[fcA]||"standard",
d=a.text,e=a.version;if("standard"==c)d=a.text||"Sign in";else if("text"==c||"long"==c)d=a.text||"Sign in with Friend Connect";var f=a.element;if(!f){f=a.id;if(!f)throw"google.friendconnect.renderSignInButton: options[id] and options[element] == null";f=fcGb(f);if(!f)throw"google.friendconnect.renderSignInButton: element "+a.id+" not found";}fck(f,"");c=fcfc(f,c,d,e);fcf[fcH]?c[fcH]("click",b,!1):c.attachEvent("onclick",b)},fchc=function(a,b){b=b||fcT(fcac,null,null,null,null);fcgc(a,b)},fcic=function(a,
b){fca.rpc[fcC](null,"putReloadViewParam",null,a,b);var c=fca.views.getParams();c[a]=b},fcjc=function(a,b){var c=new fc9b("/friendconnect/gadgetshare/friends");c.l("customMessage",a);c.l("customInviteUrl",b);c.l("container","glb");var d=310;fcX&&(d+=25);fc$b(c[fcfa](),fce(d),"370")};fcU("goog.peoplesense.util.getBaseUrl",fc6b);fcU("goog.peoplesense.util.finishSignIn",fc5b);fcU("goog.peoplesense.util.signout",fcbc);fcU("goog.peoplesense.util.signin",fcac);fcU("goog.peoplesense.util.editSettings",fcdc);
fcU("goog.peoplesense.util.editSSProfile",fcec);fcU("goog.peoplesense.util.setStickyViewParamToken",fcic);fcU("google.friendconnect.renderSignInButton",fchc);fcU("goog.peoplesense.util.share",fcjc);fcU("goog.peoplesense.util.userAgent.IE",fcX);var fckc={},fclc={},fc2=function(a){this.h=new fc1;this.snippetId=a.id;this.site=a.site;a=a["view-params"];var b=a.skin;this.gc=(b?b.POSITION:"top")||"top";this.Ic={allowAnonymousPost:a.allowAnonymousPost||!1,scope:a.scope||"SITE",docId:a.docId||"",features:a.features||"video,comment",startMaximized:"true",disableMinMax:"true",skin:b};this.absoluteBottom=fcX&&!fc$a("7");this.fixedIeSizes=fcX;fcf[fcH]?fcf[fcH]("resize",fcT(this.db,this),!1):fcf.attachEvent("onresize",fcT(this.db,this));this.sb()};
fc2[fc].sb=function(){if(!this.site)throw fcb("Must supply site ID.");if(!this.snippetId)throw fcb("Must supply a snippet ID.");};fc2[fc].b=10;fc2[fc].Da=1;fc2[fc].q="fc-friendbar-";fc2[fc].t=fc2[fc].q+"outer";fc2[fc].gb=fc2[fc].t+"-shadow";fc2[fc].render=function(){fcg.write(this.Ab());var a=fcFb(this.snippetId);fck(a,this.P())};fc2[fc].Bb=function(){var a=fcFb(this.t);return a=fc_b(fc0b,a)[fcp]};
fc2[fc].db=function(){for(var a=this.h.z(),b=0;b<a[fco];b++)this.sc(a[b]);goog&&(fc2b&&fc3b&&fcmc)&&fcnc("resize")};fc2[fc].n=function(){return this.gc};fc2[fc].d=function(a){return this.q+"shadow-"+a};fc2[fc].ka=function(a){return this.q+"menus-"+a};fc2[fc].S=function(a){return this.q+a+"Target"};fc2[fc].ha=function(a){return this.q+a+"Drawer"};fc2[fc].Ta=function(){return this.S("")};fc2[fc].Ua=function(){return this.q+"wallpaper"};fc2[fc].Pa=function(){return this.ha("")};
fc2[fc].Ab=function(){var a=fcf.friendconnect_imageUrl+"/",b=a+"shadow_tc.png",c=a+"shadow_bc.png",d=a+"shadow_bl.png",e=a+"shadow_tl.png",f=a+"shadow_tr.png",l=a+"shadow_br.png",a=a+"shadow_cr.png",k=function(a,b){return fcX?'filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src="'+a+'", sizingMethod="scale");':"background-image: url("+a+");background-repeat: "+b+"; "},m="position:absolute; top:";"top"!=this.n()&&(m="position:fixed; bottom:",this.absoluteBottom&&(m="position:absolute; bottom:"));
var n=c;"top"!=this.n()&&(n=b);var h=0,g=[];g[h++]='<style type="text/css">';"top"!=this.n()&&this.absoluteBottom&&(g[h++]="html, body {height: 100%; overflow: auto; };");g[h++]="#"+this.t+" {";g[h++]="background:#E0ECFF;";g[h++]="left:0;";g[h++]="height: "+(fcX?"35px;":"36px;");"top"!=this.n()&&this.absoluteBottom&&(g[h++]="margin-right: 20px;");g[h++]="padding:0;";g[h++]=m+" 0;";g[h++]="width:100%;";g[h++]="z-index:5000;";g[h++]="}";g[h++]="#"+this.gb+" {";g[h++]=k(n,"repeat-x");g[h++]="left:0;";
g[h++]="height:"+this.b+"px;";"top"!=this.n()&&this.absoluteBottom&&(g[h++]="margin-right: 20px;");g[h++]="padding:0;";g[h++]=m+(fcX?"35px;":"36px;");g[h++]="width:100%;";g[h++]="z-index:4998;";g[h++]="}";g[h++]="."+this.Pa()+" {";g[h++]="display: block;";g[h++]="padding:0;";g[h++]=m+(fcX?"34px;":"35px;");g[h++]="z-index:4999;";g[h++]="}";g[h++]="."+this.Ua()+" {";g[h++]="background: white;";g[h++]="height: 100%;";g[h++]="margin-right: "+this.b+"px;";g[h++]="}";g[h++]="."+this.Ta()+" {";g[h++]="border: "+
this.Da+"px solid #ccc;";g[h++]="height: 100%;";g[h++]="left: 0;";g[h++]="background-image: url("+fcf.friendconnect_imageUrl+"/loading.gif);";g[h++]="background-position: center;";g[h++]="background-repeat: no-repeat;";g[h++]="}";g[h++]="."+this.d("cr")+" {";g[h++]=k(a,"repeat-y");g[h++]="height: 100%;";g[h++]="position:absolute;";g[h++]="right: 0;";g[h++]="top: 0;";g[h++]="width:"+this.b+"px;";g[h++]="}";g[h++]="."+this.d("bl")+" {";g[h++]=k(d,"no-repeat");g[h++]="height: "+this.b+"px;";g[h++]="position:absolute;";
g[h++]="width:"+this.b+"px;";g[h++]="}";g[h++]="."+this.d("tl")+" {";g[h++]=k(e,"no-repeat");g[h++]="height: "+this.b+"px;";g[h++]="position:absolute;";g[h++]="left:0px;";g[h++]="width:"+this.b+"px;";g[h++]="}";g[h++]="."+this.d("bc")+" {";g[h++]=k(c,"repeat-x");g[h++]="height: "+this.b+"px;";g[h++]="left: "+this.b+"px;";g[h++]="position:absolute;";g[h++]="right: "+this.b+"px;";g[h++]="}";g[h++]="."+this.d("tc")+" {";g[h++]=k(b,"repeat-x");g[h++]="height: "+this.b+"px;";g[h++]="left: "+this.b+"px;";
g[h++]="margin-left: "+this.b+"px;";g[h++]="margin-right: "+this.b+"px;";g[h++]="right: "+this.b+"px;";g[h++]="}";g[h++]="."+this.d("br")+" {";g[h++]=k(l,"no-repeat");g[h++]="height: "+this.b+"px;";g[h++]="position:absolute;";g[h++]="right: 0;";g[h++]="width: "+this.b+"px;";g[h++]="}";g[h++]="."+this.d("tr")+" {";g[h++]=k(f,"no-repeat");g[h++]="height: "+this.b+"px;";g[h++]="position:absolute;";g[h++]="right: 0;";g[h++]="top: 0;";g[h++]="width: "+this.b+"px;";g[h++]="}";g[h++]="</style>";return g[fcO]("")};
fc2[fc].P=function(){var a=['<div id="'+this.t+'"></div>','<div id="'+this.gb+'"></div>','<div id="'+this.ka(this.h.Q())+'"></div>'];return a[fcO]("")};fc2[fc].ub=function(a,b,c,d){this.h.N(a)||(b=new fc3(this,a,b,c,d),c=this.h.Q(),d=fcFb(this.ka(c)),fck(d,b.P()+'<div id="'+this.ka(c+1)+'"></div>'),this.h.set(a,b))};fc2[fc].oa=function(a){(a=this.h.get(a))&&a.drawer&&fc1b(a.drawer,!1)};fc2[fc].ic=function(a){if(a=this.h.get(a))a.rendered=!1};
fc2[fc].refresh=function(){for(var a=this.h.z(),b=0;b<a[fco];b++){var c=a[b];this.oa(c);this.ic(c)}};fc2[fc].cc=function(a){for(var b=this.h.F(),c=0;c<b[fco];c++){var d=b[c];if(d.id==a){d.Fc();break}}};fc2[fc].bc=function(a){for(var b=this.h.F(),c=0;c<b[fco];c++){var d=b[c];if(d.id==a){d.Zb();break}}};fc2[fc].sc=function(a){(a=this.h.get(a))&&(a.drawer&&a.qa())&&(a.fa(),a.La(),a.Ca())};
fc2[fc].Ec=function(a,b){var c=this.h.get(a);if(c){c.drawer||(c.drawer=fcFb(this.ha(c[fcL])),c.target=fcFb(this.S(c[fcL])),c.sha_bc=fcHb(fcg,"div","top"==this.n()?this.d("bc"):this.d("tc"),c.drawer)[0],c.sha_cr=fcHb(fcg,"div",this.d("cr"),c.drawer)[0]);for(var d=this.h.z(),e=0;e<d[fco];e++){var f=d[e];a!==f&&this.oa(f)}c.fa(b);fc1b(c.drawer,!0);fcf.setTimeout(function(){c.Ca();c.La();c.render()},0)}};
var fc3=function(a,b,c,d,e){this.id=-1;this.bar=a;this.name=b;this.constraints=d;this.skin=e||{};fcl(this,this.skin.HEIGHT||"0");this.url=fcf.friendconnect_serverBase+c;this.sha_bc=this.target=this.drawer=null;this.loaded=this.rendered=!1;this.fa()};
fc3[fc].fa=function(a){fczb(this.constraints,a||{});fczb(this.skin,this.constraints);if(this.bar.fixedIeSizes&&this.constraints[fcma]&&this.constraints[fcP]){a=this.bar.Bb();var b=this.constraints[fcma],c=this.constraints[fcP];a-=b+c;a%2&&(a-=1,this.skin.right=this.skin[fcP]+1);fcj(this.skin,a);delete this.skin[fcma]}};
fc3[fc].Ca=function(){if(this.drawer){if(this.skin[fcp]){var a=this.bar.Da,b=this.bar.b,c=fcX?2:0;fcYb(this.target,this.skin[fcp],"");fcYb(this.sha_bc,this.skin[fcp]-b+2*a-c,"");this.skin.rightShadow?fcYb(this.drawer,this.skin[fcp]+b+2*a-c,""):fcYb(this.drawer,this.skin[fcp]+2*a-c,"")}this.skin[fcP]&&(this.drawer[fcA].right=this.skin[fcP]+0+"px")}};
fc3[fc].La=function(){if(fcX&&this.drawer){var a=fc_b(fc0b,this.target),b=a[fcp]-this.bar.b,a=a[fcM];0>b&&(b=0);this.sha_bc&&this.sha_bc[fcA]&&fcYb(this.sha_bc,b,"");this.sha_cr&&this.sha_cr[fcA]&&fcYb(this.sha_cr,"",a)}};
fc3[fc].P=function(){var a="display:none;",b="position: relative; ",c="",d="",e="",f="",l=!!this.skin.rightShadow;l||(c+="display: none; ",e+="display: none; ",d+="right: 0px; ",f+="margin-right: 0px; ");for(var k in this.skin){var m=Number(this.skin[k]);l&&0==fcMa(k,"width")&&(m+=this.bar.b);0==fcMa(k,"height")&&(b+=k+": "+m+"px; ");"rightShadow"!=k&&(0==fcMa(k,"height")&&(m+=this.bar.b),0==fcMa(k,"width")&&(m+=2),a+=k+": "+m+"px; ");fcX&&0==fcMa(k,"width")&&(m=l?m-2*this.bar.b:m-this.bar.b,d+=k+
": "+m+"px; ")}fcX&&0<(this[fcM]|0)&&(l=(this[fcM]|0)+2,c+="height: "+l+"px; ");l=0;k=[];k[l++]='<div id="'+this.bar.ha(this[fcL])+'"class="'+this.bar.Pa()+'"style="'+a+'"> ';"bottom"==this.bar.n()&&(k[l++]='<div class="'+this.bar.d("tl")+'"></div> <div class="'+this.bar.d("tc")+'"style="'+d+'"></div> <div class="'+this.bar.d("tr")+'"style="'+e+'"></div> ');k[l++]='<div style="'+b+'"> <div class="'+this.bar.Ua()+'"style="'+f+'"><div id="'+this.bar.S(this[fcL])+'"class="'+this.bar.Ta()+'"></div> <div class="'+
this.bar.d("cr")+'"style="'+c+'"></div> </div> </div> ';"top"==this.bar.n()&&(k[l++]='<div class="'+this.bar.d("bl")+'"></div> <div class="'+this.bar.d("bc")+'"style="'+d+'"></div> <div class="'+this.bar.d("br")+'"style="'+e+'"></div> ');k[l++]="</div> ";return k[fcO]("")};fc3[fc].Fc=function(){this.rendered=this.qa()};fc3[fc].Zb=function(){this.loaded=this.qa()};fc3[fc].qa=function(){return!!this.drawer&&"none"!=this.drawer[fcA][fcya]};
fc3[fc].render=function(){if(!1==this.rendered){var a={};a.url=this.url;a.id=this.bar.S(this[fcL]);a.site=this.bar.site;a["view-params"]=fcS(this.bar.Ic);"profile"==this[fcL]&&(a["view-params"].profileId="VIEWER");this.skin&&fczb(a["view-params"].skin,this.skin);a["view-params"].menuName=this[fcL];a["view-params"].opaque="true";a["view-params"].menuPosition=this.bar.gc;fcl(a,"1px");fckc&&(fclc&&fc4)&&(this.id=fc4.render(a))}};fcU("google.friendconnect.FriendBar",fc2);var fcoc="0123456789abcdefghijklmnopqrstuv",fcqc=function(a){a=new fcpc(a);if(a.sa()%5)throw fcb();for(var b=[],c=0;0<a.sa();c++)b[c]=fcoc[fcw](a.ec(5));return b[fcO]("")},fcpc=function(a){this.G=this.o=0;this.ea=a};fcpc[fc].sa=function(){return 8*(this.ea[fco]-this.G)-this.o};
fcpc[fc].ec=function(a){var b=0;if(a>this.sa())throw fcb();if(0<this.o){var b=255>>this.o&this.ea[this.G],c=8-this.o,d=fci.min(a%8,c),c=c-d,b=b>>c;a-=d;this.o+=d;8==this.o&&(this.o=0,this.G++)}for(;8<=a;)b<<=8,b|=this.ea[this.G],this.G++,a-=8;0<a&&(b<<=a,b|=this.ea[this.G]>>8-a,this.o=a);return b};var fcrc=(new Date).getTime(),fc5=function(){},fcsc=function(){},fctc=function(){},fcuc=function(){};fcV(fcuc,fctc);var fcvc=function(a){if(a)for(var b in a)a.hasOwnProperty(b)&&(this[b]=a[b]);if(this.viewParams)for(var c in this.viewParams)/^FC_RELOAD_.*$/[fcia](c)&&(this.viewParams[c]=null)};fcvc[fc].render=function(a){var b=this;a&&(b.Gc(),this.Db(function(c){fcSb(a,"visibility","hidden");fck(a,c);b.refresh(a,c);c=function(a){fcSb(a,"visibility","visible")};c=fcIa(c,a);fcba(c,500);b.chrome=a}))};
fcvc[fc].Db=function(a){return this.Jb(a)};var fc6=function(a){fcvc[fcC](this,a);this.W="../../";this.rpcToken=fce(fci[fcq](2147483647*fci[fcoa]()))};fcV(fc6,fcvc);fc6[fc].lb="gfc_iframe_";fc6[fc].mb="friendconnect";fc6[fc].Ma="";fc6[fc].tc="rpc_relay.html";fc6[fc].Z=function(a){this.W=a};fc6[fc].Gc=function(){return this.Ma=fce(fci[fcq](2147483647*fci[fcoa]()))};fc6[fc].ia=function(){return this.lb+this.Ma+"_"+this.id};
fc6[fc].refresh=function(a,b){var c=fc4.Lc,d,e={},f=fc4.Na(this.communityId),l=f[fcu]("~"),k=fc4.vb;if(k&&1<l[fco]){d=l[2];var l=l[1],m=[this.specUrl,this.communityId,l,k][fcO](":");e.sig=fc4.hash(d,m);e.userId=l;e.dateStamp=k}e.container=this.mb;e.mid=this.id;e.nocache=fc4.fc;e.view=this.aa;e.parent=fc4.U;this.debug&&(e.debug="1");this.specUrl&&(e.url=this.specUrl);this.communityId&&(k=fca[fcJ][fcy]().profileId,e.communityId=this.communityId,(d=fca[fcJ][fcy]().psinvite)&&(e.psinvite=d),k&&(e.profileId=
k));e.caller=fcwc();e.rpctoken=this.rpcToken;k=!1;d="";l=/Version\/3\..*Safari/;if((l=fcY&&fcZa()[fcD](l))||!fc4.T[this.specUrl]&&this.viewParams)e["view-params"]=fca[fcG][fcha](this.viewParams),d="?viewParams="+fcd(e["view-params"]),k=!0;this.prefs&&(e.prefs=fca[fcG][fcha](this.prefs));this.viewParams&&this.sendViewParamsToServer&&(e["view-params"]=fca[fcG][fcha](this.viewParams));this.locale&&(e.locale=this.locale);this.secureToken&&(e.st=this.secureToken);l=fc4.Sa(this.specUrl);d=l+"ifr"+d+(this.hashData?
"&"+this.hashData:"");1!=fc4.Kc||k||f||this.secureToken?f&&!e.sig&&(e.fcauth=f):e.sig||(c="get");f=this.ia();fcxc(f,d,c,e,a,b,this.rpcToken)};var fc7=function(){this.j={};this.U="http://"+fcg[fcx].host;this.aa="default";this.fc=1;this.Pc=0;this.Mc="US";this.Nc="en";this.Oc=2147483647};fcV(fc7,fcsc);fc7[fc].v=fcvc;fc7[fc].B=new fcuc;fc7[fc].fb=function(a){this.fc=a};fc7[fc].Ka=function(a){this.Kc=a};fc7[fc].Ra=function(a){return"gadget_"+a};fc7[fc].w=function(a){return this.j[this.Ra(a)]};
fc7[fc].O=function(a){return new this.v(a)};fc7[fc].ob=function(a){a.id=this.Kb();this.j[this.Ra(a.id)]=a};fc7[fc].dc=0;fc7[fc].Kb=function(){return this.dc++};var fczc=function(){fc7[fcC](this);this.B=new fcyc};fcV(fczc,fc7);fczc[fc].v=fc6;fczc[fc].Y=function(a){a[fcD](/^http[s]?:\/\//)||(a=fcg[fcx][fcpa][fcD](/^[^?#]+\//)[0]+a);this.U=a};fczc[fc].I=function(a){var b=this.B.Qa(a);a.render(b)};var fcyc=function(){this.zb={}};fcV(fcyc,fctc);
fcyc[fc].pb=function(a,b){this.zb[a]=b;var c=fcg[fcv](b).className;c||0!=c[fco]||fcea(fcg[fcv](b),"gadgets-gadget-container")};fcyc[fc].Qa=function(a){return(a=this.zb[a.id])?fcg[fcv](a):null};var fc8=function(a){fc6[fcC](this,a);a=a||{};this.aa=a.view||"profile"};fcV(fc8,fc6);fc8[fc].rb="canvas.html";fc8[fc].xb="/friendconnect/embed/";
var fcwc=function(){var a="1"==fca[fcJ][fcy]().canvas||"1"==fca[fcJ][fcy]().embed,b=null;a&&(b=fca[fcJ][fcy]().caller);b||(a=fcg[fcx],b=a.search[fcs](/([&?]?)psinvite=[^&]*(&?)/,function(a,b,e){return e?b:""}),b=a.protocol+"//"+a.hostname+(a.port?":"+a.port:"")+a.pathname+b);return b};fc8[fc].Cc=function(a){this.aa=a};fc8[fc].na=function(){return this.aa};fc8[fc].getBodyId=function(){return this.ia()+"_body"};
fc8[fc].Jb=function(a){var b=this.specUrl;void 0===b&&(b="");var b=(fc4.Sa(b)||this.W)+this.tc,c=this.ia();fca.rpc.setRelayUrl(c,b);b='<div id="'+this.getBodyId()+'"><iframe id="'+c+'" name="'+c;b=0==this[fcM]?b+'" style="width:1px; height:1px;':b+'" style="width:100%;';this.viewParams.opaque&&(b+="background-color:white;");b+='"';b+=' frameborder="0" scrolling="no"';this.viewParams.opaque||(b+=' allowtransparency="true"');b+=this[fcM]?' height="'+this[fcM]+'"':"";b+=this[fcp]?' width="'+this[fcp]+
'"':"";b+="></iframe>";this.showEmbedThis&&(b+='<a href="javascript:void(0);" onclick="google.friendconnect.container.showEmbedDialog(\''+this.divId+"'); return false;\">Embed this</a>");b+="</div>";a(b)};
fc8[fc].Cb=function(){var a=fcwc(),a="canvas=1&caller="+fcd(a),b=fca[fcJ][fcy]().psinvite;b&&(a+="&psinvite="+fcd(b));a+="&site="+fcd(this.communityId);b=fcS(this.viewParams);if(null!=b.skin)for(var c="BG_IMAGE BG_COLOR FONT_COLOR BG_POSITION BG_REPEAT ANCHOR_COLOR FONT_FACE BORDER_COLOR CONTENT_BG_COLOR CONTENT_HEADLINE_COLOR CONTENT_LINK_COLOR CONTENT_SECONDARY_TEXT_COLOR CONTENT_SECONDARY_LINK_COLOR CONTENT_TEXT_COLOR ENDCAP_BG_COLOR ENDCAP_LINK_COLOR ENDCAP_TEXT_COLOR CONTENT_VISITED_LINK_COLOR ALTERNATE_BG_COLOR".split(" "),d=
0;d<c[fco];d++)delete b.skin[c[d]];b=fcd(fca[fcG][fcha](b));b=b[fcs]("\\","%5C");return fc4.U+this.rb+"?url="+fcd(this.specUrl)+(a?"&"+a:"")+"&view-params="+b};fc8[fc].D=function(a){a=a||fcc+this.xb+this.communityId;return this.Eb(a,"embed=1")};fc8[fc].C=function(a){return'<iframe src="'+this.D(a)+'" style="height:500px" scrolling="no" allowtransparency="true" border="0" frameborder="0" ></iframe>'};
fc8[fc].Eb=function(a,b){var c=fcd(fca[fcG][fcha](this.viewParams)),c=c[fcs]("\\","%5C");return a+"?url="+fcd(this.specUrl)+(b?"&"+b:"")+"&view-params="+c};fc8[fc].Nb=function(){var a="1"==fca[fcJ][fcy]().canvas||"1"==fca[fcJ][fcy]().embed,b=null;a&&((b=fca[fcJ][fcy]().caller)||(b="javascript:history.go(-1)"));return b};fc8[fc].Ob=function(a){var b=null;"canvas"==a?b=this.Cb():"profile"==a&&(b=this.Nb());return b};
var fc9=function(){fczc[fcC](this);fca.rpc[fcN]("signin",fc5[fc].signin);fca.rpc[fcN]("signout",fc5[fc].signout);fca.rpc[fcN]("resize_iframe",fc5[fc].eb);fca.rpc[fcN]("set_title",fc5[fc].setTitle);fca.rpc[fcN]("requestNavigateTo",fc5[fc].cb);fca.rpc[fcN]("api_loaded",fc5[fc].Ba);fca.rpc[fcN]("createFriendBarMenu",fc5[fc].Ga);fca.rpc[fcN]("showFriendBarMenu",fc5[fc].hb);fca.rpc[fcN]("hideFriendBarMenu",fc5[fc].Va);fca.rpc[fcN]("putReloadViewParam",fc5[fc].Za);fca.rpc[fcN]("getViewParams",fc5[fc].Ja);
fca.rpc[fcN]("getContainerBaseTime",fc5[fc].Ia);fca.rpc[fcN]("openLightboxIframe",fc5[fc].Ya);fca.rpc[fcN]("showMemberProfile",fc5[fc].jb);fca.rpc[fcN]("closeLightboxIframe",fcT(this.u,this));fca.rpc[fcN]("setLightboxIframeTitle",fcT(this.yc,this));fca.rpc[fcN]("refreshAndCloseIframeLightbox",fcT(this.hc,this));var a=fcAc;a[fcN]();a.kb(this,"load",this.Qb);a.kb(this,"start",this.Rb);this.W="../../";this.Y("");this.fb(0);this.Ka(1);this.ra=null;this.apiVersion="0.8";this.openSocialSecurityToken=null;
this.X="";this.Ha={};this.Yb=null;this.Xb=!1;this.vb=this.ac=this.lastIframeLightboxOpenArguments=this.lastLightboxCallback=this.lastLightboxDialog=null;this.Lc="post"};fcV(fc9,fczc);fc9[fc].wc=function(a){this.vb=a};fc9[fc].v=fc8;fc9[fc].T={};fc9[fc].Ac=function(a){this.ra=a};fc9[fc].Sa=function(a){var b=fc9[fc].T[a];b||(0!==this.ra[fcz]("http://")?(a=this.tb(a),b=["http://",a,this.ra][fcO]("")):b=this.ra);return b};
fc9[fc].tb=function(a){var b=new SHA1;a=fclb(a);b.update(a);b=b.digest();return b=fcqc(b)};
var fcBc=function(a,b){var c=b?b:fcf.top,d=c.frames;try{if(c.frameElement.id==a)return c}catch(e){}for(c=0;c<d[fco];++c){var f=fcBc(a,d[c]);if(f)return f}return null},fcxc=function(a,b,c,d,e,f,l){var k="gfc_load_"+a;b='<html><head><style type="text/css">body {background:transparent;}</style>'+(fcX?'<script type="text/javascript">window.goback=function(){history.go(-1);};setTimeout("goback();", 0);\x3c/script>':"")+"</head><body><form onsubmit='window.goback=function(){};return false;' style='margin:0;padding:0;' id='"+
k+"' method='"+c+"' ' action='"+fca[fcJ].escapeString(b)+"'>";for(var m in d)b+="<input type='hidden' name='"+m+"' value='' >";b+="</form></body></html>";c=fcBc(a);var n;try{n=c[fct]||c.contentWindow[fct]}catch(h){e&&f&&(fck(e,""),fck(e,f),c=fcBc(a),n=c[fct]||c.contentWindow[fct])}l&&fca.rpc.setAuthToken(a,l);n.open();n.write(b);n.close();a=n[fcv](k);for(m in d)a[m].value=d[m];if(fcX)a.onsubmit();a.submit()};
fc9[fc].yb=function(){var a=fca[fcJ][fcy]().fcsite,b=fca[fcJ][fcy]().fcprofile;a&&b&&fc4.Aa(b,a)};fc9[fc].xc=function(a,b){this.T[a]=b};fc9[fc].V=function(){var a=/Version\/3\..*Safari/;if(a=fcY&&fcZa()[fcD](a))fcg[fcx].reload();else{null!=fc4.g&&fc4.g.refresh();for(var b in fc4.j)a=fc4.j[b],this.I(a);null!=this.lastIframeLightboxOpenArguments&&(b=this.lastIframeLightboxOpenArguments,this.u(),this.ta[fcK](this,b))}};
fc9[fc].Y=function(a){a[fcD](/^http[s]?:\/\//)||(a=a&&0<a[fco]&&"/"==a[fcqa](0,1)?fcg[fcx][fcpa][fcD](/^http[s]?:\/\/[^\/]+\//)[0]+a[fcqa](1):fcg[fcx][fcpa][fcD](/^[^?#]+\//)[0]+a);this.U=a};fc9[fc].ga=function(a){return"fcauth"+a};fc9[fc].ma=function(a){return"fcauth"+a+"-s"};fc9[fc].hash=function(a,b){var c=new SHA1,d=fcsb(a,!0),c=new G_HMAC(c,d,64),d=fclb(b),c=c.Ib(d);(new Date).getTime();return fcrb(c,!0)};
fc9[fc].Na=function(a){return a=fcub.get(this.ga(a))||fcub.get(this.ma(a))||this.Ha[a]||""};fc9[fc].Z=function(a){this.W=a};fc9[fc].Bc=function(a){this.X=a};fc9[fc].O=function(a){a=new this.v(a);a.Z(this.W);return a};fc9[fc].na=function(){return this.aa};fc9[fc].zc=function(a){this.ac=a};var fc$=function(a){return(a=a[fcD](/_([0-9]+)$/))?fcaa(a[1],10):null};
fc9[fc].$=function(a,b,c,d,e,f){this.Jc||(this.ba(fcf.friendconnect_serverBase+"/friendconnect/styles/container.css?d="+this.X),this.Jc=!0);var l=fcCc(d);this.Yb!=(l?"rtl":"ltr")&&(this.ba(fcf.friendconnect_serverBase+"/friendconnect/styles/lightbox"+(l?"-rtl":"")+".css?d="+this.X),this.Yb=l?"rtl":"ltr");this.Xb||(this.qb(fcf.friendconnect_serverBase+"/friendconnect/script/lightbox.js?d="+this.X),this.Xb=!0);b=b||0;if(goog.ui&&goog.ui[fcla]){this.u();b=new goog.ui[fcla]("lightbox-dialog",!0);var k=
this;goog.events.listen(b,goog.ui[fcla].EventType.AFTER_HIDE,function(){k.lastLightboxCallback&&k.lastLightboxCallback();k.Fa()});b.setDraggable(!0);b.setDisposeOnHide(!0);b.setBackgroundElementOpacity(0.5);b.setButtonSet(new goog.ui[fcla].ButtonSet);this.lastLightboxDialog=b;this.lastLightboxCallback=c||null;c=b.getDialogElement();e=e||702;fcSb(c,"width",fce(e)+"px");f&&fcSb(c,"height",fce(f)+"px");a(b);b.getDialogElement()[fcA].direction=l?"rtl":"ltr"}else if(5>b)b++,a=fcT(this.$,this,a,b,c,d,e,
f),fcba(a,1E3);else throw this.Fa(),fcb("lightbox.js failed to load");};fc9[fc].u=function(a){var b=this.lastLightboxDialog,c=this.lastLightboxCallback;this.lastLightboxCallback=null;null!=b&&(this.lastLightboxDialog.dispatchEvent(goog.ui[fcla].EventType.AFTER_HIDE),b.dispose(),null!=c&&c(a))};fc9[fc].Fa=function(){this.lastIframeLightboxOpenArguments=this.lastLightboxCallback=this.lastLightboxDialog=null};fc9[fc].yc=function(a){this.lastLightboxDialog&&this.lastLightboxDialog.setTitle(a)};
fc9[fc].hc=function(){this.u();this.V()};fc5[fc].cb=function(a,b){var c=fc$(this.f),c=fc4.w(c),d=fcS(c.originalParams);b&&(d["view-params"]=d["view-params"]||{},d["view-params"]=b);d.locale=c.locale;if(c.useLightBoxForCanvas)d.presentation=a,null!=fc4.lastLightboxDialog?fc4.u():fc4.ib(d);else if((c=c.Ob(a))&&fcg[fcx][fcpa]!=c)if("1"==fca[fcJ][fcy]().embed)try{fcf.parent.location=c}catch(e){fcf.top.location=c}else fcg[fcx].href=c};
fc9[fc].ib=function(a,b){a=a||{};var c=a.locale,d=fcCc(c),e=this;this.u();this.$(function(b){var c=fc0("div",{},fc0("div",{id:"gadget-signin",style:"background-color:#ffffff;height:32px;"}),fc0("div",{id:"gadget-lb-canvas",style:"background-color:#ffffff;"}));b.getTitleTextElement()[fcm](fc0("div",{id:"gfc-canvas-title",style:"color:#000000;"}));b[fcra]()[fcm](c);b.setVisible(!0);var c=fcS(a),k=fcKb(fcf),m=fci[fcq](0.7*k[fcM]),k={BORDER_COLOR:"#cccccc",ENDCAP_BG_COLOR:"#e0ecff",ENDCAP_TEXT_COLOR:"#333333",
ENDCAP_LINK_COLOR:"#0000cc",ALTERNATE_BG_COLOR:"#ffffff",CONTENT_BG_COLOR:"#ffffff",CONTENT_LINK_COLOR:"#0000cc",CONTENT_TEXT_COLOR:"#333333",CONTENT_SECONDARY_LINK_COLOR:"#7777cc",CONTENT_SECONDARY_TEXT_COLOR:"#666666",CONTENT_HEADLINE_COLOR:"#333333"};c.id="gadget-lb-canvas";fcl(c,fci.min(498,m)+"px");c.maxHeight=m;c.keepMax&&(fcl(c,m),fcSb(b[fcra](),"height",m+35+"px"));c["view-params"]=c["view-params"]||{};c["view-params"].opaque=!0;c["view-params"].skin=c["view-params"].skin||{};fcJa(c["view-params"].skin,
k);e.render(c);m={id:"gadget-signin",presentation:"canvas"};m.site=c.site;m.titleDivId="gfc-canvas-title";m["view-params"]={};m["view-params"].opaque=!0;m.keepMax=c.keepMax;c.securityToken&&(m.securityToken=c.securityToken);c=fcS(k);c.ALIGNMENT=d?"left":"right";e.ab(m,c);b.reposition()},void 0,b,c)};fc5[fc].hb=function(a,b){null!=fc4.g&&fc4.g.Ec(a,b)};fc5[fc].Va=function(a){null!=fc4.g&&fc4.g.oa(a)};
fc5[fc].Ya=function(a,b,c,d,e,f,l,k,m,n){var h=this.f;a=a+(0<=a[fcz]("?")?"&":"?")+"iframeId="+h;fc4.ta(a,b,c,d,e,f,l,k,m,n,this.callback)};
fc9[fc].ta=function(a,b,c,d,e,f,l,k,m,n,h){var g=fcKb(fcf);null==d&&(d=fci[fcq](0.7*g[fcM]));null==c&&(c=fci[fcq](0.7*g[fcp]));for(var p=[],g=0;g<arguments[fco]&&10>g;g++)p[fcn](arguments[g]);if("/"==!a[0])throw fcb("lightbox iframes must be relative to fc server");var r=this,q=f?fcS(f):{},t=fce(fci[fcq](2147483647*fci[fcoa]())),s="gfc_lbox_iframe_"+t;fca.rpc.setAuthToken(s,t);b||(b=fc4.openSocialSecurityToken);var u=fc4.openSocialSiteId;fc4.$(function(c){r.lastIframeLightboxOpenArguments=p;var f=
"st="+fcd(b)+"&parent="+fcd(fc4.U)+"&rpctoken="+fcd(t);k||(q.iframeId=s,q.iurl=a,a=fcc+"/friendconnect/lightbox");var g=d-54;fcl(q,g);var h='<iframe id="'+s,h=h+('" width="100%" height="'+g+'" frameborder="0" scrolling="auto"></iframe>');c.setContent(h);e&&(c.setTitle(e),n&&(g=c.getTitleTextElement(),fcEb(g,"lightbox-dialog-title-small-text")));c.setVisible(!0);m||(q.fcauth=fc4.Na(u));a+=(0<=a[fcz]("?")?"&":"?")+f+"&communityId="+u;fcxc(s,a,"POST",q,null,null,null)},void 0,h,void 0,c,d)};
fc5[fc].Ja=function(){var a=fc$(this.f),a=fc4.w(a);return a.viewParams};fc5[fc].Ia=function(){return fcrc};fc5[fc].Za=function(a,b){var c=fc$(this.f),c=fc4.w(c);c.viewParams[a]=b};fc9[fc].Qb=function(a,b){null!=fc4.g&&fc4.g.bc(b)};fc9[fc].Rb=function(a,b){null!=fc4.g&&fc4.g.cc(b)};fc5[fc].Ga=function(a,b,c,d){null!=fc4.g&&fc4.g.ub(a,b,c,d)};fc9[fc].I=function(a){var b=this.B.Qa(a);a.render(b);this.B.postProcessGadget&&this.B.postProcessGadget(a)};
fc5[fc].signout=function(a){fc4.$a(fc4.ga(a));fc4.$a(fc4.ma(a));fc4.Ha={};fc4.V();return!1};fc9[fc].$a=function(a){for(var b=fcg[fcx].pathname,b=b[fcu]("/"),c=0;c<b[fco];c++){for(var d=fch(c+1),e=0;e<c+1;e++)d[e]=b[e];fcub.remove(a,d[fcO]("/")+"/")}};
fc5[fc].eb=function(a){var b=fcg[fcv](this.f);b&&0<a&&fcl(b[fcA],a+"px");(b=fcg[fcv](this.f+"_body"))&&0<a&&fcl(b[fcA],a+"px");if(b=fc$(this.f)){var c=fc4.w(b);c&&((b=fcg[fcv](c.divId))&&0<a&&(c&&(c[fcsa]&&c[fcsa]<a)&&(a=c[fcsa],b[fcA].overflowY="auto"),fcl(b[fcA],a+"px")),!c.keepMax&&("canvas"==c.na()&&fc4.lastLightboxDialog)&&fc4.lastLightboxDialog.reposition(),fcSb(c.chrome,"visibility","visible"))}};fc5[fc].setTitle=function(a){var b=fc$(this.f),b=fc4.w(b);(b=b.titleDivId)&&fck(fcg[fcv](b),fca[fcJ].escapeString(a))};
fc5[fc].signin=function(a,b,c){fcub.set(fc4.ga(a),b,31104E3,c);fcub.set(fc4.ma(a),b,-1,c);fc4.Ha[a]=b;fc4.V()};var fcEc=function(a){fcgc(a,fcDc)};fc9[fc].nc=function(a,b){b&&this.m(b,a);var c={};c.url=fcc+"/friendconnect/gadgets/members.xml";this.render(this.s(a,c))};fc9[fc].pc=function(a,b){b&&this.m(b,a);var c={};c.url=fcc+"/friendconnect/gadgets/review.xml";c["view-params"]={startMaximized:"true",disableMinMax:"true",features:"review"};this.render(this.s(a,c))};
fc9[fc].va=function(a,b){b&&this.m(b,a);var c={};c.url=fcc+"/friendconnect/gadgets/wall.xml";c["view-params"]={startMaximized:"true",disableMinMax:"true",features:"comment"};this.render(this.s(a,c))};fc9[fc].ab=function(a,b){b&&this.m(b,a);var c={};c.url=fcc+"/friendconnect/gadgets/signin.xml";fcl(c,32);this.render(this.s(a,c))};
fc9[fc].kc=function(a,b){b&&this.m(b,a);a.prefs=a.prefs||{};a.sendViewParamsToServer=!0;a.prefs.hints=fcf.google_hints;var c={};c.url=fcc+"/friendconnect/gadgets/ads.xml";fcl(c,90);this.render(this.s(a,c))};fc9[fc].ya=function(a,b){if(a.id){b&&this.m(b,a);a["view-params"]=a["view-params"]||{};a["view-params"].opaque="true";this.g=new fc2(a);this.g.render();var c={};c.url=fcc+"/friendconnect/gadgets/friendbar.xml";a.id=this.g.t;fcl(a,"1");this.render(this.s(a,c))}};fc9[fc].mc=fc9[fc].ya;
fc9[fc].xa=function(a,b){a=a||{};a.url=fcc+"/friendconnect/gadgets/signin.xml";a.site=a.site||fca[fcJ][fcy]().site;fcl(a,32);this.wa(a,b)};fc9[fc].lc=fc9[fc].xa;fc9[fc].rc=fc9[fc].va;fc9[fc].m=function(a,b){var c=b["view-params"];c||(c={},b["view-params"]=c);c.skin=a};fc9[fc].s=function(a,b){var c=this.Xa(b,a);if(b["view-params"]){var d=b["view-params"];a["view-params"]&&(d=this.Xa(d,a["view-params"]));c["view-params"]=d}return c};fc9[fc].oc=function(a,b){b&&this.m(b,a);this.render(a)};
fc9[fc].Xa=function(a,b){var c={},d;for(d in b)c[d]=b[d];for(d in a)"undefined"==typeof c[d]&&(c[d]=a[d]);return c};
fc9[fc].render=function(a){this.openSocialSiteId=a.site;a["view-params"]=a["view-params"]||{};var b=this.O({divId:a.id,specUrl:a.url,communityId:a.site,height:a[fcM],locale:a.locale||this.ac,secureToken:a.securityToken,titleDivId:a.titleDivId,showEmbedThis:a.showEmbedThis,useLightBoxForCanvas:a.useLightBoxForCanvas||"undefined"==typeof a.useLightBoxForCanvas&&fcf.friendconnect_lightbox,viewParams:a["view-params"],prefs:a.prefs,originalParams:a,debug:a.debug,maxHeight:a[fcsa],sendViewParamsToServer:a.sendViewParamsToServer,
keepMax:a.keepMax});a.presentation&&b.Cc(a.presentation);this.ob(b);this.B.pb(b.id,a.id);fcba(function(){fc4.I(b)},0);return b.id};fc9[fc].qc=function(a,b){a=a||{};a.presentation="canvas";this.bb(a,b)};
fc9[fc].bb=function(a,b,c){a=a||{};a.url=fca[fcJ][fcy]().url;a.site=fca[fcJ][fcy]().site||a.site;var d=fca[fcJ][fcy]()["view-params"];d&&(a["view-params"]=fca[fcG].parse(decodeURIComponent(d)));c&&(a["view-params"]=a["view-params"]||{},a["view-params"].useFixedHeight=!0,fcl(a["view-params"],c),b=b||{},b.HEIGHT=fce(c));this.wa(a,b)};fc9[fc].wa=function(a,b){a=a||{};b&&this.m(b,a);"1"==fca[fcJ][fcy]().canvas?a.presentation="canvas":"1"==fca[fcJ][fcy]().embed&&(a.presentation="embed");fc4.render(a)};
fc9[fc].Pb=function(){var a=fca[fcJ][fcy]().caller;a&&fcg[fcx][fcpa]!=a&&8<a[fco]&&("http://"==a.substr(0,7)[fcAa]()||"https://"==a.substr(0,8)[fcAa]())?fcg[fcx].href=a:(a=fca[fcJ][fcy]().site)?fcg[fcx].href=fcc+"/friendconnect/directory/site?id="+a:fcf.history.go(-1)};fc9[fc].H="";fc9[fc].Lb=function(){return this.H};fc9[fc].uc=function(a){this.apiVersion=a};fc9[fc].ba=function(a){var b=fcg[fcF]("link");b[fcI]("rel","stylesheet");b[fcI]("type","text/css");b[fcI]("href",a);fcg.getElementsByTagName("head")[0][fcm](b)};
fc9[fc].qb=function(a){var b=fcg[fcF]("script");b[fcI]("src",a);b[fcI]("type","text/javascript");fcg.getElementsByTagName("head")[0][fcm](b)};fc9[fc].Ea=function(a){fcg[fcB]?a():fcf[fcH]?fcf[fcH]("load",a,!1):fcf.attachEvent("onload",a)};fc9[fc].pa=function(a){if(!a.site)throw"API not loaded, please pass in a 'site'";this.ba(fcf.friendconnect_serverBase+"/friendconnect/styles/container.css?d="+this.X);this.openSocialSiteId=a.site;this.apiLoadedCallback=a.onload;this.Ea(fcT(this.Wa,this,a,"fc-opensocial-api"))};
fc9[fc].$b=fc9[fc].pa;fc9[fc].Sb=function(a){var b={};b.site=this.openSocialSiteId;b["view-params"]={txnId:a};this.Wa(b,"gfc-"+a)};fc9[fc].jc=function(a){var b={},c;for(c in this.j){var d=this.j[c];if(d.viewParams&&d.viewParams.txnId==a)break;else b[c]=d}this.j=b;(a=fcg[fcv]("gfc-"+a))&&(a.parentNode&&a.parentNode.removeChild)&&a.parentNode.removeChild(a)};fc9[fc].Fb=function(){return"<Templates xmlns:fc='http://www.google.com/friendconnect/makeThisReal'>  <Namespace prefix='fc' url='http://www.google.com/friendconnect/makeThisReal'/>  <Template tag='fc:signIn'>    <div onAttach='google.friendconnect.renderSignInButton({element: this})'></div>  </Template></Templates>"};
fc9[fc].Mb=function(){return"<Templates xmlns:os='http://ns.opensocial.org/2008/markup'><Namespace prefix='os' url='http://ns.opensocial.org/2008/markup'/><Template tag='os:Name'>  <span if='${!My.person.profileUrl}'>${My.person.displayName}</span>  <a if='${My.person.profileUrl}' href='${My.person.profileUrl}'>      ${My.person.displayName}</a></Template><Template tag='os:Badge'>  <div><img if='${My.person.thumbnailUrl}' src='${My.person.thumbnailUrl}'/>   <os:Name person='${My.person}'/></div></Template><Template tag='os:PeopleSelector'>  <select onchange='google.friendconnect.PeopleSelectorOnChange(this)' name='${My.inputName}'          multiple='${My.multiple}' x-var='${My.var}' x-max='${My.max}'          x-onselect='${My.onselect}'>    <option repeat='${My.group}' value='${Cur.id}' selected='${Cur.id == My.selected}'>        ${Cur.displayName}    </option>  </select></Template></Templates>"};
var fcFc=function(a){var b;if(a.multiple){b=[];for(var c=0;c<a[fcE][fco];c++)a[fcE][c].selected&&b[fcn](a[fcE][c].value);c=a.getAttribute("x-max");try{c*=1}catch(d){c=0}if(c&&b[fco]>c&&a["x-selected"])for(b=a["x-selected"],c=0;c<a[fcE][fco];c++){a[fcE][c].selected=!1;for(var e=0;e<b[fco];e++)if(a[fcE][c].value==b[e]){a[fcE][c].selected=!0;break}}}else b=a[fcE][a.selectedIndex].value;a["x-selected"]=b;(c=a.getAttribute("x-var"))&&fcf.opensocial[fcka]&&fcf.opensocial[fcka].getDataContext().putDataSet(c,
b);if(c=a.getAttribute("x-onselect"))if(fcf[c]&&"function"==typeof fcf[c])fcf[c](b);else a["x-onselect-fn"]?a["x-onselect-fn"][fcK](a):a["x-onselect-fn"]=new Function(c)};
fc9[fc].Wa=function(a,b){fcf.opensocial.template.Loader.loadContent(this.Mb());fcf.opensocial.template.Loader.loadContent(this.Fb());fcf.opensocial[fcka].processDocumentMarkup();var c=fcg[fcF]("div");c.id=b;fcl(c[fcA],"0px");fcj(c[fcA],"0px");c[fcA].position="absolute";c[fcA].visibility="hidden";fcg[fcB][fcm](c);var d={};d.url=fcc+"/friendconnect/gadgets/osapi-"+this.apiVersion+".xml";fcl(d,0);d.id=c.id;d.site=a.site;d["view-params"]=a["view-params"];this.render(d)};
fc5[fc].Ba=function(){fc4.H=this.f;fc4.openSocialSecurityToken=this.a[0];var a=fc4.openSocialSecurityToken;fcf.opensocial[fcka].executeRequests();fcf.opensocial.template.process();fc4.apiLoadedCallback&&(a=fcIa(fc4.apiLoadedCallback,a),fcba(a,0))};fc9[fc].R=function(a){var b=null,c;for(c in this.j)if(this.j[c].divId==a){b=this.j[c];break}return b};fc9[fc].D=function(a,b){var c=this.R(a),d=null;c&&(d=c.D(b));return d};fc9[fc].C=function(a,b){var c=this.R(a),d=null;c&&(d=c.C(b));return d};
fc9[fc].Dc=function(a,b){this.$(function(c){var d=fcg.createTextNode("Copy & paste this code into your site.");c[fcra]()[fcm](d);c[fcra]()[fcm](fcg[fcF]("br"));var d=fc4.C(a,b),e=fcg[fcF]("textarea");fck(e,d);e[fcI]("style","width:500px;");c[fcra]()[fcm](e);c.setVisible(!0)})};var fcGc="ar dv fa iw he ku pa sd tk ug ur yi".split(" "),fcCc=function(a){var b=!1;a?(a=a[fcu]("_")[0],b=fcib(fcGc,a)):b=(a=fcUb(fcg[fcB],"direction"))&&"rtl"==a;return b};
fc5[fc].jb=function(a,b){var c=0,d=null;try{var e=fc$(this.f),f=fc4.w(e),d=f.secureToken,c=f.communityId}catch(l){}b&&(c=b);fc4.Aa(a,c,this.callback,d)};fc9[fc].Aa=function(a,b,c,d){b=b||this.openSocialSiteId;a={keepMax:!0,presentation:"canvas",url:fcc+"/friendconnect/gadgets/members.xml",site:b,"view-params":{profileId:a}};d&&(a.securityToken=d);this.ib(a,c)};fc9[fc].Hb=function(a){var b=null;(a=this.R(a))&&a.secureToken&&(b=a.secureToken);return b};
fc9[fc].Gb=function(a){var b=null;(a=this.R(a))&&a.communityId&&(b=a.communityId);return b};var fcDc=function(a){fc4.H&&fcac(fc4.H,a)},fcHc=function(){fc5[fc].signout(fc4.openSocialSiteId)},fcIc=function(){fcdc(fc4.H)},fcJc=function(a,b){fc8b(a,b)},fcmc=function(){this.p={}};fcmc[fc].register=function(){fca.rpc[fcN]("subscribeEventType",fc5[fc].subscribe);fca.rpc[fcN]("publishEvent",fc5[fc].publish)};fc5[fc].subscribe=function(a){var b=fcAc;b.p[a]=b.p[a]||[];a=b.p[a];a[a[fco]]={frameId:this}};
fcmc[fc].kb=function(a,b,c){var d=this;d.p[b]=d.p[b]||[];b=d.p[b];b[b[fco]]={container:a,callback:c}};fc5[fc].publish=function(a){var b=fcAc,c=0;this.f&&(c=fc$(this.f));b.p[a]=b.p[a]||[];for(var b=b.p[a],d=0;d<b[fco];d++)b[d].container?b[d].callback[fcC](b[d].container,a,c):fca.rpc[fcC](b[d].frameId,a,null,a,c)};var fcnc=fcT(fc5[fc].publish,new fc5),fcAc=new fcmc,fc4=new fc9;fc4.Ea(fc4.yb);fcU("google.friendconnect.container",fc4);fcU("google.friendconnect.container.refreshGadgets",fc4.V);
fcU("google.friendconnect.container.setParentUrl",fc4.Y);fcU("google.friendconnect.container.setServerBase",fc4.Z);fcU("google.friendconnect.container.setServerVersion",fc4.Bc);fcU("google.friendconnect.container.createGadget",fc4.O);fcU("google.friendconnect.container.openLightboxIframe",fc4.ta);fcU("google.friendconnect.container.renderGadget",fc4.I);fcU("google.friendconnect.container.render",fc4.render);fcU("google.friendconnect.container.goBackToSite",fc4.Pb);
fcU("google.friendconnect.container.renderMembersGadget",fc4.nc);fcU("google.friendconnect.container.renderReviewGadget",fc4.pc);fcU("google.friendconnect.container.renderCommentsGadget",fc4.va);fcU("google.friendconnect.container.renderSignInGadget",fc4.ab);fcU("google.friendconnect.container.renderFriendBar",fc4.mc);fcU("google.friendconnect.container.renderSocialBar",fc4.ya);fcU("google.friendconnect.container.renderCanvasSignInGadget",fc4.lc);
fcU("google.friendconnect.container.renderUrlCanvasGadget",fc4.qc);fcU("google.friendconnect.container.renderEmbedSignInGadget",fc4.xa);fcU("google.friendconnect.container.renderUrlEmbedGadget",fc4.bb);fcU("google.friendconnect.container.renderEmbedGadget",fc4.wa);fcU("google.friendconnect.container.renderWallGadget",fc4.rc);fcU("google.friendconnect.container.renderAdsGadget",fc4.kc);fcU("google.friendconnect.container.renderOpenSocialGadget",fc4.oc);
fcU("google.friendconnect.container.setNoCache",fc4.fb);fcU("google.friendconnect.container.enableProxy",fc4.Ka);fcU("google.friendconnect.container.setDomain",fc4.xc);fcU("google.friendconnect.container.setLockedDomainSuffix",fc4.Ac);fcU("google.friendconnect.container.setLocale",fc4.zc);fcU("google.friendconnect.container.loadOpenSocialApi",fc4.$b);fcU("google.friendconnect.container.initOpenSocialApi",fc4.pa);fcU("google.friendconnect.container.getOpenSocialApiIframeId",fc4.Lb);
fcU("google.friendconnect.container.setApiVersion",fc4.uc);fcU("google.friendconnect.container.getEmbedUrl",fc4.D);fcU("google.friendconnect.container.getEmbedHtml",fc4.C);fcU("google.friendconnect.container.getGadgetSecurityToken",fc4.Hb);fcU("google.friendconnect.container.getGadgetCommunityId",fc4.Gb);fcU("google.friendconnect.container.showEmbedDialog",fc4.Dc);fcU("google.friendconnect.container.showMemberProfile",fc4.Aa);fcU("google.friendconnect.requestSignIn",fcDc);
fcU("google.friendconnect.requestSignOut",fcHc);fcU("google.friendconnect.requestSettings",fcIc);fcU("google.friendconnect.requestInvite",fcJc);fcU("google.friendconnect.renderSignInButton",fcEc);fcU("google.friendconnect.container.invokeOpenSocialApiViaIframe",fc4.Sb);fcU("google.friendconnect.container.removeOpenSocialApiViaIframe",fc4.jc);fcU("google.friendconnect.userAgent.WEBKIT",fcY);fcU("google.friendconnect.userAgent.IE",fcX);fcU("google.friendconnect.PeopleSelectorOnChange",fcFc);
fcU("google.friendconnect.container.setDateStamp_",fc4.wc);
google.friendconnect.container.setServerBase('http://www-a-fc-opensocial.googleusercontent.com/ps/');google.friendconnect.container.setServerVersion('0.1-22c1fc1e_73bd0b97_5210c63e_9006a6ed_2b8a2ccb.7');google.friendconnect.container.setApiVersion('0.8');
google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/activities.xml', 'http://q8j0igk2u2f6kf7jogh6s66md2d7r154-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/ads.xml', 'http://t767uouk8skpac15v8ue0n16regb3m2t-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/ask.xml', 'http://uofgf6lm45rimd9jp6hn983ul6n2en81-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/friendbar.xml', 'http://p7rjrrl49ose4gob99eonlvp0drmce3d-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/content_reveal.xml', 'http://n0mc7q283f00tpk3uifa7sjv4hmrults-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/chat.xml', 'http://4mmefl67as0q39gf1o4pnocubqmdgei0-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/donate.xml', 'http://7v4nflqvq38notsghmcr5a9t6o9g6kn4-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/lamegame.xml', 'http://ffbrstu9puk7qmt45got9mqe5k7ijrs4-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/map.xml', 'http://k0dfp8trn0hi5d2spmo7jmc88n6kr1cc-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/members.xml', 'http://r1rk9np7bpcsfoeekl0khkd2juj27q3o-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/newsletterSubscribe.xml', 'http://k830suiki828goudg9448o6bp0tpu5r3-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/poll.xml', 'http://1ivjd75aqp679vbgohjv74tlhn13rgdu-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/recommended_pages.xml', 'http://iqavu79a908u5vcecp0pq80hhbhkv33b-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/review.xml', 'http://r85jiaoot111joesr8bilfhfeslcc496-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/sample.xml', 'http://785aoao97uti9iqffknjp5e0kn2ljlm4-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/signin.xml', 'http://8fkcem1ves287v3g5lu9gep1j91p3kk1-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/wall.xml', 'http://o29lt44ell30t7ljcdfr8lq2mjakv2co-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setDomain('http://www.google.com/friendconnect/gadgets/osapi-0.8.xml', 'http://mc8tdi0ripmbpds25eboaupdulritrp6-a-fc-opensocial.googleusercontent.com/ps/');

google.friendconnect.container.setLockedDomainSuffix('-a-fc-opensocial.googleusercontent.com/ps/');
window['__ps_loaded__'] = true; 
 }google.friendconnect_ = google.friendconnect;
google.friendconnect.container.setDateStamp_('1419c655e71');