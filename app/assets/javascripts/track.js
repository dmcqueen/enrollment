if (typeof (enroll) == 'undefined') 
	var enroll = {};

enroll.utility = {
	_gaq: _gaq || [],

	setGAacct: function(acct) {
		enroll.utility._gaq.push(['_setAccount', acct]);
        },
	
	setUserId: function(userId) {
		enroll.utility._gaq.push(['_setCustomVar', 1, 'userId', userId, 1]);
	}, 

	trackEvent: function(eventStr) {
		enroll.utility._gaq.push(['_trackPageview',eventStr ? '/ajax/' + eventStr : '']);
		enroll.utility._gaq.push(['_trackPageLoadTime']);
	},

	getUrlVars : function() {
		var vars = [], hash;
		var hashes = window.location.href.slice(
				window.location.href.indexOf('?') + 1).split('&');
		for ( var i = 0; i < hashes.length; i++) {
			hash = hashes[i].split('=');
			vars.push(hash[0]);
			vars[hash[0]] = hash[1];
		}
		return vars;
	},

	serialize : function(obj) {
  		var str = [];
  		for(var p in obj) 
     			str.push(p + "=" + encodeURIComponent(obj[p]));
  		return str.join("&");
	},

	trackInputFocus : function() {
		enroll.utility._gaq.push(['_trackEvent','InputsFocus', $(this).attr('name')?$(this).attr('name'):$(this).attr('id')]);
	},

	trackInputErrors : function(errors) {
		var errorString = "";
		for(var i in errors) {
			errorString = errorString + $(errors[i]).attr('name')?$(errors[i]).attr('name'):$(errors[i]).attr('id') + ",";
		}
		enroll.utility._gaq.push(['_trackEvent','InputsSubmitError', errorString.substring(0, errorString.length-1)]);

	},

	getCookie : function(c_name) {
		return unescape( this.getRawCookie() );
	},
	
	getRawCookie: function(c_name) {
		var i,x,y,ARRcookies=document.cookie.split(";");
		for (i=0;i<ARRcookies.length;i++) {
			x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
			y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
			x=x.replace(/^\s+|\s+$/g,"");
			if (x==c_name) {
    				return y;
    			}
  		}		
	},
	
	deleteCookie: function( c_name ) {
		document.cookie = c_name + '=; expires=Thu, 01-Jan-70 00:00:01 GMT;';
	},
	
	escapeFromUTF8: function( string_to_escape ) {
		return encodeURIComponent(string_to_escape);
	}

};


$(document).ready(function() {
        enroll.utility.setGAacct(enroll.gaAcct);
	$(":input").live("change",enroll.utility.trackInputFocus);
        $(document).delegate("a","click", function() { enroll.utility.trackEvent($(this).attr('href')) });
	enroll.utility.trackEvent();
});
