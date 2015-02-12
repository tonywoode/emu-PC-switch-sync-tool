if(!com) var com={};
if(!com.gTranslator) com.gTranslator =
{
	srid: 0,
    settings: {hasInit: false,engine:""},

	domains:["google","ask","bing","yahoo"],
	/*
    * utils
    */
	urlValue: function(vl, url)
	{
		if(!url)url = window.location.href;
		var pt = /*"&" + */vl + "=";
		var ptl = pt.length;
		var vb = url.indexOf(pt);		
		if(vb != -1)
		{
			var ve = url.indexOf("&",vb + ptl);
			var vv = url.substr(vb + ptl, ve-vb-ptl);		
			return vv;
		} 
		return "";
	},
	
	query: function()
	{
		var qi = $(this.settings.q);
		var gn = qi.length;
		qq = qi.attr("value");
		if(qq == "")
		{
			for (var i=0; i< gn; i++)
			{
				qq = $(qi[i]).attr("value");
				if(qq != "")return qq;
			}
		}		
		return qq; 
	},

	page: function()
	{
		return Number(com.gTranslator.urlValue(com.gTranslator.settings.start));
	},

    /*
    * engine urls
    */

	isGoogle: function(href)
	{
		if(this.settings.engine == "google") return true;
		
		var spl = href.match(/http[s]?:\/\/www[0-9]?\.google\.[^\/]+\/(\w+)?/i);
		var good = false;
		
		if(spl)
		{
			if(spl[1] == undefined) good = true;
			if(spl[1] == "webhp") good = true;
			if(spl[1] == "search") good = true;
			if(spl[1] == "news") good = true;
		}		
		
		if(good)
		{
			this.settings.engine = "google";
    		return true;			
		}
		return false;
    },
	
    isYahoo: function(href)
    {
    	if(this.settings.engine == "yahoo") return true;
    	
    	if(href.match(/http(s)?:\/\/.*search\.yahoo\.com\/search/i))
    	{
    		this.settings.engine = "yahoo";
    		return true;
    	}
        return false;
    },
    
    isBing: function(href)
    {
    	if(this.settings.engine == "bing") return true;
    	
    	if(href.match(/http(s)?:\/\/.*bing\.com\/(images\/)?search/i))
    	{
    		this.settings.engine = "bing";
    		return true;
    	}
        return false;
    },	

    isAsk: function(href)
    {    	
    	if(this.settings.engine == "ask") return true;
    	
		var spl = href.match(/http[s]?:\/\/www\.ask\.com\/(\w+)?/i);
		var good = false;
		
		if(spl)
		{
			if(spl[1] == undefined) good = true;
			if(spl[1] == "web") good = true;
			if(spl[1] == "news") good = true;
		}		
    	
        if(good)
    	{
    		this.settings.engine = "ask";
    		return true;
    	}
        return false;        
    },    
    
    isSupport: function(href)
    { 
    	var domain = this.doc.domain;
    	if(!domain)return false;
    	var domains = this.domains;
    	for (var i=0; i < domains.length; i++)
    	{
    		if(domain.indexOf(domains[i]) != -1)
    		{
    			return true;
    		}		  
		};
    	return false;    	    	
    },

	isGoodUrl: function(href)
	{
		if(!this.isSupport(href))
			return false;
		
		// regular check
		if(!(this.isGoogle(href) || this.isYahoo(href) || this.isBing(href) || this.isAsk(href)))
			return false;
		
		return true;
	},

	main: function()
	{
		this.doc = document;
		var href = this.doc.location.href;
		if(!this.isGoodUrl(href))return;
		this.init();		
	},
    /*
    *
    * Init
    *
    */
    init: function()
    {
		if(this.settings.hasInit)return;
		this.settings.hasInit = true;
		switch(this.settings.engine)
		{
			case "google":
				this.settings.fads = function(ad){
					$("#center_col #taw").html(ad).show();
				};
				this.settings.fad = function(ad){
					var pp = "#rhscol";					
					if ($("#rhs_block").length > 0) {
						pp = "#rhs_block";					
					}else{
						ad.css("top", "0");
					}
					$(ad).prependTo($(pp)).show();
				}
				this.settings.adpcl = "gl";
			
				this.settings.q = "input[name$='q']"//"input.lst";			
				this.settings.start = 'start';
				this.settings.live = "#ires";

				break;

			case "yahoo":
				this.settings.q = "#yschsp";
				this.settings.start = 'b';

				this.settings.fads = function(ad){
					$("#vdls-main").after($(ad));
				};
				this.settings.fad = function(ad){
					$(ad).appendTo($("#right")).show();
				}
				this.settings.adpcl = "yh";

				break;

			case "ask":
				this.settings.results = "#web";	
				this.settings.q = "#top_q_comm";
				this.settings.start = 'page';

				this.settings.fads = function(ad){
					$("#vdls-main").after($(ad));
				};
				this.settings.fad = function(ad){
					$(ad).prependTo($(".c1")).show();
				}
				this.settings.adpcl = "ask";
				this.settings.live = ".c2";

				break;
			
			case "bing":
    			this.settings.q = "#sb_form_q";
				this.settings.start = 'first';					
				this.settings.fads = function(ad){
					$(".sb_ph").after($(ad));
				};
				this.settings.fad = function(ad){
					$(ad).appendTo($("#sidebar")).show();
				}
				this.settings.adpcl = "bn";
				break;
		}
			
		if(this.settings.live)
		{
			setInterval(function()
			{
				var obj = $(com.gTranslator.settings.live);
				if(obj && !obj.hasClass("vdls-live"))
				{
					obj.addClass("vdls-live");
					com.gTranslator.applyAgain();
				}
			}, 1000);			
		}else{
			com.gTranslator.applyAgain();
		}
	},

	applyAgain: function()
	{
		if($("#vdls-main").length != 0) return;
    	if(this.settings.engine == "google")
    	{
			// fix #rhs
			if ($("#rhs_block").length == 0)
			{
				$('<div id="rhs"><div id="rhs_block"></div></div>').prependTo($('#rhscol'));
			}
			var tbm = this.urlValue("tbm");
			if(tbm == "" || tbm == "blg" || tbm == "dsc")
			{
				this.adv();
			}
    	}else{
	   		this.adv();
   		}
	},

    adv: function()
    {
    	var sss = this.settings;
		var qq = this.query();
		var page = this.page();
		if(sss.adpr == qq && sss.adprp == page)
		{
			this.applyAdv();
		}else{
			sss.adpr = qq;
			sss.adprp = page;

			this.sendRequest({
					type:'getAX', 
					terms: qq,
					page: page,
					ref: window.location.href,
					engine: this.settings.engine
			}, function(result){
				com.gTranslator.onGetAdv(result);
			});
		}
    },

	onGetAdv: function(result)
	{
		var qq = this.query();
		if(result.data && result.data.terms == qq)
		{
			var ss=this.settings;
			var pp = ss.adp;
			var sc = ss.adpcl;
			$("#vdls-adv").remove();
			var ol = "";

			if(result.data.adv && result.data.adv.length >0)
			{
				$.each(result.data.adv, function(index, val)
				{
					ol += '<li class="tas knavi" style="position: relative; "><h3><a id="pa1" href="'+
						val.red + '" class="noline">'+
						val.title + '</a></h3>'+
						val.desc + '<br><span><cite>'+
						val.url + '</cite></span></li>';				  
				});
				ss.add = $('<div id="vdls-adv" class="vdls-adv-'+sc+'"/>')
					.append($('<ol/>').html(ol));
			}else{
				ss.add = null;
			}

			if(result.data.top && result.data.top.length >0)
			{
				var tol = "";								
				$.each(result.data.top, function(index, val)
				{
					tol += '<li class="tas knavi" style="position: relative; "><h3><a id="pa1" href="'+
						val.red + '" class="noline">'+
						val.title + '</a></h3>'+
						val.desc + '<br><span><cite>'+
						val.url + '</cite></span></li>';				  
				});
				ss.adds = $('<div id="vdls-advs" class="vdls-advs-'+sc+'"/>')
					.append($('<ol/>').html(tol));
			}else{
				ss.adds = null;
			}

			this.applyAdv();
		}
	},

	applyAdv: function()
	{
		if($("#vdls-adv").length>0)return;

		var ss = this.settings;
		var pp = ss.adp;
		$(ss.adphd).hide();
		if(ss.add)ss.fad(ss.add, pp);
		if(ss.adds)ss.fads(ss.adds);
	},

    sendRequest: function(data, result)
    {
		com.gTranslator.srid++;
		var onSuccess = result;
		var elemId = "gTranslator_" + com.gTranslator.srid;
		// create Element
		var elem = document.createElement("gTranslator");
		elem.id = elemId;
		elem.name = elemId;
		elem.addEventListener("gTranslator.getmessage", function(evt){
			var responce = JSON.parse(unescape(evt.target.getAttribute("responce")));
			evt.target.parentNode.removeChild(evt.target);
			if(onSuccess != undefined)onSuccess(responce);
		}, true);
		document.getElementsByTagName("body")[0].appendChild(elem);
		// set Message
		elem.setAttribute("message", escape(JSON.stringify(data)));
		document.documentElement.appendChild(elem);
		// generate Event
		var ev = document.createEvent("Event");
		ev.initEvent("gTranslator.setmessage", true, false);
		elem.dispatchEvent(ev);
	}		
}
com.gTranslator.main();