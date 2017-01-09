/*
* expand jquery to support ...
* by @psyonline ( http://www.psyonline.kr/, majorartist@gmail.com )
*/

(function($) {

	'use strict';

	var
		ua = navigator.userAgent,
		div = document.createElement('div'),

		ie = ua.match(/(?:msie ([0-9]+)|rv:([0-9\.]+)\) like gecko)/i),

		prefix = ['Webkit', 'Moz', 'O'],
		transition = 'transition',
		transform = 'transform',
		requestanimationframe = 'requestAnimationFrame',
		cancelanimationframe = 'CancelAnimationFrame',

		transforms = {
			translate3d: 'translate3d(0px, 0px, 0px)',
			translate: 'translate(0px, 0px)',
			scale3d: 'scale3d(1, 1, 1)',
			scale: 'scale(1, 1)'
		},

		browser = $.browser,
		support = $.support,
		version, i;


	if ( !browser ) {
		$.browser = browser = {};
	}
	browser.local = !(/^http:\/\//).test(location.href);
	browser.firefox = (/firefox/i).test(ua);
	browser.webkit = (/applewebkit/i).test(ua);
	browser.chrome = (/chrome/i).test(ua);
	browser.opera = (/opera/i).test(ua);
	browser.ios = (/ip(ad|hone|od)/i).test(ua);
	browser.android = (/android/i).test(ua);
	browser.safari = browser.webkit && !browser.chrome;

	support.touch = document.ontouchstart !== undefined || window.navigator.pointerEnabled || window.navigator.msPointerEnabled;
	browser.mobile = support.touch && ( browser.ios || browser.android );

	for ( i in browser ) {
		if( !browser[i] ) {
			delete browser[i];
		}
	}
	browser.os = (navigator.appVersion).match(/(mac|win|linux)/i);
	browser.os = ( browser.os )? browser.os[1].toLowerCase() : '';
	
	if ( browser.ios || browser.android ) {
		version = ua.match(/applewebkit\/([0-9.]+)/i);
		if ( version && version.length > 1 ) {
			browser.webkitversion = version[1];
		}
		if ( browser.ios ) {
			version = ua.match(/version\/([0-9.]+)/i);
			if ( version && version.length > 1 ) {
				browser.ios = version[1];
			}
		} else if ( browser.android ) {
			version = ua.match(/android ([0-9.]+)/i);
			if ( version && version.length > 1 ) {
				browser.android = parseInt(version[1].replace(/\./g, ''));
			}
		}
	}

	support.svgimage = true;
	support.pointerevents = true;
	if ( ie ) {
		browser.ie = ie = parseInt( ie[1] || ie[2] );
		if ( 9 > ie ) {
			browser.oldie = true;
		} else if ( 9 == ie ) {
			prefix.push('ms');
		}
		if ( 11 > ie ) {
			support.pointerevents = false;
		}
		if ( 9 > ie ) {
			support.svgimage = false;
		}
	}

	support.pushstate = !!history.pushState;
	support.mediaquery = typeof(window.matchMedia) == 'function' || !browser.oldie;
	support.video = document.createElement('video').canPlayType !== undefined;
	support.backgroundsize = 'backgroundSize' in div.style;
	if ( support.backgroundsize ) {
		div.style.backgroundSize = 'cover';
		support.backgroundsize = div.style.backgroundSize == 'cover';
	}
	try {
		div.style.background = 'rgba(0, 0, 0, 0)';
		support.rgba = div.style.background == 'rgba(0, 0, 0, 0)';
	} catch(e) {
		support.rgba = false;
	}
	support.canvas = document.createElement('canvas');
	support.canvas = support.canvas.getContext && support.canvas.getContext('2d');

	// check support transform
	if ( div.style[transform] != undefined ) {
		support.transform = transform;
	} else {
		transform = 'Transform';
		for ( i = 0; i < 4; i++ ) {
			if ( div.style[prefix[i]+transform] !== undefined ) {
				support.transform = prefix[i]+transform;
				break;
			}
		}
	}
	if ( support.transform ) {
		transform = support.transform;
		for ( i in transforms ) {
			div.style[transform] = '';
			div.style[transform] = transforms[i];
			support[i] = div.style[transform];
		}
		if ( browser.ie && 10 > browser.ie ) {
			// support.scale3d = support.scale = false;
		}
		if ( browser.android && 430 > browser.android ) {
			// support.translate3d = false;
			// support.transition = false;
		}
	}

	// check support transition
	if ( div.style[transition] != undefined ) {
		support.transition = transition;
	} else {
		transition = 'Transition';
		for ( i = 0; i < 4; i++ ) {
			if ( div.style[prefix[i]+transition] !== undefined ) {
				support.transition = prefix[i]+transition;
				break;
			}
		}
	}

	// check support request animation frame
	if ( window[requestanimationframe] ) {
		support.requestanimationframe = true;
	} else {
		requestanimationframe = 'RequestAnimationFrame';
		for ( i = 0; i < 4; i++ ) {
			if ( window[prefix[i]+requestanimationframe] !== undefined ) {
				window.requestAnimationFrame = window[prefix[i]+requestanimationframe];
				window.cancelAnimationFrame = window[prefix[i]+cancelanimationframe];
				support.requestanimationframe = true;
				break;
			}
		}
	}

	// referrence - http://www.paulirish.com/2011/requestanimationframe-for-smart-animating/
	if ( !support.requestanimationframe ) {
		window.requestAnimationFrame = (function() {
			var lasttime = 0;
			return function(callback) {
				var currenttime = gettime();
				var timetocall = Math.max(0, 16-(currenttime-lasttime));
				lasttime = currenttime+timetocall;
				return setTimeout(function() { callback(currenttime+timetocall); }, timetocall);
			}
		})();
		window.cancelAnimationFrame = function(id) {
			clearTimeout(id);
		}
	}

	// $.fn.translate = function(x, y) {
	// 	var transform = $.support.transform;
	// 	x = ( x || x === '' )? x : 0;
	// 	y = ( y || y === '' )? y : 0;
	// 	if ( transform ) {
	// 		this.each(function() {
	// 			this.style[transform] = ( x === '' )? '' : ( $.support.translate3d )? 'translate3d('+ x +'px, '+ y +'px, 0)' :  'translate('+ x +'px, '+ y +'px)';
	// 		});
	// 	} else {
	// 		this.css({ left: Math.round(x), top: Math.round(y) });
	// 	}
	// 	return this;
	// };


	// cookie
	$._cookie = {
		set: function(name, value, term, path, domain) {
			var cookieset = name + '=' + value + ';',
				expdate;
			if ( term ) {
				expdate = new Date();
				expdate.setTime( expdate.getTime()+term*1000*60*60*24 ); // term 1 is a day
				cookieset += 'expires=' + expdate.toGMTString() + ';';
			}
			if ( path ) {
				cookieset += 'path=' + path + ';';
			}
			if ( domain ) {
				cookieset += 'domain=' + domain + ';';
			}
			document.cookie = cookieset;
		},
		get: function(name) {
			var match = ( document.cookie || ' ' ).match( new RegExp(name+' *= *([^;]+)') );
			return ( match )? match[1] : null;
		}
	};

	// parse/assemble query strings
	$._query = {
		parse: (function() {
			var matches, i, max;
			function resetdata(v) {
				if ( v ) {
					v = decodeURIComponent(v).replace(/\+/g, ' ');
					if ( v.indexOf(',') != -1 ) {
						v = v.split(',');
						for ( i = 0, max = v.length; i < max; i++ ) {
							v[i] = resetdata(v[i]);
						}
					} else if ( expint.test(v) ) {
						v = parseFloat(v);
					}
				}
				return v;
			}
			return function(query) {
				var rv = {};
				query = ( (/^#/).test(query) )? query.substring(query.lastIndexOf('#')+1)
						: ( !query || (/\?/).test(query) )? ( query || location.href ).split('?')[1]
						: query;
				if ( query ) {
					query = query.split('#')[0];
					while ( matches = expqueries.exec(query) ) {
						rv[matches[1]] = resetdata(matches[2]);
					}
					return rv;
				} else {
					return false;
				}
			}
		})(),
		make: function(data) {
			var key, newdata, datatype = typeof(data);
			if ( datatype == 'string' ) {
				return data;
			} else if ( datatype == 'object' ) {
				newdata = [];
				for ( key in data ) {
					newdata.push( key +'='+ encodeURIComponent(data[key]));
				}
				return newdata.join('&');
			}
		}
	};


	// easings.
	// Convert to JS from "Robert Penner's Easing Functions" http://www.robertpenner.com/easing/
	var easings = {
			linear : function(t,b,c,d){return c*t/d+b;},
			easeInQuad : function(t,b,c,d){return c*(t/=d)*t+b;},
			easeOutQuad : function(t,b,c,d){return -c*(t/=d)*(t-2)+b;},
			easeInOutQuad : function(t,b,c,d){if((t/=d/2)<1)return c/2*t*t+b;return -c/2*((--t)*(t-2)-1)+b;},
			easeOutInQuad : function(t,b,c,d){if(t < d/2)return easings.easeOutQuad(t*2,b,c/2,d);return easings.easeInQuad((t*2)-d,b+c/2,c/2,d);},
			easeInCubic : function(t,b,c,d){return c*(t/=d)*t*t+b;},
			easeOutCubic : function(t,b,c,d){return c*((t=t/d-1)*t*t+1)+b;},
			easeInOutCubic : function(t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t+b;return c/2*((t-=2)*t*t+2)+b;},
			easeOutInCubic : function(t,b,c,d){if(t<d/2)return easings.easeOutCubic(t*2,b,c/2,d);return easings.easeInCubic((t*2)-d,b+c/2,c/2,d);},
			easeInQuart : function(t,b,c,d){return c*(t/=d)*t*t*t+b;},
			easeOutQuart : function(t,b,c,d){return -c*((t=t/d-1)*t*t*t-1)+b;},
			easeInOutQuart : function(t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t*t+b;return -c/2*((t-=2)*t*t*t-2)+b;},
			easeOutInQuart : function(t,b,c,d){if(t<d/2)return easings.easeOutQuart(t*2,b,c/2,d);return easings.easeInQuart((t*2)-d,b+c/2,c/2,d);},
			easeInQuint : function(t,b,c,d){return c*(t/=d)*t*t*t*t+b;},
			easeOutQuint : function(t,b,c,d){return c*((t=t/d-1)*t*t*t*t+1)+b;},
			easeInOutQuint : function(t,b,c,d){if((t/=d/2)<1)return c/2*t*t*t*t*t+b;return c/2*((t-=2)*t*t*t*t+2)+b;},
			easeOutInQuint : function(t,b,c,d){if(t<d/2)return easings.easeOutQuint(t*2,b,c/2,d);return easings.easeInQuint((t*2)-d,b+c/2,c/2,d);},
			easeInSine : function(t,b,c,d){return -c*Math.cos(t/d*(Math.PI/2))+c+b;},
			easeOutSine : function(t,b,c,d){return c*Math.sin(t/d*(Math.PI/2))+b;},
			easeInOutSine : function(t,b,c,d){return -c/2*(Math.cos(Math.PI*t/d)-1)+b;},
			easeOutInSine : function(t,b,c,d){if(t<d/2)return easings.easeOutSine(t*2,b,c/2,d);return easings.easeInSine((t*2)-d,b+c/2,c/2,d);},
			easeInExpo : function(t,b,c,d){return (t==0)? b : c*Math.pow(2,10*(t/d-1))+b-c*0.001;},
			easeOutExpo : function(t,b,c,d){return (t==d)? b+c : c*1.001*(-Math.pow(2,-10*t/d)+1)+b;},
			easeInOutExpo : function(t,b,c,d){if(t==0)return b;if(t==d)return b+c;if((t/=d/2)<1)return c/2*Math.pow(2,10*(t-1))+b-c*0.0005;return c/2*1.0005*(-Math.pow(2,-10*--t)+2)+b;},
			easeOutInExpo : function(t,b,c,d){if(t<d/2)return easings.easeOutExpo(t*2,b,c/2,d);return easings.easeInExpo((t*2)-d,b+c/2,c/2,d);},
			easeInCirc : function(t,b,c,d){return -c*(Math.sqrt(1-(t/=d)*t)-1)+b;},
			easeOutCirc : function(t,b,c,d){return c*Math.sqrt(1-(t=t/d-1)*t)+b;},
			easeInOutCirc : function(t,b,c,d){if((t/=d/2)<1)return -c/2*(Math.sqrt(1-t*t)-1)+b;return c/2*(Math.sqrt(1-(t-=2)*t)+1)+b;},
			easeOutInCirc : function(t,b,c,d){if (t<d/2)return easings.easeOutCirc(t*2,b,c/2,d);return easings.easeInCirc((t*2)-d,b+c/2,c/2,d);},
			easeInElastic : function(t,b,c,d,a,p){if(!t)return b;if((t/=d)==1)return b+c;var s,p=(!p||typeof(p)!='number')? d*.3 : p,a=(!a||typeof(a)!='number')? 0 : a;if(!a||a<Math.abs(c)){a=c;s=p/4;}else s=p/(2*Math.PI)*Math.asin(c/a);return -(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;},
			easeOutElastic : function(t,b,c,d,a,p){if(!t)return b;if((t/=d)==1)return b+c;var s,p=(!p||typeof(p)!='number')? d*.3 : p,a=(!a||typeof(a)!='number')? 0 : a;if(!a||a<Math.abs(c)){a=c;s=p/4;}else s=p/(2*Math.PI)*Math.asin(c/a);return (a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b);},
			easeInOutElastic : function(t,b,c,d,a,p){if(t==0)return b;if((t/=d/2)==2)return b+c;var s,p=d*(.3*1.5),a=0;var s,p=(!p||typeof(p)!='number')? d*(.3*1.5) : p,a=(!a||typeof(a)!='number')? 0 : a;if(!a||a<Math.abs(c)){a=c;s=p/4;}else s=p/(2*Math.PI)*Math.asin(c/a);if(t<1)return -.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*.5+c+b;},
			easeOutInElastic : function(t,b,c,d,a,p){if (t<d/2)return easings.easeOutElastic(t*2,b,c/2,d,a,p);return easings.easeInElastic((t*2)-d,b+c/2,c/2,d,a,p);},
			easeInBack : function(t,b,c,d,s){var s=(!s||typeof(s)!='number')? 1.70158 : s;return c*(t/=d)*t*((s+1)*t-s)+b;},
			easeOutBack : function(t,b,c,d,s){var s=(!s||typeof(s)!='number')? 1.70158 : s;return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b;},
			easeInOutBack : function(t,b,c,d,s){var s=(!s||typeof(s)!='number')? 1.70158 : s;if((t/=d/2)<1)return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b;},
			easeOutInBack : function(t,b,c,d,s){if(t<d/2)return easings.easeOutBack(t*2,b,c/2,d,s);return easings.easeInBack((t*2)-d,b+c/2,c/2,d,s);},
			easeInBounce : function(t,b,c,d){return c-easings.easeOutBounce(d-t,0,c,d)+b;},
			easeOutBounce : function(t,b,c,d){if((t/=d)<(1/2.75))return c*(7.5625*t*t)+b;else if(t<(2/2.75))return c*(7.5625*(t-=(1.5/2.75))*t+.75)+b;else if(t<(2.5/2.75))return c*(7.5625*(t-=(2.25/2.75))*t+.9375)+b;else return c*(7.5625*(t-=(2.625/2.75))*t+.984375)+b;},
			easeInOutBounce : function(t,b,c,d){if(t<d/2)return easings.easeInBounce(t*2,0,c,d)*.5+b;else return easings.easeOutBounce(t*2-d,0,c,d)*.5+c*.5+b;},
			easeOutInBounce : function(t,b,c,d){if(t<d/2)return easings.easeOutBounce(t*2,b,c/2,d);return easings.easeInBounce((t*2)-d,b+c/2,c/2,d);}
		},
		easing,
		// css transition cubic-bezier
		// from "Ceaser - CSS Easing Animation Tool - Matthew Lein" http://matthewlein.com/ceaser/
		cubicbeziers = {
			linear: '0.250, 0.250, 0.750, 0.750',
			ease: '0.250, 0.100, 0.250, 1.000',
			'ease-in': '0.420, 0.000, 1.000, 1.000',
			'ease-out': '0.000, 0.000, 0.580, 1.000',
			'ease-in-out': '0.420, 0.000, 0.580, 1.000',
			easeInQuad: '0.550, 0.085, 0.680, 0.530',
			easeInCubic: '0.550, 0.055, 0.675, 0.190',
			easeInQuart: '0.895, 0.030, 0.685, 0.220',
			easeInQuint: '0.755, 0.050, 0.855, 0.060',
			easeInSine: '0.470, 0.000, 0.745, 0.715',
			easeInExpo: '0.950, 0.050, 0.795, 0.035',
			easeInCirc: '0.600, 0.040, 0.980, 0.335',
			easeInBack: '0.600, -0.280, 0.735, 0.045',
			easeOutQuad: '0.250, 0.460, 0.450, 0.940',
			easeOutCubic: '0.215, 0.610, 0.355, 1.000',
			easeOutQuart: '0.165, 0.840, 0.440, 1.000',
			easeOutQuint: '0.230, 1.000, 0.320, 1.000',
			easeOutSine: '0.390, 0.575, 0.565, 1.000',
			easeOutExpo: '0.190, 1.000, 0.220, 1.000',
			easeOutCirc: '0.075, 0.820, 0.165, 1.000',
			easeOutBack: '0.175, 0.885, 0.320, 1.275',
			easeInOutQuad: '0.455, 0.030, 0.515, 0.955',
			easeInOutCubic: '0.645, 0.045, 0.355, 1.000',
			easeInOutQuart: '0.770, 0.000, 0.175, 1.000',
			easeInOutQuint: '0.860, 0.000, 0.070, 1.000',
			easeInOutSine: '0.445, 0.050, 0.550, 0.950',
			easeInOutExpo: '1.000, 0.000, 0.000, 1.000',
			easeInOutCirc: '0.785, 0.135, 0.150, 0.860',
			easeInOutBack: '0.680, -0.550, 0.265, 1.550'
		};

	//expand jQuery.easing
	for ( easing in easings ) {
		jQuery.easing[easing] = (function(easingname) {
			return function(x, t, b, c, d) {
				return easings[easingname](t, b, c, d);
			}
		})(easing);
	}


	var

		poorbrowser = browser.ie && 9 > browser.ie,

		expint = /^-?[0-9\.]+$/,
		exprgb = /rgba?\(/,
		expisbody = /body/i,
		expiscolor = /color/i,
		expgetrgb = /rgba?\(([0-9]+), *([0-9]+), *([0-9]+)/,
		expqueries = /([^=&]+)=?([^=&]*)/g,

		transitionname = support.transition,
		transitionable = !!transitionname,
		transitionendnames = 'transitionend webkitTransitionEnd mozTransitionEnd oTransitionEnd msTransitionEnd',

		gettime = function() {
			return new Date().getTime();
		},

		isobject = $.isPlainObject,

		color = {
			getcode: function(target, property) {
				return this.tohex.apply( null, this.torgb( target, property, style.get(target, property) ) );
			},
			torgb: function(target, property, v) {
				var temp;
				if ( v == 'transparent' || v == 'rgba(0, 0, 0, 0)' ) {
					while ( !expisbody.test(target.nodeName) ) {
						target = target.parentNode;
						temp = style.get(target, property);
						if ( temp != 'transparent' && temp != 'rgba(0, 0, 0, 0)' ) {
							return this.torgb(target, property, temp);
						}
					}
					return [ 255, 255, 255 ];
				} else if ( v.match(exprgb) ) {
					v = v.match(expgetrgb);
					return [ parseInt(v[1]), parseInt(v[2]), parseInt(v[3]) ];
				} else {
					//#cccccc
					if ( v.length>5 ) {
						v = [ v.substr(1, 2), v.substr(3, 2), v.substr(5, 2) ];
					//#ccc
					} else {
						v = [ v.substr(1, 1), v.substr(2, 1), v.substr(3, 1) ];
						v = [ v[0]+v[0], v[1]+v[1], v[2]+v[2] ];
					}
					return [
						parseInt( ( eval('0x'+v[0]) ).toString(10) ),
						parseInt( ( eval('0x'+v[1]) ).toString(10) ),
						parseInt( ( eval('0x'+v[2]) ).toString(10) )
					];
				}
			},
			tohex: function() {
				var temp, i = 0, rv = '';
				for ( ; i < 3; i++ ) {
					temp = Math.max( Math.min(255, arguments[i]), 0 ).toString(16);
					rv += ( 2 > temp.length )? '0'+temp : temp;
				}
				return '#'+rv;
			}
		},

		//style get, set
		style = (function() {

			var
				supporttransform = support.transform,
				transforms = ['translate3d', 'translate', 'scale3d', 'scale', 'rotate', 'rotateX', 'rotateY', 'rotateZ'],
				nex = '[e0-9\-\.]+', pxex = '(?:px)?', vex = '(?:(?:px|deg))?', xyzex = /(X|Y|Z)$/,
				//[ get, set x, set y, set z ]
				expressions = {
					isxyztarget: /^(scale|scale3d|translate|translate3d)$/,
					nopx: /(zIndex)/
				},
				is3dtransform = /3d/, istranslate = /^translate/,
				isscale = /^scale/, isrotate = /^rotate/,
				isx = /X$/, isy = /Y$/,
				isstupidbrowser = browser.ie == 9,
				i = 0, max = transforms.length;

			for ( ; i < max; i++ ) {
				expressions[transforms[i]] = [
					new RegExp(transforms[i] + '\\(('+ nex +')'+ vex +'(?:, ('+ nex +')'+ vex +'(?:, ('+ nex +')'+ vex +')?)?'),
					new RegExp('('+transforms[i] + '\\()'+ nex + vex)
				];
				if ( !isrotate.test(transforms[i]) ) {
					expressions[transforms[i]][2] = new RegExp('('+transforms[i] + '\\('+ nex + vex +', )'+ nex + vex),
					expressions[transforms[i]][3] = new RegExp('('+transforms[i] + '\\('+ nex + vex +', '+ nex + vex +', )'+ nex + vex);
				}
			}

			function istransform(property) {
				property = css3(property);
				if ( (/^(matrix|translate|scale|rotate|skew|perspective)/).test(property) ) {
					return true;
				}
				return false;
			}

			function isxyztarget(property) {
				var check = property.match(expressions.isxyztarget);
				return ( check )? check[1] : false;
			}

			function issvg(target) {
				return window.SVGElement && target instanceof SVGElement;
			}

			function css3(property) {
				if ( istranslate.test(property) ) {
					if ( !support.translate ) {
						return (/X$/).test(property)? 'left' : 'top';
					} else if ( is3dtransform.test(property) && !support.translate3d ) {
						return property.replace('3d', '');
					}
				} else if ( isscale.test(property) ) {
					if ( is3dtransform.test(property) && !support.scale3d ) {
						return property.replace('3d', '');
					}
				}
				return property;
			}

			function ie9scale(target, property, value) {
				var temp = target.style[supporttransform].match(expressions.scale[0]),
					x, y;
				if ( !temp ) {//get only
					return 1;
				} else {
					x = parseFloat(temp[1]);
					y = ( temp[2] !== undefined )? parseFloat(temp[2]) : x;
					if ( value !== undefined ) {//set
						if ( isx.test(property) ) {
							x = value;
						} else {
							y = value;
						}
						target.style[supporttransform] = target.style[supporttransform].replace(expressions.scale[0], 'scale('+ x +', '+ y);
					} else {//get
						return ( isx.test(property) )? x : y;
					}
				}
			}

			function get(target, property) {
				var rv, transform, xyz;
				property = css3(property);
				if ( istransform(property) ) {
					xyz = isxyztarget(property);
					if ( xyz ) {
						return get(target, xyz+'X');
					}
					transform = property;
					property = supporttransform;
				}
				if ( property == 'opacity' && !support.opacity ){
					property = 'filter';
				} else if ( property == 'scrollTop' ) {
					return target.scrollTop;
				}
				rv = (target) ? (issvg(target) && target.attributes[property]) ? parseInt(target.attributes[property].value) : // svg attribute
						(!target.style)? target[property] :
						(target.style[property])? target.style[property] :
							(target.currentStyle)? target.currentStyle[property] :
								document.defaultView.getComputedStyle(target, null)[property] : 0;
				if ( transform && supporttransform ) {
					xyz = transform.match(xyzex);
					xyz = ( xyz )? xyz[0] : '';
					if ( isrotate.test(transform) ) {
						rv = rv.match(expressions[transform][0]);
						return (!rv)? 0 : parseFloat(rv[1]);
					} else if ( isstupidbrowser && isscale.test(transform) ) {
						return ie9scale(target, transform);
					} else if( rv ) {
						rv = rv.match( expressions[transform.replace(xyzex, '')][0] );
						return (!rv)? ( isscale.test(transform) )? 1 : 0 : parseFloat(rv[( xyz == 'X' )? 1 : ( xyz == 'Y' )? 2 : 3]);
					}
				}
				if ( property == 'opacity' ) {
					return parseFloat(rv);
				}
				if ( property == 'filter' ) {
					rv = rv.match(/alpha *\( *opacity *[=:] *([0-9\.]+) *\)/i);
					rv = (rv)? parseFloat(rv[1]) : 1;
					return (rv || rv===0)? rv/100 : 1;
				}
				return (rv=='auto')? 0 : ((/(pt|px)$/).test(rv))? parseInt(rv) : rv;
			}

			function set(target, property, value) {
				var i, transform, xyz;
				if ( typeof(property) == 'object' ) {
					for ( i in property) {
						style.set(target, i, property[i]);
					}
					return;
				}
				if ( value !== undefined ) {
					if ( issvg(target) && target.attributes[property] ) { // svg attribute
						target.attributes[property].value = value;
					} else if ( !target.style ) {
						target[property] = value;
					} else {
						property = css3(property);
						if ( istransform(property) && supporttransform ) {
							xyz = isxyztarget(property);
							if ( xyz ) {
								set(target, xyz+'X', value);
								set(target, xyz+'Y', value);
								set(target, xyz+'Z', value);
								return;
							}
							if ( isrotate.test(property) ) {
								if ( !expressions[property][0].test(target.style[supporttransform]) ) {
									target.style[supporttransform] += property+'(0)';
								}
								target.style[supporttransform] = target.style[supporttransform].replace(expressions[property][1], '$1'+ value +'deg');
							} else {
								transform = property.replace(xyzex, '');
								if ( !expressions[transform][0].test(target.style[supporttransform]) ) {
									target.style[supporttransform] += support[transform];
								}
								if ( isstupidbrowser && isscale.test(property) ) {
									ie9scale(target, property, value);
								} else {
									target.style[supporttransform] = target.style[supporttransform].replace(
										expressions[transform][isx.test(property)? 1 : isy.test(property)? 2 : 3],
										'$1'+ value + ( isscale.test(transform)? '' : 'px' )
									);
								}
							}
						} else if ( property == 'opacity' ) {
							if ( !support.opacity ) {
								target.style.filter = ( value === '' )? '' : 'alpha(opacity='+(value*100)+')';
							} else {
								target.style.opacity = value;
							}
						} else if ( property == 'scrollTop' ) {
							target.scrollTop = value;
						} else {
							try {
								target.style[property] = ( value && !isNaN(value) && !expressions.nopx.test(property) )? value+'px' : value;
							} catch(e) {
								window.console && console.log(e.message+'('+target + ' : id="'+ target.id +'", class="'+ target.className +'", property="'+ property +'", value : "'+ value +'")');
							}

						}
					}
				}
			}

			return { get: get, set: set, istransform: istransform };

		})(),


		//animation
		ani = (function() {

			var tweens = [],

				_fps = 60, _time = 1, _easing = 'easeOutCubic',

				nowframe = 0,
				totalframes = 0,
				starttime = 0,
				playing = false,

				getstyle = style.get, setstyle = style.set,

				torgb = color.torgb, tocolorcode = color.tohex,

				istransform = style.istransform,
				issplitxyztarget = style.issplitxyztarget,

				timer = null,
				timerdelay = 1000/_fps,

				isemptytween,

				i, max;

			function set(target, property, _option) {

				if ( !target ) {
					return;
				}

				if ( target.constructor == Array ) {
					for ( i = 0, max = target.length; i < max; i++ ) {
						set(target[i], property, _option);
					}
					return;
				}

				var tween,
					option = _option || {},
					time = option.time || _time,
					frames = Math.round( _fps*time ),
					delay = Math.round( _fps*( option.delay || 0 ) ),
					easing = option.easing || _easing,
					p, rounding, fromcolor, tocolor, rgb, i, temp,
					values = {};

				for ( p in property ) {
					rounding = ( option.rounding === false || p == 'opacity' )? false : !istransform(p);
					if ( property[p].constructor == Array ) {//for preseted values
						values[p] = property[p];
						frames = Math.max(frames, Math.round( _fps*values[p].length/_fps ));
					} else if ( expiscolor.test(p) ) {
						fromcolor = torgb(target, p, getstyle(target, p));
						tocolor = torgb(target, p, property[p]);
						rgb = [];
						for ( i = 0; i < 3; i++ ) {
							rgb[i] = getvalues(p, fromcolor[i], tocolor[i], frames, easing, true);
						}
						values[p] = [];
						for ( i = 0; i < frames; i++ ) {
							values[p][i] = tocolorcode(rgb[0][i], rgb[1][i], rgb[2][i]);
						}
					} else {
						values[p] = getvalues(p, getstyle(target, p), property[p], frames, easing, rounding);
					}
				}

				//check exist. delete same properties. remove empty tween.
				stop(target, property);

				tweens.push({
					el: target,
					vs: values,
					sf: nowframe + delay,
					tf: frames,
					es: option.onstart,
					eu: option.onupdate,
					ee: option.onend,
					lp: option.loop
				});

				totalframes = Math.max( totalframes, nowframe + delay + frames + _fps );

				if ( !playing ) {
					starttime = gettime();
					timer = window.requestAnimationFrame(action);
					playing = true;
				}

			}

			function stop(target, property, _jumptoend) {

				var i = 0, max = tweens.length,
					tween, p, properties;

				if ( property ) {
					if ( typeof(property) != 'string' ) {
						properties = [];
						for ( p in property ) {
							properties.push(p);
						}
						properties = properties.join(' ')+' ';
					} else {
						properties = property+' ';
					}
				}

				isemptytween = true;
				for ( ; i < max; i++ ) {
					tween = tweens[i];
					if ( tween && tween.el == target ) {
						if ( property ) {
							for ( p in tween.vs ) {
								if ( properties.indexOf(p+' ') != -1 ) {
									if ( _jumptoend ) {
										setstyle(tween.el, p, tween.vs[p][tween.tf-1]);
									}
									delete tween.vs[p];
								} else {
									isemptytween = false;
								}
							}
						}
						if ( isemptytween ) {
							if ( _jumptoend ) {
								jumptoend(tweens[i]);
							}
							tweens[i] = null;
						}
					}
				}

			}

			function jumptoend(tween) {
				var p, lastframe = tween.tf-1;
				for ( p in tween.vs ) {
					setstyle(tween.el, p, tween.vs[p][lastframe]);
				}
				tween.eu && tween.eu.call( tween.el, geteventvalue(tween, 'update', lastframe, lastframe) );
				tween.ee && tween.ee.call( tween.el, geteventvalue(tween, 'end', lastframe, lastframe) );
			}

			//not complete
			//todo: option as ani.set's option
			function sprite(target, framewidth, totalframe, property, time, loop) {
				var currentframe, temp = { };
				totalframe--;
				function onupdate(e) {
					var frame = Math.round(totalframe*e.v);
					if ( currentframe != frame ) {
						style.set(target, property, -framewidth*frame);
						currentframe = frame;
					}
				}
				function play() {
					_stop();
					set(temp, { v: 1 }, { time: time, loop: loop, rounding: false, easing: 'linear', onupdate: onupdate });
				}
				function _stop() {
					stop(temp);
					currentframe = -1;
					temp.v = 0;
				}
				return { play: play, stop: _stop }
			}

			function action() {
				nowframe = Math.floor( ( gettime()-starttime ) / timerdelay );
				// nowframe++;
				if ( totalframes > nowframe ) {
					setproperties(nowframe);
					timer = window.requestAnimationFrame(action);
				} else {
					window.cancelAnimationFrame(timer);
					setproperties(totalframes);
					nowframe = totalframes = 0;
					tweens = [];
					playing = false;
				}
			}

			function setproperties(step) {

				var tween, mystep, myframes,
					p, i = 0, max = tweens.length;

				for ( ; i < max; i++ ) {

					tween = tweens[i];

					if ( tween && step >= tween.sf ) {

						myframes = tween.tf-1;
						mystep = Math.min( myframes, step-tween.sf );

						//start event call
						if ( tween.es ) {
							tween.es.call( tween.el, geteventvalue(tween, 'start', 0, myframes) );
							delete tween.es;
						}

						//re-check tween has removed from stop function
						if (!tweens[i]) {
							continue;
						}

						//set properties
						for ( p in tween.vs ) {
							setstyle(tween.el, p, tween.vs[p][mystep]);
						}

						//update event call
						tween.eu && tween.eu.call( tween.el, geteventvalue(tween, 'update', mystep, myframes) );

						//end. remove tween, end event call
						if ( mystep == myframes ) {
							tween.ee && tween.ee.call( tween.el, geteventvalue(tween, 'end', mystep, myframes) );
							if ( tween.lp ) {
								tweens[i].sf = nowframe;
								totalframes += tweens[i].tf+_fps;
								if ( tween.lp == 'yoyo' ) {
									for ( p in tween.vs ) {
										tween.vs[p].reverse();
									}
								}
							} else {
								tweens[i] = null;
							}
						}

					}
				}

			}

			function geteventvalue(tween, type, step, totalstep) {
				var values = tween.vs,
					eventvalue = { type: type, percent: step/totalstep },
					p;
				for ( p in values ) {
					eventvalue[p] = values[p][step];
				}
				return eventvalue;
			}

			function getvalues(property, from, to, totalframe, easing, rounding) {
				var nv, rv = [], gap = to-from, i = 0;
				totalframe--;
				for ( ; i <= totalframe; i++ ) {
					nv = easings[easing](i, from, gap, totalframe);
					rv.push( ( rounding )? Math.round(nv) : nv );
				}
				return rv;
			}

			return { set: set, stop: stop, sprite: sprite, getvalues: getvalues };

		})();


	$.fn._css = function(property, value) {
		var p;
		if ( isobject(property) ) {
			for ( p in property ) {
				this._css(p, property[p]);
			}
		} else if ( value !== undefined ) {
			this.each(function() {
				style.set(this, property, value);
			});
		} else {
			return style.get(this[0], property);
		}
		return this;
	}

	$.fn._animate = function(properties, d, e, c) {
		var options = assignanimationoptions(d, e, c);
		return this.each(function(i) {
			// if ( poorbrowser ) {
			// 	style.set(this, properties);
			// 	if ( !i ) {
			// 		properties.percent = 1;
			// 		options.onupdate && options.onupdate.call(this, properties);
			// 		options.onend && options.onend.call(this);
			// 	}
			// } else {
				if ( i ) {
					options.step = options.complete = null;
				}
				options.loop = d.loop;
				ani.set(this, properties, options);
			// }
		});
	}

	$._getanimationvalues = ani.getvalues;

	$.fn._spriteanimation = function sprite(framewidth, totalframe, property, time, loop) {
		return this.each(function(i) {
			$(this).data('spriteanimation', ani.sprite(this, framewidth, totalframe, property, time, loop));
		});
	}

	$.fn._stop = function(property, jumptoend) {
		if ( property === true || property === false ) {
			jumptoend = property;
			property = null;
		}
		return this._css(transitionname, '').each(function() {
			ani.stop(this, property, jumptoend);
		});
	}

	$.fn._transition = function(properties, d, e, c) {
		var EL_target = this,
			options = assignanimationoptions(d, e, c),
			p, setting, onend, onendfired;
		if ( transitionable ) {
			setting = [];
			for ( p in properties ) {
				if ( style.istransform(p) ) {
					p = support.transform;
				}
				setting.push([killcamels(p), ' ', options.time, 's ', (options.delay)? options.delay+'s ' : '', 'cubic-bezier(', ( cubicbeziers[options.easing] || cubicbeziers.ease ), ')'].join(''));
			}
			setting = setting.join(',');
			onend = options.onend;
			options.onend = function() {
				if ( !onendfired ) {
					EL_target.css(transitionname, '').unbind(transitionendnames, options.onend);
					setTimeout(function() {
						onend && onend.call(EL_target[0]);
					}, 0);
					onendfired = true;
				}
			}
			setTimeout(function() {
				EL_target.each(function() {
					$(this).css(transitionname, setting)._css(properties).bind(transitionendnames, options.onend);
				});
			}, 0);
			return this;
		} else {
			return this.each(function() {
				// if ( poorbrowser ) {
				// 	style.set(this, properties);
				// 	options.onend && options.onend.call(this);
				// } else {
					ani.set(this, properties, options);
				// }
			});
		}
	}

	$.fn._fill = function(EL_area, sizes) {
		return this.each(function() {
			filling(this, EL_area, sizes);
		});
	}

	$.fn.decideClass = function(classname, condition) {
		return this[condition ? 'addClass' : 'removeClass'](classname);
	}

	// ie png fix
	$.fn.pngFix = (function() {
		var expIsImage = /img/i,
			expImageSrc = /[a-z0-9_-]+\.(gif|jpg|png)$/i,
			expBackgroundImage = /(url\("?'?|"?'?\))/g;
		return function() {
			var src, sizing;
			if (!support.opacity) {
				this.each(function() {
					var EL_this = $(this);
					if ( expIsImage.test(this.nodeName) ) {
						sizing = 'image';
						src = EL_this.attr('src');
						EL_this.attr('src', src.replace(expImageSrc, 'blank.gif') );
					} else {
						sizing = 'scale';
						src = EL_this.css('backgroundImage').replace(expBackgroundImage, '');
						EL_this.css('backgroundImage', 'url(\'\')');
					}
					this.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="'+ src +'",sizingMethod='+ sizing +')';
				});
			}
			return this;
		}
	})();

	function filling(target, EL_area, _sizes) {

		if ( !EL_area ) {
			EL_area = $(target.parentNode);
		}
		if ( !EL_area.length ) {
			return false;
		}

		var position,
			sizes = _sizes || {},
			targetwidth = sizes.width || target.offsetWidth, targetheight = sizes.height || target.offsetHeight,
			areawidth = sizes.areawidth || EL_area[0].offsetWidth, areaheight = sizes.areaheight || EL_area[0].offsetHeight,
			rate, newwidth, newheight, marginleft, margintop;

		if (!targetwidth || !targetheight || !areawidth || !areaheight) {
			return false;
		}

		// set position from parent's background position
		position = EL_area._css('backgroundPosition');
		if ( position ) {
			position = position.split(' ');
			position[0] = position[0] == 'center' ? 0.5 : position[0].indexOf('%') != -1 ? parseInt(position[0])/100 : 0;
			position[1] = position[1] == 'center' ? 0.5 : position[1].indexOf('%') != -1 ? parseInt(position[1])/100 : 0;
		}

		rate = ( targetwidth > targetheight )? areaheight/targetheight : areawidth/targetwidth;
		rate = ( areaheight > Math.round(targetheight*rate) )? areaheight/targetheight : ( areawidth > targetwidth*rate )? areawidth/targetwidth : rate;

		newwidth = Math.max(areawidth, Math.round(targetwidth*rate));
		newheight = Math.max(areaheight, Math.round(targetheight*rate));

		if (position) {
			if (position[0]) {
				marginleft = (areawidth-newwidth)*position[0];
			}
			if (position[1]) {
				margintop = (areaheight-newheight)*position[1];
			}
		}

		$(target).css({
			width: newwidth,
			height: newheight,
			marginLeft: marginleft || '',
			marginTop: margintop || ''
		});

	}

	function assignanimationoptions(d, e, c) {
		var options;
		if ( isobject(d) ) {
			options = { time: d.duration, delay: d.delay, rounding: d.rounding, easing: d.easing, onstart: d.start, onupdate: d.step, onend: d.complete };
		} else if ( typeof(c) == 'function' ) {
			options = { time: d, easing: e, onend: c };
		} else if ( typeof(e) == 'function' ) {
			options = ( typeof(d) == 'number' )? { time: d } : { easing: d }
			options.onend = e;
		} else if ( typeof(d) == 'function' ) {
			options = { onend: d };
		}
		if ( options.time === undefined ) {
			options.time = 400; // jquery default time
		}
		// options.time /= 4;
		options.time /= 1000;
		if ( options.delay ) {
			// options.delay /= 4;
			options.delay /= 1000;
		}
		return options;
	}

	function killcamels(property) {
		return property.replace(/([A-Z])/g, '-$1').toLowerCase();
	}


	$._event = (function() {

		var
			supporttouch = support.touch,
			typemap = window.navigator.pointerEnabled ? {mousedown: 'pointerdown', mousemove: 'pointermove', mouseup: 'pointerup'}
				: window.navigator.msPointerEnabled ? {mousedown: 'MSPointerDown', mousemove: 'MSPointerMove', mouseup: 'MSPointerUp'}
				: supporttouch ? {mousedown: 'touchstart', mousemove: 'touchmove', mouseup: 'touchend'} : {};

		return {
			gettype: function(types) {
				var type, newtypes;
				if (supporttouch) {
					newtypes = {};
					for (type in types) {
						newtypes[typemap[type] || type] = types[type];
					}
					return newtypes;
				}
				return types;
			},
			getpoint: function(e) {
				e = e.originalEvent;
				if (e.touches || e.changedTouches) {
					return [
						e.touches[0] ? e.touches[0].pageX : e.changedTouches[0].pageX,
						e.touches[0] ? e.touches[0].pageY : e.changedTouches[0].pageY
					];
				}
				return [e.clientX, e.clientY];
			}
		}

	})();
	
	div = null;

	// $.browser.mobile = true;
	// console.log(123, $.support.transform);
	// console.log($.browser.local)

	$(document.documentElement)
		.addClass(browser.os)
		.addClass(browser.chrome ? 'chrome' : browser.firefox ? 'firefox' : browser.opera ? 'opera' : browser.safari ? 'safari' : browser.ie ? 'ie ie'+browser.ie : '')
		.addClass(browser.ios ? 'ios' : browser.android ? 'android' : '')
		.addClass(support.transition ? 'transition' : 'notransition')
		.addClass(support.transform ? 'transform' : 'notransform')
		.addClass(support.backgroundsize ? 'backgroundsize' : 'nobackgroundsize')
		.addClass(support.rgba ? 'rgba' : 'norgba')
		.addClass(support.pointerevents ? 'pointerevents' : 'nopointerevents')
		.addClass(support.opacity ? 'opacity' : 'noopacity');



	if (!window.console) {
		window.console = {};
		window.console.log = window.console.table = window.console.error = window.console.clear = function() {};
	}

	window.trace = (function() {
	
		var box = null,
			number = 1;
	
		function tostring(v) {
			var rv, i, max;
			if ( v === null ) {
				return 'null';
			} else if ( v === undefined ) {
				return 'undefined';
			} else if ( v == window ) {
				return '[object Window]';
			} else if ( v == document ) {
				return '[object HTMLDocument]';
			} else if ( v === true || v === false || typeof(v) == 'number' || typeof(v) == 'function' ) {
				return v;
			} else if ( typeof(v) == 'object' ) {
				if ( v.constructor == Array ) {
					rv = [];
					for ( i = 0, max = v.length; i < max; i++ ) {
						rv.push(tostring(v[i]));
					}
					return '['+ rv.join(',') +']';
				} else if ( v.constructor == String ) {
					return '"'+ v.replace(/\</g, '<') +'"';
				} else if ( v.constructor == Boolean || v.constructor === Number || v.constructor == RegExp ) {
					return v;
				} else if ( v.constructor == Date ) {
					return 'Date('+ v.getTime() +', '+ v +')';
				} else if ( v.each && v.bind ) {
					rv = [];
					for ( i = 0, max = v.length; i < max; i++ ) {
						rv.push(i +':'+ tostring(v[i]));
					}
					rv.push('length:'+ max);
					return '${'+ rv.join(',') +'}';
				} else if ( v.nodeType ) {
					return '[object '+ v.nodeName.toUpperCase() +' Element]';
				} else {
					rv = [];
					for ( i in v ) {
						rv.push('\''+ i +'\':'+ tostring(v[i]));
					}
					return '{'+ rv.join(',') +'}';
				}
			} else {
				return '"'+ ((v.replace)? v.replace(/\</g, '<') : v) +'"';
			}
		}
	
		function create() {
			if ( !box ) {
				box = document.createElement('ol');
				box.style.cssText = 'position:absolute;left:5px;top:5px;max-width:75%;font-family:verdana;font-size:9px;color:#000;line-height:1.35em;margin:0;padding:3px 3px 2px 38px;border:1px solid #000;background:#fff;display:none;z-index:10000;opacity:0.75;filter:alpha(opacity=75);';
				box.onclick = clear;
				addbox();
			}
		}

		function addbox() {
			if ( document.body ) {
				document.body.appendChild(box);
			} else {
				setTimeout(addbox, 10);
			}
		}

		function clear(){
			if ( box ) {
				box.innerHTML = '';
				box.style.display = 'none';
				number = 1;
			}
		}

		return {
			log: function() {
				for ( var i = 0, max = arguments.length, v = [], li = document.createElement('li'); i < max; i++ ) {
					v.push(tostring(arguments[i]));
				}
				li.style.cssText = 'list-style:decimal;margin-bottom:1px;padding:2px 3px 3px;background:'+ ((number%2)? '#eee;' : '#ddd;');
				li.innerHTML = v.join(', ');
				create();
				box.appendChild(li);
				box.style.display = 'block';
				number++;
			},
			fixed: function(flag) {
				create();
				box.style.position = ( flag === false )? 'absolute' : 'fixed';
			},
			clear: clear
		}
	
	})();

})(window.jQuery);

// x slider
(function($) {

	'use strict';

	if ( !$ || $.fn.xlider ) {
		return;
	}

	var

		EL_win = $(window),
		EL_doc = $(document.documentElement),
		EL_body = $(document.body),

		isMobile = $.browser.mobile,
		isIOS = $.browser.ios,
		isAndroid = $.browser.android,
		supportTransform = $.support.transform,
		supportTransition = $.support.transition,

		getEventType = $._event.gettype,
		getEventPoint = $._event.getpoint,

		regExpIsUL = /ul/i,

		windowWidth,
		resizeFunctions = [],

		last;

	/*
		* option
		{
			defaultPage: 숫자(0~) - 처음 표시할 슬라이드
			endless: true|false - 무한 슬라이드
			paging: true|false - 페이징 사용 <p class="paging"><button>1</button><button>2</button></p> 형식으로 EL_box에 추가됨.
			arrows: [$이전버튼, $다음버튼](외부에 정의된 jQuery객체) | tag명 string <p class="arrows"><button class="prev">Prev</button><button class="next">Next</button></p> 형식으로 EL_box에 추가됨.
			useSwipe: true|false - swipe 기능 사용
			animate: true|false - 애니매이션 사용
			animateDuration: 애니매이션 시간 지정(밀리초)
			useTransition: true|false - css transition 사용
			autoPlay: 밀리세컨드 - 자동 플레이 설정(시간간격을 밀리초단위로 지정)
			fade: true|false - 페이드 효과 사용. 사용시 endless = true, useSwipe = false로 자동 변경

			onMove: 위치에 변화가 있을 때마다 호출. useTransition이 true일 경우에는 호출 안함
			onChange: 페이지가 바뀌기 전 호출
			onChangeEnd: 페이지가 바뀌고 난 후 호출
		}
		* methods
		- 공통 인수 noAnimation으로 애니매이션 여부 설정
		{
			prev(noAnimation): 이전 페이지
			next(noAnimation): 다음 페이지
			jump(page, pretendTo, noAnimation): page로 점프(중간 페이지는 보이지 않음). pretendTo('prev'|'next')로 애니매이션 방향 지정.
			change(page, noAnimation): page로 이동,
			toggleAuto([true|false]): autoPlay 재생/정지 토글 또는 값 지정(값이 없으면 토글)
		}
	 */


	$.fn.xlider = function(_option, value, pretendTo, noAnimation) {
		var forState;
		if (!_option || $.isPlainObject(_option)) {
			this.each(function() {
				xlider($(this), _option);
			});
		} else if (typeof(_option) == 'string') {
			if (_option == 'prev' || _option == 'next') {
				noAnimation = value;
			} else if (_option == 'toggleAuto') {
				forState = {v: 0, value: value};
				$(this).trigger('xlider-'+_option, forState, value);
				return forState.v;
			} else if (_option == 'change' || typeof pretendTo != 'string') {
				noAnimation = pretendTo;
			}
			this.trigger('xlider-'+_option, {to: value, pretendTo: pretendTo, noAnimation: noAnimation});
		}
		return this;
	}

	EL_win.resize(function() {
		windowWidth = EL_doc[0].clientWidth;
		$.each(resizeFunctions, function() {
			this();
		});
	});


	function xlider(EL_box, option) {

		var option = option || {},

			endless = option.endless,
			arrows = option.arrows,
			arrowsTag = arrows ? arrows.constructor == Array ? 'pre' : typeof arrows == 'string' ? arrows : 'button' : '',
			paging = option.paging,
			pagingTag = paging ? paging.length && paging[0].nodeType ? 'pre' : typeof paging == 'string' ? paging : 'button' : '',
			useSwipe = option.swipe !== false,
			useFade = option.fade,
			animate = option.animate !== false,
			animateDuration = option.duration,
			autoPlay = option.autoPlay,
			useTransition = option.useTransition && supportTransition,
			numDisplay = option.numDisplay || 1,


			eventMove = option.onMove,
			eventChange = option.onChange,
			eventChangeEnd = option.onChangeEnd,

			EL_wrapper,
			EL_arrows, EL_prev, EL_next,
			EL_paging, EL_pagingItems,

			EL_items = EL_box.children(),
			EL_fakeItem,

			EL_blocker,

			boxWidth, itemWidth, moveSize,
			downX, downY, baseX, swipeAngle, startTime, moved,

			multiMode = numDisplay > 1,
			classicMode = false,

			clickAble = true,
			blockerAdded = false,

			autoPlaying = !!autoPlay,
			autoPlayTimer = null,

			wrapperClassName = 'xlider-wrapper',

			zIndex = 0,

			i = 0, max = EL_items.length,

			nowPage = option.defaultPage && option.defaultPage > -1 ? Math.min(max-1, option.defaultPage) : 0,

			aniOption = {
				slide: {queue: false, step: onMove, easing: 'easeOutCubic', complete: changeEnd},
				back: {queue: false, step: onMove, easing: 'easeOutCubic', complete: changeEnd},
				fade: {queue: false, easing: 'easeOutSine', complete: changeEnd}
			};


		if (!EL_body.length) {
			EL_body = $(document.body);
		}

		if (!max) {
			return;
		}

		if (useFade) {
			useSwipe = false;
			endless = true;
		}

		// box 자체가 ul 태그이면 ul을 wrapper로 하고 parent를 box로 변경
		if (regExpIsUL.test(EL_box[0].nodeName)) {
			EL_wrapper = EL_box.addClass(wrapperClassName);
			EL_box = EL_wrapper.parent();
		// 아이템 하나이고 ul 태그면 ul내의 li를 아이템으로
		} else if (2 > max && regExpIsUL.test(EL_items[0].nodeName)) {
			EL_wrapper = EL_items.addClass(wrapperClassName);
			EL_items = EL_items.find('> li');
			max = EL_items.length;
		}
		// wrapper추가
		if (!EL_wrapper) {
			EL_wrapper = $('<div class="'+ wrapperClassName +'" />').appendTo(EL_box);
		}
		if (EL_wrapper.css('position') == 'static') {
			EL_wrapper.css('position', 'relative');
		}
		if (EL_wrapper.css('zIndex') == 'auto') {
			EL_wrapper.css('zIndex', 0);
		}
		EL_box.css('overflow', 'hidden');

		// fade 효과가 아니면, endless 는 2개 이상일 때만
		if (!useFade && endless && 2 > max) {
			endless = false;
		}

		// arrow 버튼 추가
		if (arrows && max > 1) {
			// 미리 정해놓은 방향버튼 엘리먼트
			if (arrowsTag == 'pre') {
				EL_prev = arrows[0];
				EL_next = arrows[1];
			} else {
				EL_arrows = $('<p class="arrows" />').appendTo(EL_box);
				EL_prev = $('<'+ arrows +' class="prev">Prev</'+ arrows +'>').appendTo(EL_arrows);
				EL_next = $('<'+ arrows +' class="next">Next</'+ arrows +'>').appendTo(EL_arrows);
			}
			EL_prev.attr('data-flag', 'prev').click(toPrev);
			EL_next.attr('data-flag', 'next').click(toNext);
		} else if (2 > max) {
			// arrow를 외부에서 미리 정해놓은 경우 제거.
			if (arrows == 'pre') {
				arrows[0].remove();
				arrows[1].remove();
			}
			arrows = null;
		}

		// paging 추가
		if (paging) {
			// 미리 정해놓은 페이징 엘리먼트
			if (pagingTag == 'pre') {
				EL_paging = $(paging);
				EL_pagingItems = EL_paging.children();
			} else {
				EL_paging = $('<p class="paging" />').appendTo(EL_box);
				EL_pagingItems = [];
				for (i = 0; i < max; i++) {
					EL_pagingItems[i] = $('<'+pagingTag+' />');
					EL_pagingItems[i][0].innerHTML = i+1;
				}
			}
		}

		for (i = 0; i < max; i++) {
			EL_items[i] = $(EL_items[i]).css({left: useFade ? 0 : '200%', top: 0, width: '100%', display: i == nowPage ? '' : 'none'});
			EL_items[i].find('a, button, input, textarea').attr('data-xlider-page', i).focus(itemFocusablesFocused);
			EL_items[i].appendTo(EL_wrapper);
			if (paging) {
				EL_pagingItems[i] = $(EL_pagingItems[i]).attr('data-page', i)
					.click(change)
					.appendTo(EL_paging);
			}
		}

		if (useSwipe) {
			if ($.browser.ie) { // ie tablet fix
				if (window.navigator.pointerEnabled) {
					EL_wrapper[0].style.cssText += 'touch-action: pan-y;';
				} else if (window.navigator.msPointerEnabled ){
					EL_wrapper[0].style.cssText += '-ms-touch-action: pan-y;';
				}
			}
			EL_wrapper.bind(getEventType({mousedown: down}));
			EL_wrapper.bind('selectstart dragstart', function() {
				return false;
			});
		}

		// 외부 제어용
		EL_box.bind('xlider-prev', function(e, option) {
			toPrev(e, false, option.noAnimation);
		});
		EL_box.bind('xlider-next', function(e, option) {
			toNext(e, false, option.noAnimation);
		});
		EL_box.bind('xlider-jump', function(e, option) {
			jump(option);
		});
		EL_box.bind('xlider-change', function(e, option) {
			change(option);
		});
		EL_box.bind('xlider-toggleAuto', function(e, forState) {
			forState.v = toggleAuto(forState.value);
		});
		EL_box.bind('xlider-remove', function(e) {
			for (i = 0; i < max; i++) {
				if (!regExpIsUL.test(EL_wrapper[0].nodeName)) {
					EL_items[i].appendTo(EL_box);
				}
				if (paging) {
					if (pagingTag != 'pre') {
						EL_pagingItems[i].remove();
					} else {
						EL_pagingItems[i].unbind('click');
					}
				}
			}
			EL_wrapper._css({position: '', translate3dX: ''}).removeClass(wrapperClassName);
			EL_wrapper.unbind(getEventType({mousedown: down}));
			if (!regExpIsUL.test(EL_wrapper[0].nodeName)) {
				EL_wrapper.remove();
			}
			if (paging && pagingTag != 'pre') {
				EL_paging.remove();
			}
			if (arrows) {
				if (arrowsTag != 'pre') {
					EL_prev.remove();
					EL_next.remove();
				} else {
					EL_prev.unbind('click');
					EL_next.unbind('click');
				}
			}
			EL_fakeItem && EL_fakeItem.remove();
			EL_blocker.remove();
			EL_box.unbind('xlider-prev xlider-next xlider-jump xlider-change xlider-toggleAuto xlider-remove');
			EL_box = EL_wrapper = EL_prev = EL_next = EL_pagingItems = null;
			for (i = 0, max = resizeFunctions.length; i < max; i++) {
				if (resizeFunctions[i] == resize) {
					resizeFunctions.splice(i, 1);
					break;
				}
			}
		});

		// mouse로 드래그 시 콘텐츠 차단용 엘리먼트
		EL_blocker = $('<div class="blocker" style="position:absolute;left:0;top:0;width:100%;height:100%;background:#000;" />').css('opacity', 0);


		setButtons();
		resize();
		changeEnd();

		resizeFunctions.push(resize);


		function down(e) {

			clearAutoPlay();

			if (!clickAble) {
				return false;
			}

			downX = baseX = getEventPoint(e)[0];

			// ios 7 이상의 사파리에서 양 끝으로 이전/다음 히스토리 이동시 화면이 깨져서.. 좌우 15픽셀 내에서는 취소
			if (isIOS && (15 > downX || downX > windowWidth-15)) {
				return true;
			}

			downY = getEventPoint(e)[1];
			startTime = new Date().getTime();

			moved = 0;
			swipeAngle = false;

			EL_doc.bind(getEventType({mousemove: move, mouseup: up}));

		}

		function move(e) {

			var x = getEventPoint(e)[0],
				y = getEventPoint(e)[1],
				nowTime = new Date().getTime();

			// 드래그 각도체크 좌우 90도(><) 이내일때만 동작
			if (swipeAngle === false) {
				swipeAngle = Math.abs((Math.atan2(downX-x, downY-y)*180)/Math.PI);
				if (45 > swipeAngle || swipeAngle > 135) {
					EL_doc.unbind(getEventType({mousemove: move, mouseup: up}));
					return true;
				}
			}

			moved = x-downX;
			if (!endless && (!nowPage || nowPage == max-1)) {
				moved /= 2;
			}
			EL_wrapper._css('translate3dX', moved);
			onMove(moved);

			if (nowTime-300 > startTime) {
				startTime = nowTime;
				baseX = x;
			}

			// mobile 환경이 아닌 경우 콘텐츠 접근 차단
			if (!isMobile && !blockerAdded) {
				EL_blocker.appendTo(EL_box);
				blockerAdded = true;
			}

			e.preventDefault();

		}

		function onMove(v, moveOnly) {
			moveOnly !== true && eventMove && eventMove.call(EL_box, $.isPlainObject(v) ? v.translate3dX : v);
		}

		function up(e) {

			var x = getEventPoint(e)[0],
				movedvalue = x - baseX;

			if (x != downX) {
				if (10 > Math.abs(x-downX)) {
					back();
				} else if (!movedvalue || new Date().getTime()-startTime > 300) {
					if (moved > boxWidth/2 && (endless || nowPage)) {
						toPrev(false, true);
					} else if (-boxWidth/2 > moved && (endless || nowPage != max-1)) {
						toNext(false, true);
					} else {
						back();
					}
				} else {
					if (movedvalue > 0 && (endless || nowPage)) {
						toPrev(false, true);
					} else if (0 > movedvalue && (endless || nowPage != max-1)) {
						toNext(false, true);
					} else {
						back();
					}
				}
			} else {
				setAutoPlay();
			}

			if (!isMobile && blockerAdded) {
				EL_blocker.detach();
				blockerAdded = false;
			}

			EL_doc.unbind(getEventType({mousemove: move, mouseup: up}));

		}

		function back() {
			wrapperMove(0, 'back');
		}

		function change(option) {
			var nextPage, moveTo, page = parseInt(option.to);
			if (!clickAble) {
				return false;
			}
			nextPage = typeof page == 'number' && !isNaN(page) ? page : this.getAttribute ? parseInt(this.getAttribute('data-page')) : null;
			if (nextPage !== null && nextPage != nowPage && nextPage > -1 && max > nextPage) {
				resize();
				if (useFade) {
					fade(nextPage, option.noAnimation);
				} else {
					moveTo = (nowPage-nextPage)*moveSize;
					readyToMove(nextPage);
					wrapperMove(moveTo, 'slide', option.noAnimation);
				}
			}
			return false;
		}

		function toPrev(e, fromSwipe, noAnimation) {
			var nextPage;
			if (!clickAble || (!endless && !nowPage)) {
				return false;
			}
			nextPage = !nowPage ? max-1 : nowPage-1;
			if (useFade) {
				fade(nextPage, noAnimation);
			} else {
				readyToMove(nextPage, 'prev', fromSwipe);
				wrapperMove(moveSize, 'slide', noAnimation);
			}
			e && e.preventDefault();
			return true;
		}

		function toNext(e, fromSwipe, noAnimation) {
			var nextPage;
			if (!clickAble || (!endless && nowPage == max-1)) {
				return false;
			}
			nextPage = nowPage == max-1 ? 0 : nowPage+1;
			if (useFade) {
				fade(nextPage, noAnimation);
			} else {
				readyToMove(nextPage, 'next', fromSwipe);
				wrapperMove(-moveSize, 'slide', noAnimation);
			}
			e && e.preventDefault();
			return true;
		}

		function jump(option) {
			var direction, page = option.to;
			if (!clickAble || page == nowPage) {
				return false;
			}
			if (useFade) {
				change(option);
			} else {
				for (i = 0; i < max; i++) {
					i != page && i != nowPage && EL_items[i].hide();
				}
				direction = option.pretendTo ? option.pretendTo : nowPage > page ? 'prev' : 'next';
				readyToMove(page, direction);
				wrapperMove(direction == 'prev' ? moveSize : -moveSize, 'slide', option.noAnimation);
			}
			return false;
		}

		function readyToMove(nextPage, prevOrNext, withoutDisplays) {
			var from, to;
			// 이전, 다음 페이지 display 설정. swipe 할 때는 자체 해결.
			if (!withoutDisplays) {
				if (prevOrNext) {
					appendItem(nextPage, prevOrNext == 'next' ? '100%' : '-100%');
				} else {
					from = Math.min(nowPage, nextPage);
					to = Math.max(nowPage, nextPage);
					for (i = from; i <= to; i++) {
						if (i != nowPage) {
							appendItem(i, (i-nowPage)*100+'%');
						}
					}
				}
			}
			ready(nextPage);
		}

		function ready(nextPage) {
			clearAutoPlay();
			clickAble = false;
			nowPage = nextPage;
			setButtons();
			eventChange && eventChange.call(EL_box, nowPage, max);
			resize();
		}

		function appendItem(target, left) {
			(typeof target == 'number' ? EL_items[target] : target).css({position: 'absolute', left: left}).show();
		}

		function fade(nextPage, noAnimation) {
			ready(nextPage);
			if (animate && !noAnimation) {
				appendItem(nowPage, 0);
				EL_items[nowPage].css({opacity: 0, zIndex: ++zIndex});
				if (useTransition) {
					EL_items[nowPage]._transition({opacity: 1}, aniOption.fade);
				} else {
					EL_items[nowPage]._animate({opacity: 1}, aniOption.fade);
				}
			} else {
				changeEnd();
			}
		}

		function wrapperMove(value, aniOptionKey, noAnimation) {
			if (animate && !noAnimation) {
				if (useTransition) {
					EL_wrapper._transition({translate3dX: value}, aniOption[aniOptionKey]);
				} else {
					EL_wrapper._animate({translate3dX: value}, aniOption[aniOptionKey]);
				}
			} else {
				changeEnd();
			}
		}

		function setButtons() {
			for (i = 0; i < max; i++) {
				if (paging) {
					EL_pagingItems[i][ ( i == nowPage )? 'addClass' : 'removeClass' ]('on');
				}
			}
			if (!endless && arrows) {
				EL_prev[!nowPage ? 'addClass' : 'removeClass' ]('disabled');
				EL_next[nowPage == max-1 ? 'addClass' : 'removeClass' ]('disabled');
			}
		}

		function changeEnd() {

			var EL_prevItem, EL_nextItem, EL_nowItem;

			for (i = 0; i < max; i++) {
				if (i == nowPage) {
					EL_items[i].css({position: 'relative', left: 0}).addClass('xlider-current');
				} else {
					EL_items[i].hide().removeClass('xlider-current');
				}
			}

			if (!useFade) {

				if (EL_fakeItem) {
					EL_fakeItem.remove();
					EL_fakeItem = null;
				}

				EL_wrapper._css('translate3dX', 0);

				EL_prevItem = EL_items[!nowPage ? endless ? max-1 : -1 : nowPage-1],
				EL_nextItem = EL_items[nowPage == max-1 ? endless ? 0 : max : nowPage+1],
				EL_nowItem = EL_items[nowPage];

				// endless가 true인데, item이 2개 이하면 우측에 가짜 아이템 추가.
				if (endless && EL_prevItem[0] == EL_nextItem[0]) {
					EL_fakeItem = EL_prevItem.clone().addClass('xlider-fake');
					EL_fakeItem.appendTo(EL_wrapper);
					appendItem(EL_fakeItem, itemWidth, true);
				}

				// 양쪽 사이드 아이템들 추가
				for (i = 0; i < max; i++) {
					if (EL_prevItem && EL_items[i][0] == EL_prevItem[0]) {
						appendItem(i, '-'+ itemWidth);
					} else if (EL_nextItem && EL_items[i][0] == EL_nextItem[0]) {
						appendItem(i, itemWidth);
					}
				}

			}

			clickAble = true;

			eventChangeEnd && eventChangeEnd.call(EL_box, nowPage, max);

			setAutoPlay();

		}

		function autoPlayAction() {
			jump({to: nowPage == max-1 ? 0 : nowPage+1, pretendTo: 'next'});
		}

		function clearAutoPlay() {
			clearTimeout(autoPlayTimer);
		}

		function setAutoPlay() {
			clearAutoPlay();
			if (autoPlaying) {
				autoPlayTimer = setTimeout(autoPlayAction, autoPlay);
			}
		}

		function toggleAuto(value) {
			autoPlaying = typeof(value) == 'boolean' ? value : !autoPlaying;
			if (!autoPlaying) {
				clearAutoPlay();
			} else {
				setAutoPlay();
			}
			return autoPlaying;
		}

		function setWrapperMS() {
			if (animate) {
				aniOption.slide.duration = animateDuration || Math.min(moveSize, 750);
				aniOption.back.duration = (animateDuration || aniOption.slide.duration)*0.75;
				aniOption.fade.duration = animateDuration || 500;
			}
		}

		function itemFocusablesFocused() {
			var index = parseInt(this.getAttribute('data-xlider-page'));
			EL_box[0].scrollLeft = 0;
			setTimeout(function() {
				EL_box[0].scrollLeft = 0;
			}, 0);
			EL_box.xlider('change', index, true);
		}

		function resize() {
			boxWidth = EL_box[0].offsetWidth;
			itemWidth = multiMode ? EL_items[0][0].offsetWidth : '100%';
			moveSize = multiMode ? itemWidth : boxWidth;
			setWrapperMS();
		}
		
	}

	function cancelEvent(e) {
		e.preventDefault();
	}

})(window.jQuery);