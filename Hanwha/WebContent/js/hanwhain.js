

// initialize
$(function() {
	HANWHAIN.initialize();
});

// hanwhain object
var HANWHAIN = {

	areaWidth: 0,
	areaHeight: 0,

	scrollTop: 0,
	scrollBarWidth: 0,
	scrollFunctions: [],

	initialized: false,

	imageRoot: '',

	gnb: function() {

		if (!$('#gnb').length) {
			return {hold: jQuery.noop, release: jQuery.noop, scroll: jQuery.noop};
		}

		var
			EL_body = $(document.body),
			EL_gnb = $('#gnb'),
			EL_header = EL_gnb.parent(),
			EL_h1 = EL_header.find('h1'),
			EL_line = $('<div class="line" />').appendTo(EL_gnb),
			EL_items = EL_gnb.find('ul.nav > li'),
			EL_links = [],
			EL_subs = [],
			EL_subItems = [],
			EL_subItemCovers = [],
			EL_textSub,
			EL_asideArea,

			EL_blockover = $('<div class="blockover" />').insertBefore(EL_header[0].firstChild),

			EL_util = $('#util'),
			EL_photo = null,
			EL_alim = $('#lay-alim'),
			EL_alimButton = null,
			EL_alimTime = EL_alim.find('> p > span'),
			EL_alimTabs = EL_alim.find('> ul > li > a'),
			EL_allmenuButton = EL_util.find('a.menu'),
			EL_allmenuMent = $('<span class="ment" />'),

			serverTime = jQuery.trim(EL_alimTime.html()),
			initTime = new Date().getTime(),

			currentSubIndex = -1,
			currentDepth = (EL_body.attr('data-nav-current') || '0-0-0').split('-'),

			gnbHeight = EL_gnb[0].offsetHeight,
			subHeight = 0,

			styleMethod = '_css',
			expanded = false,
			resetTimer = null,
			subResetTimer = null,
			alimTimeRefeshTimer = null,
			resetWait = false,

			alimOpened = false,
			alimWheelControl = {},

			prevScrollTop = -1,
			reduced = false,
			reduceCase = 0,

			holding = false,

			allmenuTimer = true,

			useTransform = jQuery.support.translate3d,
			useOpacity = jQuery.support.opacity,

			aniOption = {
				expand: {queue: false, duration: 450, easing: 'easeOutCubic'},
				expandHeader: {queue: false, duration: 450, easing: 'easeOutCubic', step: headerMoving, complete: onExpaned},
				reduce: {queue: false, duration: 300, easing: 'easeOutCubic', step: headerMoving}
			},

			i, j, numSubMenus, numMenus = EL_items.length;


		// modify for accessibility issue 150429
		$('#skipNav a').click(function() {
			$(this.getAttribute('href')).attr('tabIndex', -1).focus();
			return false;
		});

		jQuery.each(currentDepth, function(index) {
			currentDepth[index] = parseInt(currentDepth[index])-1;
		});
		if (currentDepth[2] != -1) {
			EL_body.addClass('depth3');
		} else if (currentDepth[1] != -1) {
			EL_body.addClass('depth2');
		}

		EL_h1.find('a').click(function() {
			jQuery._cookie.set('logoclicked', 1, 1, '/');
		});
		if (!$.browser.ie || $.browser.ie > 9) {
			EL_h1.find('img').each(function() {
				var aniLogo = new Image();
				aniLogo.src = this.src.replace('.png', 'ani2x2.gif');
				aniLogo.alt = '';
				this.parentNode.appendChild(aniLogo);
			});
		}

		for (i = 0; i < numMenus; i++) {
			EL_items[i] = $(EL_items[i]).attr('data-index', i)
				.mouseenter(open)
				.mouseleave(reset);
			EL_links[i] = EL_items[i].find('> a').attr('data-index', i)
				.mouseenter(open)
				.focus(open)
				.blur(reset);
			EL_subs[i] = EL_items[i].find('div.lay-sub');
			EL_subItems[i] = EL_subs[i].find('li a');
			EL_subItemCovers[i] = [];
			for (j = 0, numSubMenus = EL_subItems[i].length; j < numSubMenus; j++) {
				EL_subItems[i][j] = $(EL_subItems[i][j]).attr({'data-index': j, 'data-parent-index': i})
					.mouseenter(subHover).focus(subHover)
					.mouseleave(subLeave).blur(subLeave);
				if (useOpacity) {
					EL_subItemCovers[i][j] = $('<span />').css('opacity', 0)
						.appendTo(EL_subItems[i][j]);
				}
			}
			EL_asideArea = EL_subs[i].find('aside');
			if (EL_asideArea.length) {
				EL_asideArea.each(createAsideEffect);
				EL_asideArea.find('a').focus(resetCancel).blur(reset);
			}
		}
		if (currentDepth[0] > -1) {
			// 3 depth
			if (currentDepth[2] > -1) {
				// EL_textSub = EL_header.find('div.tit-area');
				EL_textSub = $('#container div.tit-area').appendTo(EL_header);
			// 2 depth
			} else if (4 > currentDepth[0]) {
				EL_textSub = $('<div class="sub" />').appendTo(EL_items[currentDepth[0]])
					.mouseenter(textSubHover)
					.mouseleave(textSubLeave)
					.append(EL_items[currentDepth[0]].find('ul').clone());
				if (currentDepth[1] > -1) {
					EL_textSub.find('li').eq(currentDepth[1]).addClass('on');
				}
			}
			if (useOpacity && EL_textSub) {
				EL_textSub.css('opacity', 0);
			}
		}
		subHeight = EL_subs[0][0].offsetHeight;
		reduceCase = currentDepth[2] > -1 ? 2 : currentDepth[1] > -1 ? 1 : 0;
		resetAction();

		EL_util.find('li:first').addClass('first-child');
		EL_alim.bind('mousewheel', function(e) {
				// e.stopPropagation();
			})
		EL_alimButton = EL_util.find('> li:first > a').not('.login').click(toggleAlimLayer);
		EL_photo = EL_alimButton.not('.name');
		EL_alimButton = EL_alimButton.filter('.name');
		EL_alimTabs.click(changeAlimTab);
		$(document.body).click(function(e) {
			var parent;
			if (EL_alim && EL_alim.length && EL_alim[0].offsetWidth) {
				parent = e.target.parentNode;
				while (parent.nodeName.toLowerCase() != 'body') {
					if (parent == EL_alim[0]) {
						return;
					}
					parent = parent.parentNode;
				}
				toggleAlimLayer();
			}
		});
		// EL_items[0].mouseenter();

		EL_allmenuMent.css(useOpacity ? {marginTop: -5, opacity: 0} : {display: 'none'})
			.appendTo(EL_allmenuButton.parent().addClass('last-child'));
		EL_allmenuButton.bind({mouseenter: allmenuMentShow, mouseleave: allmenuMentHide, focus: allmenuMentShow, blur: allmenuMentHide,
			click: function() {
				HANWHAIN.allmenu.open && HANWHAIN.allmenu.open(this);
				return false;
			}
		});

		// not index
		if (!$('section.main-con').length) {
			$(window).load(allmenuDisplay);
		}

		HANWHAIN.imageRoot = EL_h1.find('img')[0].src.replace(/[^\/]+$/, '');


		function allmenuDisplay() {
			if (allmenuTimer) {
				allmenuTimer = setTimeout(function() {
					allmenuMentShow();
					allmenuTimer = setTimeout(allmenuMentHide, 1000);
				}, 500);
			}
		}

		function allmenuMentShow() {
			clearTimeout(allmenuTimer);
			allmenuTimer = false;
			EL_allmenuMent.show();
			useOpacity && EL_allmenuMent.stop().animate({marginTop: 0, opacity: 1}, {queue: false, duration: 350, easing: 'easeOutCubic'});
		}

		function allmenuMentHide() {
			if (useOpacity) {
				EL_allmenuMent.stop().animate({marginTop: -5, opacity: 0}, {queue: false, duration: 500, easing: 'easeInOutCubic', complete: HANWHAIN.noneMe});
			} else {
				EL_allmenuMent.hide();
			}
		}

		function open(e) {
			var index = this.getAttribute('data-index'),
				isFocus = e.type == 'focus',
				i = 0;
			resetCancel();
			if (currentSubIndex != index) {
				colorSet(index, isFocus);
				if (!expanded) {
					styleMethod = useOpacity && !isFocus ? '_animate' : '_css';
					EL_gnb[styleMethod]({height: gnbHeight+subHeight}, {queue: false, duration: 650, easing: 'easeOutQuart'});
					EL_line[styleMethod]({opacity: 1}, {queue: false, duration: 350, easing: 'easeOutQuad'});
					textSubHide(isFocus);
					expanded = true;
				}
				showSub(index, isFocus);
			}
		}

		function colorSet(index, noAni, fromReset) {
			var i = 0;
			for (; i < numMenus; i++) {
				// EL_links[i]._stop()[useOpacity && !noAni ? '_animate' : '_css']({opacity: i == index ? 1 : 0}, {queue: false, duration: 350, easing: 'easeOutQuad'});
				EL_links[i]._stop()[useOpacity && !noAni ? '_animate' : '_css']({color: i == index ? '#f37321' : '#000000'}, {queue: false, duration: 350, easing: 'easeOutQuad'});
				EL_items[i].removeClass('on');
			}
			fromReset && EL_items[currentSubIndex] && EL_items[currentSubIndex].addClass('on');
		}

		function showSub(index, noAni) {
			var i = 0;
			for (; i < numMenus; i++) {
				EL_subs[i].css({zIndex: i == index ? 1 : 0});
			}
			currentSubIndex = index;
			if (useOpacity && !noAni) {
				for (i = 0; i < numMenus; i++) {
					if (i == index) {
						EL_subs[i].css('visibility', 'visible')._animate({opacity: 1}, {queue: false, duration: 750, easing: 'easeOutQuad', complete: checkHiddenMe});
					} else {
						EL_subs[i]._animate({opacity: 0}, {queue: false, duration: 350, easing: 'easeOutQuad', complete: hiddenMe});
					}
				}
			} else {
				if (useOpacity) {
					for (i = 0; i < numMenus; i++) {
						EL_subs[i].css('visibility', i == index ? 'visible' : 'hidden')._css({opacity: i == index ? 1 : 0});
					}
				}
				onShowSub();
			}
		}

		function hiddenMe() {
			this.style.visibility = 'hidden';
		}

		function checkHiddenMe() {
			!expanded && hiddenMe.call(this);
		}

		function onShowSub() {
			for (var i = 0; i < numMenus; i++) {
				EL_subs[i].css('visibility', i == currentSubIndex && expanded ? 'visible' : 'hidden');
			}
		}

		function subHover() {
			resetCancel();
			subFocusSet(this.getAttribute('data-index'),  this.getAttribute('data-parent-index'));
			subColorSet(this.getAttribute('data-index'),  this.getAttribute('data-parent-index'), true);
		}

		function subLeave(e) {
			subFocusSet(-1,  this.getAttribute('data-parent-index'));
			subColorSet(currentDepth[1],  this.getAttribute('data-parent-index'));
			e && e.type == 'blur' && reset();
		}

		function subFocusSet(index, parentIndex) {
			var EL_covers = EL_subItemCovers[parentIndex],
				i = 0, numSubMenus = EL_covers.length;
			for (; i < numSubMenus; i++) {
				EL_subItems[parentIndex][i].css('zIndex', i == index ? 1 : 0);
				if (useOpacity) {
					EL_covers[i][styleMethod]({opacity: index == -1 || i == index ? 0 : 0.6}, {queue: false, duration: 350, easing: 'easeOutQuad'});
				}
			}
		}

		function subColorSet(index, parentIndex, hovering) {
			if (0 > currentDepth[0] || currentDepth[0] > 3) {
				return;
			}
			var EL_items = EL_subItems[parentIndex],
				currentMenu = hovering || parentIndex == currentDepth[0],
				i = 0, numSubMenus = EL_items.length;
			for (; i < numSubMenus; i++) {
				EL_items[i][styleMethod]({color: currentMenu && i == index ? '#f17330' : '#757575'}, {queue: false, duration: 350, easing: 'easeOutQuad'});
			}
		}

		function textSubShow(noAni) {
			if (EL_textSub) {
				if (useOpacity && noAni !== true) {
					EL_textSub._stop().show().animate({opacity: 1}, {queue: false, duration: 200, easing: 'easeOutQuad'});
				} else {
					EL_textSub.show();
				}
			}
		}

		function textSubHide(noAni) {
			// if (EL_textSub && reduceCase == 1) {
			if (EL_textSub) {
				if (useOpacity && noAni !== true) {
					EL_textSub._animate({opacity: 0}, {queue: false, duration: 200, easing: 'easeOutQuad', complete: HANWHAIN.noneMe});
				} else {
					EL_textSub.hide();
				}
			}
		}

		function textSubHover(e) {
			if (reduced) {
				// expand();
			}
			e.stopPropagation();
		}

		function textSubLeave(e) {
			e.stopPropagation();
		}

		function reset() {
			resetCancel();
			if (!resetWait) {
				resetTimer = setTimeout(resetAction, 100);
			}
		}

		function resetCancel() {
			clearTimeout(resetTimer);
		}

		function resetAction() {
			// depth 1
			showSub(currentDepth[0]);
			colorSet(currentDepth[0], false, true);
			// depth 2
			subColorSet(currentDepth[1], currentDepth[0]);
			textSubShow();
			if (expanded) {
				EL_gnb[styleMethod]({height: gnbHeight}, {queue: false, duration: 500, easing: 'easeOutQuart'});
				EL_line[styleMethod]({opacity: 0}, {queue: false, duration: 350, easing: 'easeOutQuad'});
				styleMethod = '_css';
				expanded = false;
				!useOpacity && onShowSub();
			}
			currentSubIndex = -1;
		}

		if (serverTime && (/^[0-9]{14}$/).test(serverTime)) {
			(function() {
				var matches = serverTime.match(/([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})/);
				serverTime = new Date();
				serverTime.setHours(matches[4]);
				serverTime.setMinutes(matches[5]);
				serverTime.setSeconds(matches[6]);
			})();
		} else {
			EL_alimTime.html('');
			serverTime = null;
		}

		function alimTimeRefresh() {
			if (!serverTime) {
				return;
			}
			var now = new Date(serverTime.getTime()+(new Date().getTime()-initTime)),
				hour = now.getHours();
			EL_alimTime.html([
					hour > 12 ? hour%12 : hour, ':', addzero(now.getMinutes()),
					' <small>', hour > 11 ? 'pm' : 'am', '</small>'
				].join(''));
			alimTimeRefeshTimer = setTimeout(alimTimeRefresh, 15000);
		}

		function addzero(v) {
			return 10 > v ? '0'+v : v;
		}

		function toggleAlimLayer() {
			var styleMethod = useOpacity ? '_animate' : '_css';
			if (alimOpened) {
				clearTimeout(alimTimeRefeshTimer);
				EL_alim[styleMethod]({opacity: 0}, {queue: false, duration: 250, easing: 'easeOutQuad', complete: HANWHAIN.noneMe});
				if (styleMethod == '_css') {
					EL_alim.hide();
				}
				EL_alimButton.removeClass('close');
				HANWHAIN.gnb.release();
				alimWheelControl.enable();
				alimOpened = false;
			} else {
				EL_alim.css('opacity', 0)[styleMethod]({opacity: 1}, {queue: false, duration: 250, easing: 'easeOutQuad'}).show();
				EL_alimButton.addClass('close');
				alimTimeRefresh();
				HANWHAIN.gnb.hold();
				alimWheelControl.disable();
				alimOpened = true;
			}
			return false;
		}

		alimWheelControl = (function() {

			var regBody = (/body/i),
				regScroller = /(alim|bookmark)/;
				EL_doc = $(document.documentElement);

			function disable() {
				if (window.HANWHAIN) {
					HANWHAIN.scrollFixSkip = true;
				}
				EL_doc.bind('mousewheel', handler);
			}

			function enable() {
				if (window.HANWHAIN) {
					HANWHAIN.scrollFixSkip = false;
				}
				EL_doc.unbind('mousewheel', handler);
			}

			function handler(e) {
				var target = e.target;
				while (!regBody.test(target.nodeName)) {
					if (regScroller.test(target.className)) {
						target.scrollTop += e.originalEvent.wheelDelta/2*-1;
						break;
					} else if (target == EL_alim[0]) {
						break;
					}
					target = target.parentNode;
				}
				e.preventDefault();
			}

			return {
				disable: disable,
				enable: enable
			}

		})();

		function changeAlimTab() {
			var i = 0, numTabs = EL_alimTabs.length;
			for (; i < numTabs; i++) {
				if (EL_alimTabs[i] == this) {
					$(EL_alimTabs[i].parentNode).addClass('on').find('> ul').show();
				} else {
					$(EL_alimTabs[i].parentNode).removeClass('on').find('> ul').hide();
				}
			}
			return false;
		}

		function createAsideEffect() {

			var ie = $.browser.ie,
				EL_this = $(this),
				EL_figure = EL_this.find('figure'),
				EL_image = EL_figure.find('> img');
				EL_grayImage = EL_image.clone();

			EL_grayImage.addClass('grayscale');
			if (ie && (ie == 11 || ie == 10)) {
				HANWHAIN.createGrayScaleImage(EL_grayImage.attr('src'), function(grayImage) {
					EL_grayImage.attr('src', grayImage.src)
				}, 'jpg');
			}

			EL_grayImage.insertBefore(EL_image.next());

			EL_this.mouseenter(function() {
					if (useOpacity) {
						EL_grayImage._animate({opacity: 0}, {queue: false, duration: 250, easing: 'easeInOutQuad'});
					} else {
						EL_grayImage.hide();
					}
				}).mouseleave(function() {
					if (useOpacity) {
						EL_grayImage._animate({opacity: 1}, {queue: false, duration: 250, easing: 'easeInOutQuad'});
					} else {
						EL_grayImage.show();
					}
				});

		}

		function headerMoving() {
			EL_body.trigger('header-moving');
		}

		function expand() {
			var styleMethod = useOpacity ? '_animate' : '_css';
			if (reduced) {
				EL_header._stop().removeClass('min')[styleMethod]({top: 0}, aniOption.expandHeader);
				if (styleMethod == '_css') {
					setTimeout(onExpaned, 500);
				}
				EL_textSub && EL_textSub._stop()[styleMethod]({top: gnbHeight}, aniOption.expand);
				if (reduceCase == 1) {
					EL_h1._stop()[styleMethod]({width: 155, height: 37, translate3dY: 0}, aniOption.expand);
					if (useOpacity) {
						EL_util._stop()[styleMethod]({top: 0, opacity: 0}, {queue: false, duration: 200, easing: 'easeOutQuad', complete: utilShow});
					} else {
						EL_util.removeClass('small').css('top', '');
					}
				}
				reduced = false;
			}
		}

		function onExpaned() {
			EL_header.removeClass('blockover');
		}

		function reduce() {
			var styleMethod = useOpacity ? '_animate' : '_css';
			if (!reduced) {
				EL_header.addClass('min').addClass('blockover')._stop()[styleMethod]({top: -gnbHeight}, aniOption.reduce);
				EL_textSub && EL_textSub[styleMethod]({top: 0}, aniOption.reduce);
				if (reduceCase == 1) {
					EL_h1._stop()[styleMethod]({width: 97, height: 24, translate3dY: 65}, aniOption.reduce);
					if (useOpacity) {
						EL_util._stop()[styleMethod]({top: 47, opacity: 0}, {queue: false, duration: 200, easing: 'easeOutQuad', complete: utilShow});
					} else {
						EL_util.addClass('small').css('top', 47);
					}
				}
				reduced = true;
			}
		}

		function utilShow() {
			EL_util.decideClass('small', reduced)._animate({opacity: 1}, {queue: false, duration: 500, easing: 'easeInOutQuad'});
		}
		
		function scroll(v, maxv) {

			var scrollLeft = Math.max(0, HANWHAIN.getScrollLeft());
			EL_header.css('left', -scrollLeft);
			EL_textSub && EL_textSub.css('left', -scrollLeft);

			if (reduceCase && !holding && !expanded && prevScrollTop != v) {
				// if (/*maxv > v && */v > gnbHeight) {
				// if (/*maxv > v && */v > 130) {
				if (maxv > v && v > 130) {
					if (prevScrollTop > v) {
						expand();
					} else if (v > prevScrollTop) {
						reduce();
					}
				} else {
					expand();
				}
				prevScrollTop = v;
			}
		}

		return {
			hold: function() {
				holding = true;
			},
			release: function() {
				holding = false;
				HANWHAIN.scroll();
			},
			wait: function(_boolean) {
				resetWait = _boolean;
			},
			allmenuDisplay: allmenuDisplay,
			closeAlimLayer: function() {
				if (alimOpened) {
					toggleAlimLayer();
				}
			},
			scroll: scroll
		}

	},

	allmenu: function() {

		if (!$('#allmenu').length) {
			return {};
		}

		var
			EL_allmenu = $('#allmenu'),
			EL_space = $('<div class="space" />'),
			EL_container = EL_allmenu.find('.container'),
			EL_tabs = EL_allmenu.find('.tabs a'),
			EL_depth1 = EL_allmenu.find('.tab-contents > ul > li'),
			EL_depth2 = [],
			EL_figures = [],
			EL_captions = [],
			EL_close = EL_allmenu.find('a.close'),
			opener = null,
			onOffMap = {
				1: [ [1, 1, 1, 1], [1, -1], [1, 1, 1], [1, 1, 1, 1] ],
				2: [ [1, 1, -1, -1], [1, 1], [1, 1, 1], [-1, 1, 1, -1] ],
				3: [ [1, 1, -1, 1], [-1, -1], [1, 1, -1], [1, 1, 1, 1] ]
			},
			onDepth2s = [],
			defaultCaptionIndex = [],
			currentTabIndex = 0,
			numDepth1 = EL_depth1.length,
			numDepth2 = 0,
			resetTimers = [],
			supportOpacity = $.support.opacity,
			opened = false;
			i = 0, numTabs = EL_tabs.length;


		EL_space.insertBefore(EL_allmenu[0].firstChild);
		EL_space.clone().appendTo(EL_allmenu);
		EL_space = EL_allmenu.find('> div.space').click(close);

		for (; i < numTabs; i++) {
			EL_tabs[i] = $(EL_tabs[i]).attr('data-index', i)
				.click(tabChange);
		}

		for (i = 0; i < numDepth1; i++) {
			EL_depth1[i] = $(EL_depth1[i]);
			EL_depth2[i] = EL_depth1[i].find('li').attr('data-index', i)
				.mouseenter(hover).mouseleave(leave);
			EL_depth2[i].find('a')
				.focus(hover).blur(leave).click(depth2Click);
			numDepth2 = EL_depth2[i].length;
			for (j = 0; j < numDepth2; j++) {
				EL_depth2[i][j] = $(EL_depth2[i][j]).attr('data-sub-index', j);
			}
			EL_figures[i] = EL_depth1[i].find('figure');
			EL_captions[i] = EL_figures[i].find('figcaption');
			for (j = 0; j < numDepth2; j++) {
				EL_captions[i][j] = $(EL_captions[i][j]);
				if (EL_captions[i][j].hasClass('default')) {
					EL_captions[i][j].addClass('on').removeClass('default');
					defaultCaptionIndex[i] = j;
				}
			}
		}

		EL_allmenu.click(function(e) {
			if (e.target == e.currentTarget) {
				close();
			}
		});
		EL_close = EL_close.click(close).clone(true).addClass('hidden').insertBefore(EL_allmenu[0].firstChild);

		// open();


		function hover() {
			return;
			var from = this.nodeName.toLowerCase() == 'a' ? this.parentNode : this;
			if (from.className.indexOf('off') != -1) {
				return;
			}
			var index = parseInt(from.getAttribute('data-sub-index')),
				parentIndex = parseInt(from.getAttribute('data-index')),
				EL_group = EL_captions[parentIndex],
				i = 0, numGroup = EL_group.length;
			for (; i < numGroup; i++) {
				EL_group[i].decideClass('on', i == index);
			}
			clearTimeout(resetTimers[parentIndex]);
		}

		function leave() {
			return;
			var from = this.nodeName.toLowerCase() == 'a' ? this.parentNode : this;
			if (from.className.indexOf('off') != -1) {
				return;
			}
			var parentIndex = parseInt(from.getAttribute('data-index'));
			resetTimers[parentIndex] = setTimeout(function() {
				reset(parentIndex);
			}, 200);
		}

		function reset(index) {
			return;
			var EL_group = EL_captions[index],
				subIndex = defaultCaptionIndex[index],
				i = 0, numGroup = EL_group.length;
			if (EL_depth2[index][subIndex].hasClass('off')) {
				subIndex = onDepth2s[index];
			} else {
				EL_depth2[index][subIndex].mouseenter();
			}
			for (; i < numGroup; i++) {
				EL_group[i].decideClass('on', i == subIndex);
			}
		}

		function setting() {
			var classname;
			for (i = 0; i < numDepth1; i++) {
				numDepth2 = EL_depth2[i].length;
				onDepth2s[i] = -1;
				for (j = 0; j < numDepth2; j++) {
					classname = !currentTabIndex ? '' : onOffMap[currentTabIndex][i][j] == 1 ? 'on' : 'off';
					EL_depth2[i][j].attr('class', classname);
					if (onDepth2s[i] == -1 && classname != 'off') {
						onDepth2s[i] = j;
					}
				}
				// EL_figures[i].decideClass('off', onDepth2s[i] == -1);
				reset(i);
			}
		}

		function tabChange() {
			var index = parseInt(this.getAttribute('data-index'));
			for (i = 0; i < numTabs; i++) {
				EL_tabs[i].parent().decideClass('on', i == index);
			}
			currentTabIndex = index;
			setting();
			return false;
		}

		function depth2Click() {
			if (this.parentNode.className.indexOf('off') != -1) {
				return false;
			}
		}

		function open(_opener) {
			opener = _opener;
			HANWHAIN.noScroll.on();
			if (supportOpacity) {
				EL_allmenu._css({opacity: 0})
					.animate({opacity: 1}, {duration: 350, easing: 'easeInOutQuad'});
				EL_container._css({translate3dY: -150, scale: 0.75, rotate: 0.0001, opacity: 0})
					._animate({translate3dY: 0, scale: 1, rotate: 0, opacity: 1}, {duration: 350, delay: 250, easing: 'easeOutCubic'});
			}
			/*
			EL_allmenu.css('opacity', 0).show()
				._animate({opacity: 1}, {duration: 200, easing: 'easeInOutQuad'});
			*/
			EL_allmenu.show();
			EL_close.focus();
			opened = true;
			resize();
		}

		function close() {
			HANWHAIN.noScroll.off();
			EL_allmenu.hide();
			EL_tabs[0].click();
			opener && $(opener).focus();
			opened = false;
			return false;
		}

		function resize() {
			if (opened) {
				EL_space.css('height', Math.max((HANWHAIN.areaHeight-EL_container[0].offsetHeight)/2, 100));
			}
		}

		return {
			open: open,
			close: close,
			resize: resize
		}

	},

	index: function() {
		
		var EL_keyvisual = $('section.main-con'),
			EL_recruit = $('section.recruit'),
			EL_blockList = $('#iframe-affiliates'),
			EL_recruitList = EL_recruit.find('ul:first li'),
			EL_bottomLinks = $('ul.link-type2'),
			EL_footer = $('footer'),

			EL_slider = EL_keyvisual.find('div.sliders'),
			EL_sliderItems = EL_slider.children(),
			EL_sliderImages = EL_sliderItems.find('> img'),
			EL_sliderTexts = EL_sliderItems.find('> p'),
			EL_sliderPlayButton,
			EL_sliderControls = EL_keyvisual.find('div.toggle-type'),
			EL_sliderPaging = EL_sliderControls.find('ul'),
			EL_sliderPrev = EL_sliderControls.find('a.prev'),
			EL_sliderNext = EL_sliderControls.find('a.next'),
			EL_sliderPlay = EL_sliderControls.find('a.play'),
			EL_sliderPause = EL_sliderControls.find('a.pause'),

			EL_moreButton = EL_recruit.find('span.btn-area a'),
			EL_lessButton = EL_blockList.find('div.btn-area a'),

			EL_videoList = EL_keyvisual.find('ul.video-list'),
			EL_vodLayer = $('#vod-layer'),
			EL_vodContainer = EL_vodLayer.find('div.container').not('.alone'),
			EL_vodTitle = EL_vodContainer.find('h1'),
			EL_vodPlayer = EL_vodContainer.find('div.player'),
			EL_vodDescription = EL_vodPlayer.parent().find('> p'),
			EL_vodLayerList = EL_vodContainer.find('li'),

			EL_vodContainerS = EL_vodLayer.find('div.container.alone'),
			EL_vodTitleS = EL_vodContainerS.find('h1'),
			EL_vodPlayerS = EL_vodContainerS.find('div.player'),

			EL_vodHomeButton = EL_vodLayer.find('a.btn.go'),
			EL_vodCloseButton = EL_vodLayer.find('> a.close'),
			EL_vodHomeButtons = null,
			EL_vodCloseButtons = null,
			EL_vodBlockCheckLabel = null,

			EL_vodOpenedContainer,
			EL_vodOpenedTitle,

			isVideoAutoPlaying = false,

			videoClickedListItem = null,
			videoOpened = false,
			numVideos = EL_videoList.find('a').length,

			currentPage = 0,

			expanded = false,
			expanding = false,
			firstRecruitTabOffed = false,

			autoPlaying = true,
			autoPlayingWhenPlayVideo = true,

			groupNameToImage = (function() {
				var imageRoot = EL_recruitList.find('img:first').attr('src').replace(/[^\/]+$/, '')
					txtMap = [
						['(주)한화/화약', 'tx_hanwhawhayak'],
						['(주)한화/방산', 'tx_hanwhabangsan'],
						['(주)한화/무역', 'tx_hanwhamooyuk'],
						['(주)한화/기계', 'tx_hanwhamechanic'],
						['한화케미칼', 'tx_hanwhachemical'],
						['한화건설', 'tx_hanwhabuild'],
						['한화큐셀코리아', 'tx_hanwhaqcell'],
						['한화첨단소재', 'tx_hanwhahighmaterial'],
						['한화폴리드리머', 'tx_hanwhapolydreamer'],
						['한화에너지', 'tx_hanwhaenergy'],
						['한화생명', 'tx_hanwhalife'],
						['한화손해보험', 'tx_hanwhasensure'],
						['한화투자증권', 'tx_hanwhainveststock'],
						['한화자산운용', 'tx_hanwhaddrive'],
						['한화인베스트먼트', 'tx_hanwhainvestment'],
						['한화저축은행', 'tx_hanwhajbank'],
						['한화호텔&amp;리조트', 'tx_hanwhahotelresort'],
						['한화갤러리아', 'tx_hanwhagalleria'],
						['한화63시티', 'tx_hanwha63city'],
						['한화S&amp;C', 'tx_hanwhasnc'],
						['한화역사', 'tx_hanwhahistory'],
						['한컴', 'tx_hancom'],
						['한화이글스', 'tx_hanwhaeagles'],
						['한화도시개발', 'tx_hanwhacitydev'],
						['한화인', 'tx_hanwhain'],
						['한화', 'tx_hanwha']
					],
					ingoreText = '([^\"\(\)])',
					numMaps = txtMap.length;
				return function(txt) {
					var i = 0, key;
					for (i = 0; i < numMaps; i++) {
						key = txtMap[i][0];
						if (txt.indexOf(key) != -1 && txtMap[i][1]) {
							txt = txt.replace(new RegExp(ingoreText + key.replace(/(\(|\))/g, '\\\$1') + ingoreText, 'g'), '$1<img src="'+ imageRoot+txtMap[i][1] +'.png" alt="'+ key +'"> $2');
						}
					}
					return txt;
				}
			})(),

			useOpacity = jQuery.support.opacity,

			i = 0, numSlides = EL_sliderItems.length;


		for (; i < numSlides; i++) {
			EL_sliderTexts[i].innerHTML = groupNameToImage(EL_sliderTexts[i].innerHTML);
			EL_sliderItems[i] = $(EL_sliderItems[i]);
			EL_sliderPlayButton = EL_sliderItems[i].find('a.vod');
			if (EL_sliderPlayButton.length) {
				if ((/intro$/).test(EL_sliderPlayButton.attr('href'))) {
					EL_sliderPlayButton.attr('data-video-index', 'random')
						.click(playVideo);
				} else {
					EL_sliderPlayButton.click(playOutLinkVideo);
				}
			}
			EL_sliderImages[i] = $(EL_sliderImages[i]);
			EL_sliderTexts[i] = $(EL_sliderTexts[i]);
		}

		EL_moreButton.click(more);
		EL_lessButton.click(less);

		EL_slider.xlider({
			endless: true,
			useTransition: false, // jQuery.browser.mobile,
			paging: EL_sliderPaging,
			arrows: [EL_sliderPrev, EL_sliderNext],
			autoPlay: 5500,
			onChange: function(page) {
				currentPage = page;
			}
		}).click(function() {
			if (expanded) {
				less();
			}
		});

		EL_sliderPlay.click(slidderAutoPlayStart).click();
		EL_sliderPause.click(slidderAutoPlayStop);
		// EL_sliderControls.find('a.play, a.pause').click(function() {
		// 	if (autoPlaying) {
		// 		slidderAutoPlayStop(true);
		// 	} else {
		// 		slidderAutoPlayStart(true);
		// 	}
		// 	return false;
		// });
		EL_sliderControls.clone().css('zIndex', 2).insertBefore(EL_slider).html('')
			.append(EL_sliderPlay).append(EL_sliderPause).append(EL_sliderPrev).append(EL_sliderNext);
		EL_sliderControls = EL_keyvisual.find('div.toggle-type');

		EL_blockList.hide();
		EL_recruitList.find('a').each(makeRecruitHoverEffect).eq(0).mouseenter();
		EL_recruitList = EL_recruitList.not('li:nth-child(4)').find('a').click(recruitTabClick);
		EL_recruit.find('> h2 a').click(function() {
			recruitTabClick.call(null);
			return false;
		});
		firstRecruitTabOffed = false;

		HANWHAIN.resetRecuritTabs = function() {
			recruitTabClick.call(null);
		}

		EL_videoList.find('a').each(function(i) {
			this.setAttribute('data-video-index', i);
		}).click(playVideo);
		EL_vodLayer.detach().show();
		EL_vodLayerList.find('a').each(function(i) {
			this.setAttribute('data-video-index', i);
		}).click(playVideo);
		EL_vodLayer.css('zIndex', 102).click(closeVideo);
		EL_vodHomeButton.click(closeVideo)
			.insertBefore(EL_vodContainer[0].firstChild);
		EL_vodHomeButton.clone(true)
			.appendTo(EL_vodContainer);
		EL_vodHomeButton.addClass('hidden');
		EL_vodHomeButtons = EL_vodContainer.find('a.btn.go');
		EL_vodCloseButton.click(closeVideo)
			.insertBefore(EL_vodLayer[0].firstChild);
		EL_vodCloseButton.clone(true)
			.appendTo(EL_vodLayer);
		EL_vodCloseButton.addClass('hidden');
		EL_vodCloseButtons = EL_vodLayer.find('a.close');

		// EL_vodTitleS.html('제목');
		EL_vodBlockCheckLabel = EL_vodContainer.find('label[for="day-check"]');


		if (!jQuery._cookie.get('donotshowvideolayer') && !jQuery._cookie.get('logoclicked')) {
			EL_vodBlockCheckLabel.click(function(e) {
				e.stopPropagation();
			});
			EL_vodContainer.find('#day-check').fakecheck().change(function() {
				jQuery._cookie.set('donotshowvideolayer', 1, 1, '/');
				EL_vodHomeButton.click();
			});
			playVideo(Math.floor(Math.random()*EL_vodLayerList.length), true);
			isVideoAutoPlaying = true;
		} else {
			EL_vodBlockCheckLabel.remove();
			EL_vodBlockCheckLabel = null;
			jQuery._cookie.set('logoclicked', 0, -1, '/');
			$(window).load(HANWHAIN.gnb.allmenuDisplay);
		}


		function slidderAutoPlayStart(fromClick) {
			autoPlaying = true;
			EL_slider.xlider('toggleAuto', autoPlaying);
			EL_slider.xlider('toggleAuto', autoPlaying);
			EL_sliderPlay.hide();
			EL_sliderPause.show();
			fromClick && EL_sliderPause.focus();
			return false;
		}

		function slidderAutoPlayStop(fromClick) {
			autoPlaying = false;
			EL_slider.xlider('toggleAuto', autoPlaying);
			EL_sliderPlay.show();
			EL_sliderPause.hide();
			fromClick && EL_sliderPlay.focus();
			return false;
		}

		function playVideo(index, donotautoplay) {
			var title;
			if (isNaN(parseInt(index))) {
				index = this.getAttribute('data-video-index');
				index = index == 'random' ? Math.floor(Math.random()*numVideos) : parseInt(index);
			}
			title = EL_vodLayerList.eq(index).find('a em').html();
			EL_vodPlayer.html('<iframe src="'+ HANWHAIN.toEmbedURL(EL_vodLayerList.find('a').eq(index).attr('href'), !donotautoplay) +'" width="100%" height="100%" frameborder="0" scrolling="no" allowFullScreen="yes" title="'+ title +' 영상"></iframe>');
			EL_vodDescription.html(
				EL_vodLayerList.removeClass('on')
					.eq(index)
					.addClass('on')
					.find('p')[0].innerHTML
				);
			EL_vodTitle.html(title);
			afterVideoPlayed(this, EL_vodContainer, EL_vodTitle);
			return false;
		}

		function playOutLinkVideo() {
			EL_vodPlayerS.html('<iframe src="'+ HANWHAIN.toEmbedURL(this.href, true) +'" width="100%" height="100%" frameborder="0" scrolling="no" allowFullScreen="yes" title="영상"></iframe>');
			afterVideoPlayed(this, EL_vodContainerS, EL_vodTitleS);
			return false;
		}

		function afterVideoPlayed(from, EL_container, EL_title) {
			var isIntro = EL_title[0] == EL_vodTitle[0];
			if (!videoOpened) {
				if (from.nodeType) {
					videoClickedListItem = from;
				}
				EL_vodContainer.hide();
				EL_vodContainerS.hide();
				EL_vodOpenedContainer = EL_container.show();
				EL_vodOpenedTitle = EL_title;
				EL_vodHomeButtons[isIntro ? 'show' : 'hide']();
				EL_vodCloseButtons[isIntro ? 'hide' : 'show']();
				HANWHAIN.noScroll.on();
				EL_vodLayer.insertBefore(document.body.firstChild);
				if (isIntro) {
					videoClickedListItem && EL_vodHomeButton.focus();
				} else {
					EL_vodCloseButton.focus();
				}
				autoPlayingWhenPlayVideo = autoPlaying;
				slidderAutoPlayStop();
			}
			videoOpened = true;
			resizeVideo();
		}

		function closeVideo(e) {
			if (this == e.target) {
				EL_vodLayer.detach();
				EL_vodPlayer.html('');
				HANWHAIN.noScroll.off();
				if (videoClickedListItem) {
					$(videoClickedListItem).focus();
					videoClickedListItem = null;
				}
				if (EL_vodBlockCheckLabel) {
					EL_vodBlockCheckLabel.remove();
					EL_vodBlockCheckLabel = null;
				}
				autoPlayingWhenPlayVideo && slidderAutoPlayStart();
				videoOpened = false;
			}
			if (isVideoAutoPlaying) {
				HANWHAIN.gnb.allmenuDisplay();
				isVideoAutoPlaying = false;
			}
			return false;
		}

		function resizeVideo() {
			var titleHeight = EL_vodOpenedTitle[0].offsetHeight,
				paddingSize = Math.max(60, (HANWHAIN.areaHeight-EL_vodOpenedContainer.css('paddingBottom', 0)[0].offsetHeight)/2);
			EL_vodLayer.css({paddingTop: paddingSize-titleHeight/2});//paddingBottom: paddingSize+titleHeight/2});
			EL_vodOpenedContainer.css({paddingBottom: paddingSize+titleHeight/2});
		}

		function more() {
			if (expanding) {
				return false;
			}
			expanding = true;
			if (useOpacity) {
				EL_slider._animate({height: 150}, {queue: false, duration: 1000, delay: 500, easing: 'easeInOutQuart', complete: moreStep2});
				EL_sliderImages[currentPage]._animate({marginTop: -90}, {queue: false, duration: 1000, delay: 500, easing: 'easeInOutQuart'});
				EL_sliderTexts[currentPage]._animate({opacity: 0}, {queue: false, duration: 750, easing: 'easeOutQuad'});
				EL_sliderControls._animate({opacity: 0}, {queue: false, duration: 750, delay: 300, easing: 'easeOutQuad'});
				EL_videoList._animate({opacity: 0}, {queue: false, duration: 750, delay: 300, easing: 'easeOutQuad'});
				EL_recruit._animate({top: -382, opacity: 0}, {queue: false, duration: 1000, delay: 500, easing: 'easeInOutQuart'});
				EL_bottomLinks._animate({opacity: 0}, {queue: false, duration: 750, easing: 'easeInOutQuad'});
				EL_footer._animate({opacity: 0}, {queue: false, duration: 750, delay: 200, easing: 'easeInOutQuad'});
				HANWHAIN.smoothScrollTop(0, 1500);
			} else {
				moreStep2();
				$(window).scrollTop(0);
				expanded = true;
			}
			return false;
		}

		function moreStep2() {
			var listHeight;
			EL_keyvisual.addClass('short');
			EL_recruit.addClass('more');
			EL_blockList.css('height', 'auto').show();
			HANWHAIN.setIframeHeight(EL_blockList.find('iframe')[0]);
			if (useOpacity) {
				EL_sliderImages[currentPage]._stop().css('marginTop', '');
				EL_sliderTexts[currentPage]._animate({opacity: 1}, {queue: false, duration: 1500, easing: 'easeInOutQuad'});
				EL_sliderControls._animate({opacity: 1}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_recruit._stop().css('top', '')._animate({opacity: 1}, {queue: false, duration: 750, delay: 0, easing: 'easeInOutQuad'});
				listHeight = EL_blockList[0].offsetHeight;
				EL_blockList.css({height:0, paddingTop: 100, opacity: 0})
					._animate({height: listHeight, paddingTop: 0, opacity: 1}, {queue: false, duration: 1000, delay: 0, easing: 'easeOutQuart'});
				EL_bottomLinks._animate({opacity: 1}, {queue: false, duration: 750, delay: 700, easing: 'easeInOutQuad'});
				EL_footer._animate({opacity: 1}, {queue: false, duration: 750, delay: 1000, easing: 'easeInOutQuad', complete: moreEnd});
			} else {
				moreEnd();
			}
		}

		function moreEnd() {
			EL_recruit.find('.column-2 input:first').focus();
			EL_blockList.css('height', 'auto');
			expanded = true;
		}

		function less() {
			if (useOpacity) {
				EL_slider._animate({height: 916}, {queue: false, duration: 1000, easing: 'easeInOutQuart'});
				EL_sliderImages[currentPage]._animate({marginTop: 0}, {queue: false, duration: 1000, easing: 'easeInOutQuart'});
				EL_sliderTexts[currentPage]._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_sliderControls._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_recruit._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_blockList._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_bottomLinks._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_footer._animate({opacity: 0}, {queue: false, duration: 650, easing: 'easeInOutQuad', complete: lessStep2});
				HANWHAIN.smoothScrollTop(0, 750);
			} else {
				lessStep2();
				$(window).scrollTop(0);
			}
			expanded = expanding = false;
			return false;
		}

		function lessStep2() {
			EL_keyvisual.removeClass('short');
			EL_recruit.removeClass('more');
			EL_blockList.hide();
			if (useOpacity) {
				EL_sliderTexts[currentPage]._animate({opacity: 1}, {queue: false, duration: 1500, easing: 'easeInOutQuad'});
				EL_sliderControls._animate({opacity: 1}, {queue: false, duration: 650, easing: 'easeInOutQuad'});
				EL_videoList._animate({opacity: 1}, {queue: false, duration: 650, delay: 1000, easing: 'easeInOutQuad'});
				EL_recruit._animate({opacity: 1}, {queue: false, duration: 750, delay: 350, easing: 'easeInOutQuad'});
				EL_bottomLinks._animate({opacity: 1}, {queue: false, duration: 650, delay: 700, easing: 'easeInOutQuad'});
				EL_footer._animate({opacity: 1}, {queue: false, duration: 650, delay: 1000, easing: 'easeInOutQuad', complete: lessEnd});
			} else {
				lessEnd();
			}
			window.closeRecruitList && window.closeRecruitList();
		}

		function lessEnd() {
			EL_moreButton.focus();
		}

		function recruitTabClick() {
			var clicked = this,
				selectedIndex = -1;
			$.each(EL_recruitList, function(i) {
				if (this == clicked && this.className.indexOf('on') == -1) {
					$(this).trigger('set-on').addClass('on');
					selectedIndex = i;
				} else {
					$(this).trigger('unset-on').removeClass('on');
				}
			});
			selectedIndex > -1 && more();
			window.mainRecruitTabChanged && window.mainRecruitTabChanged(selectedIndex+1);
			return false;
		}

		function makeRecruitHoverEffect() {

			var EL_this = $(this),
				EL_firstImage = EL_this.find('img:first'),
				EL_overImage = EL_firstImage.clone(),
				oned = false;

			EL_overImage.attr('src', EL_overImage.attr('src').replace('.png', '_over.png'))
				.css({position: 'absolute'})
				.insertBefore(EL_firstImage);
			EL_this.bind({mouseenter: hover, focus: hover, mouseleave: leave, blur: leave}).mouseleave();

			EL_this.bind('set-on', function() {
				hover();
				oned = true;
			});

			EL_this.bind('unset-on', function() {
				oned = false;
				leave();
			});

			function hover() {
				if (oned) {
					return;
				}
				if (!firstRecruitTabOffed) {
					EL_recruitList.eq(0).mouseleave();
					firstRecruitTabOffed = true;
				}
				if (useOpacity) {
					EL_overImage._animate({opacity: 1}, {queue: false, duration: 200, easing: 'easeInOutQuad'});
				} else {
					EL_overImage.css('visibility', 'visible');
				}
			}

			function leave() {
				if (oned) {
					return;
				}
				if (useOpacity) {
					EL_overImage._animate({opacity: 0}, {queue: false, duration: 100, easing: 'easeInOutQuad'});
				} else {
					EL_overImage.css('visibility', 'hidden');
				}
			}

		}

		return {
			resize: function() {
				videoOpened && resizeVideo();
			}
		}

	},

	history: function() {
		
		var
			blankImageURL = HANWHAIN.imageRoot+'blank.gif',

			EL_header = $('#wrap > header'),
			EL_box = $('section.history'),

			EL_tabBox = EL_box.find('> ul.tabs'),
			EL_tabItems = EL_tabBox.find('li'),
			EL_tabs = EL_tabBox.find('a'),
			EL_contents = [],

			EL_toonButtons = [],
			EL_toon = $([
					'<div id="lay-webtoon" class="lay-webtoon">',
						'<div class="container">',
							'<h1><small>한화인 웹툰</small> <span></span></h1>',
							'<p><img src="', blankImageURL, '" alt="아래 텍스트 참조"></p>',
							'<span class="blind"></span>',
							'<div class="toggle-type">',
								'<a href="#" class="prev">이전 웹툰 보기</a>',
								'<ul></ul>',
								'<a href="#" class="next">다음 웹툰 보기</a>',
							'</div>',
							'<a href="#" class="close">팝업닫기</a>',
						'</div>',
					'</div>'
				].join('')),
			EL_toonTitle = EL_toon.find('h1 span'),
			EL_toonImage = EL_toon.find('p img'),
			EL_toonAltText = EL_toon.find('span.blind'),
			EL_toonList = EL_toon.find('div.toggle-type ul'),
			EL_toonListItems = [],
			EL_toonPrev = EL_toon.find('a.prev'),
			EL_toonNext = EL_toon.find('a.next'),
			EL_toonClose = EL_toon.find('a.close'),
			EL_toonOpener = null,
			EL_toonDescriptions = $('#toon-descriptions'),

			toonTitles = [
				'<strong>다이너마이트</strong> 사나이',
				'<strong>불꽃의</strong> 길',
				'<strong>화염의</strong> 이리',
				'<strong>불꽃을</strong> 믿어라',
				'어둠 속 <strong>태양</strong>',
				'한강의 <strong>황금 불꽃</strong>',
				'다시 타오르는 <strong>불꽃</strong>'
			],

			supportOpacity = jQuery.support.opacity,

			numToons = 0,
			toonIndex = 0,
			toonOpened = false,

			currentTab = 0,
			tabBoxHeight = EL_tabBox[0].offsetHeight,
			fixed = false,

			i = 0, j = 0, numItems = EL_tabs.length;


		$(document.body).bind('header-moving', setTabTop);

		for (; i < numItems; i++) {
			EL_tabItems[i] = $(EL_tabItems[i]);
			EL_tabs[i] = $(EL_tabs[i])
				.attr('data-index', i)
				.click(tabClick);
			EL_contents[i] = $(EL_tabs[i].attr('href'));
			EL_contents[i].find('.webtoon a').each(function() {
				EL_toonButtons.push($(this).attr('data-index', j++).click(toonShow));
			})
		}

		EL_toon.click(function(e) {
			if (e.target == EL_toon[0]) {
				toonClose();
			}
		});
		for (i = 0, numToons = EL_toonButtons.length; i < numToons; i++) {
			EL_toonListItems[i] = $('<li />').append(EL_toonButtons[i].clone(true).addClass('no'+(i+1))).appendTo(EL_toonList);
		}
		EL_toonPrev.click(function() {
			EL_toonListItems[toonIndex-1].find('a').click();
			return false;
		});
		EL_toon.appendTo(document.body); // for check size
		EL_toonNext.css('right', '+='+HANWHAIN.scrollBarWidth)
			.click(function() {
				EL_toonListItems[toonIndex+1].find('a').click();
				return false;
			});
		EL_toonClose.css('right', '+='+HANWHAIN.scrollBarWidth)
			.bind('click', toonClose)
			.clone(true).appendTo(EL_toon);
		EL_toonClose.insertBefore(EL_toon[0].firstChild);
		EL_toon.detach(); // for check size


		function tabClick() {
			var index = parseInt(this.getAttribute('data-index'));
			if (supportOpacity) {
				EL_tabBox._animate({opacity: 0}, {queue: false, duration: 350, complete: function() {
					EL_tabBox._animate({opacity: 1}, {queue: false, duration: 500, delay: 650});
				}});
			}
			// HANWHAIN[jQuery.browser.ie ? 'setScrollTop' : 'smoothScrollTop'](EL_contents[index][0].offsetTop-48-tabBoxHeight);
			HANWHAIN[supportOpacity ? 'smoothScrollTop' : 'setScrollTop'](EL_contents[index][0].offsetTop-(currentTab > index ? 126 : 47)-tabBoxHeight);
			return false;
		}

		function toonShow() {
			var webtoonURL = this.href;
			toonIndex = parseInt(this.getAttribute('data-index'));
			if (toonIndex > 6) { // ready block
				alert('웹툰 준비 중입니다.');
				return false;
			}
			if (!toonOpened) {
				EL_toonOpener = $(this);
				EL_toon.appendTo(document.body);
				EL_toonClose.focus();
				HANWHAIN.noScroll.on();
				toonOpened = true;
			}
			EL_toonTitle.html(toonTitles[toonIndex]);
			EL_toonImage.attr('src', blankImageURL);
			setTimeout(function() {
				EL_toonImage.attr('src', webtoonURL);
				EL_toon[0].scrollTop = 0;
			}, 10);
			// add description
			EL_toonAltText.html(EL_toonDescriptions.find('li:nth-child('+ (toonIndex+1) +')').html());
			toonSetButtons();
			return false;
		}

		function toonClose() {
			EL_toon.detach();
			if (EL_toonOpener) {
				EL_toonOpener.focus();
				EL_toonOpener = null;
			}
			HANWHAIN.noScroll.off();
			toonOpened = false;
			return false;
		}

		function toonSetButtons() {
			EL_toonPrev.hide(); // ready block
			EL_toonNext.hide(); // ready block
			// EL_toonPrev[!toonIndex ? 'hide' : 'show']();
			// EL_toonNext[toonIndex >= numToons-1 ? 'hide' : 'show']();
			for (i = 0, numToons = EL_toonButtons.length; i < numToons; i++) {
				EL_toonListItems[i].decideClass('on', i == toonIndex);
			}
		}

		function setTabTop() {
			// var headerHeight = 126 + EL_header[0].getBoundingClientRect().top, // 126 = depth 2 height
			var headerHeight = 126 + EL_header[0].offsetTop, // 126 = depth 2 height
				boxTop = EL_box[0].offsetTop,
				scrollTop = HANWHAIN.scrollTop;
			if (!fixed && scrollTop+headerHeight > boxTop) {
				fixed = true;
			} else if (fixed && boxTop >= scrollTop+headerHeight) {
				fixed = false;
			}
			if (fixed) {
				EL_tabBox.css('top', scrollTop+headerHeight-boxTop);
			} else {
				EL_tabBox.css('top', '');
			}
		}

		function scroll(v, maxv) {
			var i = 0, index = 0;
			for (; i < numItems; i++) {
				if (EL_contents[i][0].getBoundingClientRect().top > HANWHAIN.areaHeight/3) {
					break;
				}
			}
			currentTab = Math.max(0, i-1);
			for (i = 0; i < numItems; i++) {
				EL_tabItems[i].decideClass('on', i == currentTab);
			}
			setTabTop();
		}


		function resize() {
			//
		}

		return {
			scroll: scroll,
			resize: resize
		}
	},

	layer: (function() {

		var
			EL_doc = $(document.documentElement),
			EL_body,
			EL_wrapper = $('<div class="layer-wrap" />'),
			EL_inside = $([
				'<div class="layer-inside">',
					'<p class="close"><button type="button">닫기</button></p>',
					'<div class="iframe-wrap"><iframe src="about:blank" width="100%" height="0" frameborder="0" scrolling="no" allowTransparency="true"></iframe></div>',
					'<p class="close"><button type="button">닫기</button></p>',
				'</div>'
				].join('')).appendTo(EL_wrapper),
			EL_iframe = EL_inside.find('iframe'),
			EL_dimmed = $('<div class="layer-dimmed" />'),
			EL_from,
			EL_firstCloseButton,

			layerType = '',

			opened = false,
			defaultWidth = 625,
			topMargin = 50;


		EL_wrapper.click(function(e) {
			if (this == e.currentTarget) {
				close();
			}
		});
		EL_firstCloseButton = EL_inside.find('.close button').click(close).eq(0);
		EL_iframe.load(setIframeHeight);


		function open(_url, width, type) {

			var url;

			HANWHAIN.gnb.wait && HANWHAIN.gnb.wait(true);

			if (!EL_body) {
				EL_body = $(document.body);
				// HANWHAIN.setOverflowYEdges(EL_wrapper);
			}

			if (typeof(_url) == 'string') {
				url = _url;
			} else if (_url.nodeType) {
				url = _url.href;
				EL_from = $(_url);
			}
			if (!url) {
				return;
			}

			EL_iframe.attr('src', url);

			layerType = type;
			if (layerType) {
				EL_dimmed.addClass(layerType);
				EL_wrapper.addClass(layerType);
			}

			EL_inside.css('width', width || defaultWidth);
			EL_dimmed.appendTo(EL_body);
			EL_wrapper.removeClass('show').appendTo(EL_body);

			EL_firstCloseButton.focus();
			// EL_wrapper.scrollTop(0);

			HANWHAIN.gnb.closeAlimLayer();
			HANWHAIN.noScroll.on();

			opened = true;

			return false;

		}

		function close() {
			EL_dimmed.detach();
			EL_wrapper.detach();
			if (layerType) {
				EL_dimmed.removeClass(layerType);
				EL_wrapper.removeClass(layerType);
			}
			EL_iframe.attr({'src': 'about:blank', 'height': '0'});
			EL_from && EL_from.focus();
			EL_from = null;
			HANWHAIN.gnb.wait(false);
			HANWHAIN.noScroll.off();
		}

		function setIframeHeight() {
			HANWHAIN.setIframeHeight(EL_iframe);
			EL_wrapper.addClass('show');
			resize();
		}

		function resize() {
			if (opened) {
				EL_wrapper.css({paddingTop: Math.max(0, (EL_dimmed[0].offsetHeight-EL_inside[0].offsetHeight)/2)});
			}
		}

		$(window).resize(resize);

		return {
			open: open,
			close: close,
			resize: resize
		}

	})(),

	setTipArea: function(EL_box) {

		var
			EL_documentElement = $(document.documentElement),
			EL_body = $(document.body),
			EL_header = $('#wrap > header'),
			EL_sectionTable = $('section.apply .tbl-type td input, section.apply .tbl-type td .select-title, section.apply .tbl-type td select'),
			EL_section = $('section.apply'),
			EL_btnArea = EL_section.find('div.btn-area.line'),
			EL_saveMent = EL_btnArea.prev('p.bottom'),
			EL_button = EL_box.find('> a.tip'),
			EL_disabler = $('<span class="tip" />'),
			EL_layer = EL_box.find('div.lay-tip'),
			EL_floating = EL_layer.find('div.floating'),
			EL_tips = EL_layer.find('dl'),
			EL_close = EL_layer.find('a.close'),
			EL_holder = $('<div class="holder" />'),
			EL_oneToOne = EL_floating.find('> ul'),

			EL_selectLastEdu = EL_section.find('select[name="lstSchsTp"]'),

			EL_prevTip,
			EL_currentTip,

			defaultWidth = 786,
			wideWidth = 1008,
			tipMaxHeight = 0,

			currentGroup = null,
			opened = false,
			buttonAdded = true,
			buttonEnabled = false,

			sectionPaddingTop = parseInt(EL_section.css('paddingTop')),

			useOpacity = jQuery.support.opacity,

			i = 0, numTips = EL_tips.length;


		if (!EL_button.length || !EL_layer.length || !numTips) {
			return;
		}

		if (EL_selectLastEdu.length) {
			EL_selectLastEdu.change(function() {
				setTimeout(setSectionHeightForTip, 0);
			});
		} else {
			EL_selectLastEdu = null;
		}

		// EL_body.bind('header-moving', peaceWithHeader);
		EL_body.bind('header-moving', setTop);

		for (; i < numTips; i++) {
			EL_tips[i] = $(EL_tips[i]).hide();
			if (useOpacity) {
				EL_tips[i].css('opacity', 0);
			}
			// set content for blind people
			$('[data-tip-id="'+ EL_tips[i][0].id +'"] + p').html(EL_tips[i].text());
		}
		EL_currentTip = EL_tips[0];

		EL_section.addClass('wide'); // can't get size's without 'wide' class...
		EL_holder.css('paddingTop', parseInt(EL_tips[0].css('marginBottom')))
			.insertBefore(EL_floating.children()[0]);
		EL_section.removeClass('wide');

		EL_section.on('focus', 'input, textarea', findGroup);
		EL_section.on('click', 'input[type="radio"], input[type="checkbox"]', findGroup);
		EL_section.on('focus click', 'select', findGroup);
		showTip();
/*
		EL_section.one('click',function(){
			showTip();
		});
*/
		EL_close.click(hideTip);
		EL_button.click(showTip);//.click();
		if (useOpacity) {
			// EL_button.css({right: -35}).show();
		}
		EL_disabler.css('backgroundColor', '#fff');
		EL_disabler.appendTo(EL_button.parent()).css('right', -35).show();
		$(window).load(function() {
			if (useOpacity) {
				EL_disabler._animate({right: 0}, {queue: false, duration: 350, delay: 100, easing: 'easeOutCubic', complete: function() {
					EL_button.show();
				}});
			} else {
				EL_button.show();
				EL_disabler.css('right', '');
			}

			// if in latest education step, check max height for section min-height.
			if (EL_selectLastEdu) {
				EL_section.addClass('wide');
				EL_layer.show();
				for (i = 0; i < numTips; i++) {
					EL_tips[i].show();
					tipMaxHeight = Math.max(tipMaxHeight, EL_floating[0].offsetHeight+EL_tips[i][0].offsetHeight);
					EL_tips[i].hide();
				}
				//EL_layer.hide();
				EL_section.removeClass('wide');
				setSectionHeightForTip();
			}
		});


		function setSectionHeightForTip() {
			if (!tipMaxHeight) {
				return;
			}
			EL_saveMent.css('paddingTop', '');
			// console.log(tipMaxHeight, EL_section[0].offsetHeight, EL_btnArea[0].offsetHeight)
			// console.log(tipMaxHeight-(EL_section[0].offsetHeight-EL_btnArea[0].offsetHeight));
			EL_saveMent.css('paddingTop', tipMaxHeight-(EL_section[0].offsetHeight-EL_btnArea[0].offsetHeight)+10);
			HANWHAIN.scroll();
		}

		function setInputs() {
			// EL_section.find('input, textarea').unbind('focus', findGroup).bind('focus', findGroup);
			// EL_section.find('input[type="radio"], input[type="checkbox"]').unbind('click', findGroup).bind('click', findGroup);
			// EL_section.find('select').unbind('focus click', findGroup).bind('focus click', findGroup);
		}

		function showTip() {

			EL_section.addClass('wide'); // can't get size's without 'wide' class.....
			EL_layer.css('visibility', 'hidden').show();
			EL_currentTip.show();
			if (useOpacity) {
				EL_currentTip.css('opacity', 1);
			}

			opened = true;

			setSize(true);

			if (useOpacity) {
				EL_section.css('width', defaultWidth)._animate({width: wideWidth}, {queue: false, duration: 500, easing: 'easeInOutQuart', complete: onShowTip});
				hideButton();
			} else {
				EL_layer.css('visibility', 'visible');
				hideButton();
			}

			EL_documentElement.trigger('click'); // for fake form
			return false;
		}

		function onShowTip() {
			EL_layer.css('visibility', 'visible');
			EL_layer.css('opacity', 0)._animate({opacity: 1}, {queue: false, duration: 500, easing: 'easeOutQuad'});
		}

		function hideTip() {
			opened = false;
			if (useOpacity) {
				EL_layer._animate({opacity: 0}, {queue: false, duration: 350, easing: 'easeOutQuad', complete: onHideTip});
			} else {
				EL_layer.hide();
				EL_section.removeClass('wide');
				/*EL_currentTip && */showButton();
			}
			EL_documentElement.trigger('click'); // for fake form
			return false;
		}

		function onHideTip() {
			EL_section._animate({width: defaultWidth}, {queue: false, duration: 350, easing: 'easeOutCubic', complete: onHideTipEnd});
			/*EL_currentTip && */showButton();
		}

		function onHideTipEnd() {
			EL_layer.css('visibility', 'hidden').hide();
			EL_section.removeClass('wide');
		}

		function showButton() {
			if (!buttonAdded && !opened) {
				if (useOpacity) {
					EL_button._animate({right: 0}, {queue: false, duration: 250, step: haulDisabler, easing: 'easeOutCubic'});
				} else {
					EL_button.css('right', 0);
					haulDisabler({right: 0});
				}
				buttonAdded = true;
			}
		}

		function hideButton() {
			if (buttonAdded) {
				if (useOpacity) {
					EL_button._animate({right: -35}, {queue: false, duration: 250, step: haulDisabler, easing: 'easeOutCubic'});
				} else {
					EL_button.css('right', -35);
					haulDisabler({right: -35});
				}
				buttonAdded = false;
			}
		}

		function enableButton() {
			if (!buttonEnabled) {
				EL_disabler.stop();
				if (useOpacity && !opened) {
					EL_disabler.animate({opacity: 0}, {queue: false, duration: 100, easing: 'easeInOutQuad', complete: function() {
						EL_disabler.hide();
					}});
				} else {
					EL_disabler.hide();
				}
				buttonEnabled = true;
			}
		}

		function disableButton() {
			if (buttonEnabled) {
				EL_disabler.stop().show();
				if (useOpacity && !opened) {
					EL_disabler.animate({opacity: 1}, {queue: false, duration: 100, easing: 'easeInOutQuad'});
				} else {
					EL_disabler.css('opacity', 1);
				}
				buttonEnabled = false;
			}
		}

		function haulDisabler(v) {
			EL_disabler[0].style.right = v.right +'px';
		}

		function changeGroup(group) {
			EL_prevTip = EL_currentTip;
			EL_prevTip && EL_prevTip.hide();
			EL_currentTip = $('#'+ group, EL_layer);
			if (!EL_currentTip.length) {
				EL_currentTip = null;
			}
			EL_oneToOne.decideClass('alone', !EL_currentTip);
			if (opened) {
				if (useOpacity) {
					EL_prevTip && EL_prevTip._animate({opacity: 0}, {queue: false, duration: 750, easing: 'easeOutQuad', complete: HANWHAIN.noneMe});
					EL_currentTip && EL_currentTip.css('opacity', 0).show()._animate({opacity: 1}, {queue: false, duration: 750, easing: 'easeOutQuad'});
				} else {
					EL_currentTip && EL_currentTip.show();
				}
				setSize();
			}
			if (EL_currentTip) {
				// showButton();
				enableButton();
			} else {
				// hideButton();
				disableButton();
			}
			currentGroup = group;
		}

		function setSize(noAni) {
			var prevHeight = parseInt(EL_holder.css('height')),
				prevMargin = parseInt(EL_holder.css('marginBottom')),
				propertyTo = {
					height: EL_currentTip ? EL_currentTip[0].offsetHeight : 0,
					marginBottom: EL_currentTip ? 0 : -parseInt(EL_holder.css('paddingTop'))
				};
			EL_holder.css(propertyTo);
			setTop(noAni);
			if (useOpacity && !noAni) {
				EL_holder.css({height: prevHeight, marginBottom: prevMargin})._animate(propertyTo, {queue: false, duration: 500, easing: 'easeOutCubic'});
			}
		}

		function setTop(noAni) {

			if (!opened) {
				return;
			}

			var headerHeight = 126 + EL_header[0].getBoundingClientRect().top, // 126 = depth 2 height
				sectionTop = EL_section[0].offsetTop-HANWHAIN.scrollTop, // EL_section[0].getBoundingClientRect().top,
				sectionHeight = EL_section[0].offsetHeight,
				floatingHeight = EL_floating[0].offsetHeight,
				overSize = Math.max(0, Math.min(headerHeight, headerHeight-sectionTop)),
				top = Math.round(Math.max((HANWHAIN.areaHeight-floatingHeight)/2, Math.max(sectionTop, 0)+38, headerHeight+38));

			top = Math.min(top, sectionTop+sectionHeight-floatingHeight-89);

			if (useOpacity && !noAni) {
				EL_floating._animate({top: top}, {queue: false, duration: 500, easing: 'easeOutCubic'});
			} else {
				EL_floating.css('top', top);
			}

		}

		function findGroup() {
			var title = this,
				regRoot = /^(section|body)$/i,
				regH4 = /^h4$/i,
				group;
			while (!regRoot.test(title.parentNode.nodeName)) { // to root
				title = title.parentNode;
				if (title.parentNode.getElementsByTagName('h4').length) {
					break;
				}
			}
			while (title && !regH4.test(title.nodeName)) { // find title
				title = title.previousSibling;
			}
			group = (!title || !regH4.test(title.nodeName)) ? null : title.getAttribute('data-tip-id');
			if (group != currentGroup) {
				changeGroup(group);
			}
		}

		function scroll(v, maxv) {
			setSize(true);
		}

		HANWHAIN.scrollFunctions.push(scroll);

		// return setInputs;

	},

	footer: function() {

		var
			EL_wrap = $('#wrap'),
			EL_footer = EL_wrap.find('> footer'),
			EL_family = $('#lay-family'),
			EL_familyDimmed = $('<div id="lay-family-dimmed" />'),
			EL_familyButton = $('footer ul.share li a.family'),
			familyHeight = 0,
			supportOpacity = $.support.opacity,
			familyOpened = false;

		if (!EL_family.length) {
			return;
		}

		familyHeight = EL_family.show().children()[0].offsetHeight,

		EL_family.hide();
		EL_familyDimmed.click(toggle);
		EL_familyButton.click(toggle);

		function toggle() {
			if (!familyOpened) {
				EL_familyButton.addClass('close');
				EL_familyDimmed.css('height', EL_footer[0].offsetTop).appendTo(EL_wrap);
				if (supportOpacity) {
					EL_family.show()._animate({height: familyHeight}, {queue: false, duration: 350, easing: 'easeOutCubic'});
					EL_familyDimmed.css('opacity', 0).show()._animate({opacity: 1}, {queue: false, duration: 150, easing: 'easeOutCubic'});
				} else {
					EL_family.show().css('height', familyHeight);
				}
				familyOpened = true;
			} else {
				EL_familyButton.removeClass('close');
				EL_family.stop().hide().css('height', 0);
				EL_familyDimmed.detach();
				familyOpened = false;
			}
			return false;
		}

	},


	setOverflowYEdges: function(EL_target) {

		var pointYAtStart, getPoint = jQuery._event.getpoint;

		EL_target.bind('touchstart', function(e) {
			pointYAtStart = HANWHAIN.getEventPoint(e)[1];
		});

		EL_target.bind('touchmove', function(e) {
			var pointY = HANWHAIN.getEventPoint(e)[1];
			if (
				( this.scrollTop === 0 && pointY > pointYAtStart ) ||
				( this.scrollTop >= this.scrollHeight-this.offsetHeight && pointYAtStart > pointY )
			) {
				e.preventDefault();
				return false;
			}
			e.stopPropagation();
			return true;
		});

	},

	noScroll: (function() {
		var EL_documentElement, EL_header, EL_gnbSub,
			scrollBarWidth,
			activated = false;
		return {
			on: function() {
				if (!EL_header) {
					EL_documentElement = $(document.documentElement);
					EL_header = $('#wrap > header').first();
					EL_gnbSub = $('#gnb div.sub ul');
					scrollBarWidth = HANWHAIN.scrollBarWidth;
				}
				HANWHAIN.scrollFixSkip = true;
				HANWHAIN.gnb.hold();
				EL_documentElement.addClass('noScroll').css('paddingRight', scrollBarWidth);
				EL_gnbSub.css('paddingRight', scrollBarWidth);
				activated = true;
				HANWHAIN.noScroll.resize();
			},
			off: function() {
				activated = false;
				HANWHAIN.scrollFixSkip = false;
				EL_documentElement.removeClass('noScroll').css('paddingRight', '');
				EL_header.css('width', '');
				EL_gnbSub.css('paddingRight', '');
				HANWHAIN.gnb.release();
			},
			resize: function() {
				activated && EL_header.css('width', EL_documentElement[0].offsetWidth-scrollBarWidth);
			}
		}
	})(),

	bigDots: (function() {

		if (!jQuery.support.canvas) {
			return {add: jQuery.noop, resize: jQuery.noop};
		}

		var resizeFunctions = [];

		function add(area, numdots, maxopacity) {

			var
				canvas = document.createElement('canvas'),
				ctx = canvas.getContext('2d'),
				boxwidth = 0, boxheight = 0,
				bgcolor = '#f5f5f5', //'rgba(245, 245, 245, 0.35)',
				dots = [],
				maxradius = Math.min(area.offsetHeight, 250),
				rgb, i = 0;//, numdots = 30;

			area.insertBefore(canvas, area.firstChild);
			resize();
			for (; i < numdots; i++) {
				rgb = Math.round(Math.random()*20+235);
				dots[i] = createdot(true);
			}
			draw();
			resizeFunctions.push(resize);

			function createdot(twins) {
				var x = Math.random(),
					y = Math.random(),
					tox = (Math.random()*20)/100,
					toy = (Math.random()*20)/100;
				return {
					size: (Math.random()*maxradius+10)/2,
					tox: Math.random() > 0.5 ? x+tox : x-tox,
					toy: Math.random() > 0.5 ? y+toy : y-toy,
					x: x,
					y: y,
					maxopacity: (Math.random()*(maxopacity/2)*10)/10+(maxopacity/2),
					totalsteps: (Math.random()*10+6)*60, // 60 = fps
					step: -Math.round(Math.random()*60),
					twins: twins
				};
			}

			function draw() {

				var i = 0, dot, opacity, size;

				ctx.fillStyle = bgcolor;
				// ctx.fillRect(0, 0, boxwidth, boxheight);
				ctx.clearRect(0, 0, boxwidth, boxheight);

				for (; i < numdots; i++) {
					dot = dots[i];
					if (dot.step > 0) {
						size = dots[i].size;
						opacity = dot.maxopacity;
						if (dot.twins && dot.totalsteps*0.125 > dot.step) {
							size = (size*0.95)+(size*0.05)*(dot.step/(dot.totalsteps*0.125));
							opacity *= dot.step/(dot.totalsteps*0.125);
						} else if (!dot.twins && dot.totalsteps*0.33 > dot.step) {
							size = (size*0.95)+(size*0.05)*(dot.step/(dot.totalsteps*0.33));
							opacity *= dot.step/(dot.totalsteps*0.33);
						} else if (dot.step > dot.totalsteps*0.67) {
							opacity *= (dot.totalsteps-dot.step)/(dot.totalsteps-dot.totalsteps*0.67);
						}
						ctx.fillStyle = 'rgba(255, 255, 255, '+ opacity +')';
						ctx.beginPath();
						ctx.arc(
							boxwidth*(dot.x+(dot.tox-dot.x)*(dot.step/dot.totalsteps)),
							boxheight*(dot.y+(dot.toy-dot.y)*(dot.step/dot.totalsteps)),
							size,
						0, Math.PI*2);
						ctx.fill();
					}
					dot.step++;
					if (dot.step > dot.totalsteps) {
						dots.splice(i, 1, createdot());
					}
				}

				requestAnimationFrame(draw);

			}

			function resize() {
				canvas.width = boxwidth = area.offsetWidth;
				canvas.height = boxheight = area.offsetHeight;
			}

		}

		return {
			add: add,
			resize: function() {
				jQuery.each(resizeFunctions, function() {
					this();
				});
			}
		}

	})(),

	effects: {
		layerShow: function(EL_layer, noAni) {
			if ($.support.opacity && !noAni) {
				EL_layer.slideDown({queue: false, duration: 350, easing: 'easeOutCubic', step: function(v, a) {
					EL_layer.css('opacity', a.now/a.end);
				}});
			} else {
				EL_layer.show();
			}
		},
		layerHide: function(EL_layer) {
			if ($.support.opacity) {
				EL_layer.slideUp({queue: false, duration: 250, easing: 'easeOutCubic', step: function(v, a) {
					EL_layer.css('opacity', a.now/a.start);
				}});
			} else {
				EL_layer.hide();
			}
		}
	},

	toEmbedURL: function(url, autoPlay) {
		if ((/youtu\.?be/i).test(url)) {
			return url.replace('watch?v=', 'embed/') + '?autohide=1&showinfo=0&rel=0&wmode=window&enablejsapi=1&version=3'+ (autoPlay ? '&autoplay=1' : '');
		}
		return '';
	},

	noneMe: function() {
		this.style.display = 'none';
	},

	removeMe: function() {
		this.parentNode && this.parentNode.removeChild(this);
	},

	popup: function(url, width, height) {
		window.open(url, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,width='+ (width+HANWHAIN.scrollBarWidth) +',height='+ height);
	},

	setIframeHeight: function(iframe) {
		var EL_iframe = $(iframe),
			EL_parentWrap, height;
		try {
			if ((/^iframe/).test(EL_iframe[0].parentNode.id || EL_iframe[0].parentNode.className)) {
				EL_parentWrap = $(EL_iframe[0].parentNode);
			}
			EL_iframe.css('height', 'auto');
			height = EL_iframe[0].contentWindow.document.body.scrollHeight;
			EL_iframe.css({height: height, visibility: 'visible'});
			// EL_iframe.css({opacity: 0})._animate({opacity: 1}, {queue: false, duration: 250, delay: 100, easing: 'easeOutQuad'});
			EL_parentWrap && EL_parentWrap.css('height', height);
		} catch(e) {}
	},

	setInputClear: function(EL_input) {
		var EL_clear = EL_input.next('a.refresh, a.close');
		if (EL_clear.length) {
			EL_clear.click(function() {
				EL_input.val('').keyup();
				return false;
			}).css('visibility', 'hidden');
			EL_input.keyup(function() {
				EL_clear.css('visibility', this.value ? 'visible' : 'hidden');
			}).keyup();
		}
	},

	// referrence: http://www.html5canvastutorials.com/advanced/html5-canvas-grayscale-image-colors-tutorial/
	createGrayScaleImage: (function() {

		function create(image, format) {

			var canvas = document.createElement('canvas'),
				context = canvas.getContext('2d'),
				imageData, data, i, numDatas, grayScaleImage;

			canvas.width = image.width;
			canvas.height = image.height;
			context.drawImage(image, 0, 0);
			for (imageData = context.getImageData(0, 0, image.width, image.height),
				data = imageData.data, i = 0, numDatas = data.length; i < numDatas; i += 4) {
				data[i] = data[i+1] = data[i+2] = 0.34*data[i] + 0.5*data[i+1] + 0.16*data[i+2];
			}
			context.putImageData(imageData, 0, 0);

			grayScaleImage = new Image();
			grayScaleImage.src = canvas.toDataURL(format == 'jpg' ? 'image/jpeg' : '', 1);

			return grayScaleImage;

		}

		return function(src, onCreate, format) {
			var image = new Image();
			image.src = src;
			image.onload = function() {
				onCreate(create(this, format));
			}
		}

	})(),

	makeExpandableInput: function() {

		var	EL_parent = $(this.parentNode),
			EL_input = $(this),
			EL_wrap = $('<span class="expandable-wrap" />'),
			EL_line = $('<span class="fake-line" />'),
			minWidth = EL_input[0].offsetWidth,
			propertiesToCopy = ['fontFamily', 'fontSize', 'paddingLeft', 'paddingRight']
			ie = jQuery.browser.ie;

		EL_wrap.insertBefore(EL_input);
		EL_input.appendTo(EL_wrap);
		jQuery.each(propertiesToCopy, function() {
			EL_line.css(this, EL_input.css(this));
		});
		EL_line.css('minWidth', minWidth).appendTo(EL_wrap);

		if (ie && 10 > ie) {
			EL_input.bind(9 == ie ? 'input keyup' : 'propertychange', reset);
		} else {
			EL_input.bind('input', reset);
		}
		EL_input.bind({
			focus: function() {
				EL_wrap.addClass('focus');
			},
			blur: function() {
				EL_wrap.removeClass('focus');
			}
		});
		reset.call(EL_input[0]);

		function reset() {
			EL_line[0].innerHTML = this.value.replace(/ /g, '&nbsp');
		}

	},

	checkInputExist: function() {
		var EL_input = $(this),
			focusWidth = parseInt(EL_input.css('width'))+parseInt(EL_input.css('paddingLeft'));
		EL_input.keyup(check);
		check();
		function check() {
			EL_input.decideClass('exist', EL_input[0].value);
			EL_input.css('width', EL_input[0].value ? focusWidth : '');
		}
	},

	checkInputOnlyExist: function() {
		var EL_input = $(this);
		EL_input.keyup(check);
		check();
		function check() {
			EL_input.decideClass('exist', EL_input[0].value);
		}
	},

	checkSelectExist: function() {
		var EL_select = $(this);
		EL_select.change(check);
		check();
		function check() {
			EL_select.decideClass('exist', EL_select[0][EL_select[0].selectedIndex].getAttribute('value'));
		}
	},

	makeTab: function(EL_tabParents, overaction) {
		var EL_tabs = EL_tabParents.find('a:first'),
			EL_contents = [],
			i = 0, numTabs = EL_tabs.length;
		for (; i < numTabs; i++) {
			EL_tabParents[i] = $(EL_tabParents[i]);
			EL_tabs[i] = $(EL_tabs[i]).attr('data-index', i).bind(overaction ? 'mouseenter focus' : 'click', change);
			EL_contents[i] = $(EL_tabs[i].attr('href'));
		}
		EL_tabs[0][overaction ? 'mouseenter' : 'click']();
		function change() {
			var index = parseInt(this.getAttribute('data-index'));
			for (i = 0; i < numTabs; i++) {
				EL_tabParents[i].decideClass('on', i == index);
				EL_tabs[i].attr('title', i == index ? '현재 탭' : '');
				EL_contents[i].length && EL_contents[i][i == index ? 'show' : 'hide']();
			}
			return false;
		}
	},

	makeFaqList: function() {
		var EL_box = $(this),
			EL_items = EL_box.find('ul li'),
			i = 0, numItems = EL_items.length;
		for (; i < numItems; i++) {
			EL_items[i] = $(EL_items[i]).attr('data-index', i).click(toggle);
		}
		toggle(-1);
		function toggle(index) {
			var index = index === -1 ? -1 : parseInt(this.getAttribute('data-index'));
			for (i = 0; i < numItems; i++) {
				EL_items[i].attr('class', i == index && !EL_items[i].hasClass('on') ? 'on' : 'off');
			}
			return false;
		}
	},

	makeToggler: function(EL_button, openText, closeText) {
		var EL_target = $(EL_button.attr('href')),
			opened = false;
		EL_button.click(function() {
			if (opened) {
				EL_button.removeClass('close').attr('title', '레이어열림').html(openText);
				EL_target.length && EL_target.hide();
				opened = false;
			} else {
				EL_button.addClass('close').attr('title', '레이어닫힘').html(closeText);
				EL_target.length && EL_target.show();
				opened = true;
			}
			return false;
		});
	},

	makePager: function(EL_box, selector, numDisplay) {

		var EL_box = $(EL_box),
			EL_arrow = EL_box.find('> .arrow'),
			EL_page = EL_arrow.find('span'),
			EL_prev = EL_arrow.find('a.prev'),
			EL_next = EL_arrow.find('a.next'),
			EL_items,
			nowPage = 0, totalPage,
			numItems;


		EL_box.bind('reset', reset);
		EL_prev.click(function() {
			change(nowPage-1);
			return false;
		});
		EL_next.click(function() {
			change(nowPage+1);
			return false;
		});
		reset();

		function change(page) {
			var newPage = Math.max(0, Math.min(totalPage-1, page));
			if (nowPage != newPage) {
				nowPage = newPage;
				reset();
			}
		}

		function reset() {

			var i = 0, from, to;

			EL_items = EL_box.find(selector);
			numItems = EL_items.length;

			totalPage = Math.ceil(numItems/numDisplay);
			nowPage = Math.max(0, Math.min(totalPage-1, nowPage));

			EL_box.data('numItems', numItems);

			if (numItems > numDisplay) {
				EL_arrow.show();
				EL_page.html((nowPage+1) +'/'+ totalPage);
			} else {
				EL_arrow.hide();
			}

			for (from = numDisplay*nowPage, to = from+numDisplay; i < numItems; i++) {
				$(EL_items[i])[i >= from && to > i ? 'show' : 'hide']()
					[i == from ? 'addClass' : 'removeClass']('first-child');
			}

		}

	},

	createPaging: function(EL_paging, length) {
		for (var html = [], i = 0; i < length; i++) {
			html.push('<li><a href="#">'+ (i+1) +'</a></li>');
		}
		EL_paging.html(html.join(''));
	},

	clearPlaceHolderValues: function() {
		$('input[placeholder]').each(function() {
			if (!$.trim($(this).val()) || $(this).val() == $(this).attr('placeholder')) {
				$(this).val('');
			}
		});
	},

	returnFalse: function() {
		return false;
	},

	getScrollLeft: function() {
		return document.documentElement.scrollLeft || document.body.scrollLeft || 0;
	},

	getScrollTop: function() {
		return document.documentElement.scrollTop || document.body.scrollTop || 0;
	},

	setScrollTop: function(v) {
		$(window).scrollTop(v);
		// document.body.scrollTop = v;
	},

	getScrollHeight: function() {
		// return document.body.scrollHeight;
		return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
	},

	getMaxScrollTop: function() {
		return HANWHAIN.getScrollHeight()-HANWHAIN.areaHeight;
	},

	smoothScrollTop: function(v, time, callback) {
		$('html, body')._animate({scrollTop: v}, {queue: false, duration: time || 1000, easing: 'easeInOutQuart', complete: callback});
	},

	getScrollBarWidth: function() {
		var div = document.createElement('div'), scrollBarWidth;
		div.style.cssText = 'position: absolute; left: -999em; width: 100px; height: 100px; overflow: scroll;';
		document.body.appendChild(div);
		scrollBarWidth = 100-div.clientWidth;
		document.body.removeChild(div);
		div = null;
		return scrollBarWidth;
	},

	scroll: (function() {

		var
			ie = navigator.userAgent.match(/(?:msie ([0-9]+)|rv:([0-9\.]+)\) like gecko)/i),
			webkit = (/applewebkit/i).test(navigator.userAgent),
			documentElement = document.documentElement,
			scrollCaptured = false,
			lastScrollTop = 0,
			maxScrollTop = 0;
/*
		if ((/win/i).test(navigator.appVersion) && ie) {
			$(documentElement)
				.bind('mousewheel', function(e) {
					if (HANWHAIN.scrollFixSkip === true) {
						return true;
					}
					scrollFix(e.originalEvent.wheelDelta*-1);
					e.preventDefault();
				})
				.bind('keydown', function(e) {
					if (HANWHAIN.scrollFixSkip) {
						return true;
					}
					var keyCode = e.keyCode, documentHeight = documentElement.clientHeight, newScrollTop;
					if ((/^(32|33|34|38|40)$/).test(keyCode)) { // (space bar|page up|page down|up arrow|down arrow)
						scrollFix(keyCode == 32 || keyCode == 34 ? documentHeight : keyCode == 33 ? -documentHeight : keyCode == 38 ? -75 : 75);
						e.preventDefault();
					}
				});
		}
*/
		function scrollFix(scrollBy) {
			var newScrollTop = Math.min(getMaxScrollTop(), Math.max(0, getScrollTop()+scrollBy));
			if (newScrollTop != lastScrollTop) {
				scroll(newScrollTop);
				scrollCaptured = true;
				document[webkit ? 'body' : 'documentElement'].scrollTop = newScrollTop;
			}
		}

		function getScrollTop() {
			return documentElement.scrollTop || (document.body ? document.body.scrollTop : 0) || 0;
		}

		function getMaxScrollTop() {
			return Math.max(document.body ? document.body.scrollHeight : 0, documentElement.scrollHeight)-Math.min(documentElement.offsetHeight, documentElement.clientHeight);
		}

		function scroll(_scrollTop) {

			var scrollTop = typeof(_scrollTop) == 'number' ? _scrollTop : getScrollTop();
			lastScrollTop = scrollTop;
			if (scrollCaptured) {
				scrollCaptured = false;
				return false;
			}

			HANWHAIN.scrollTop = scrollTop;
			maxScrollTop = getMaxScrollTop();
			HANWHAIN.gnb.scroll && HANWHAIN.gnb.scroll(scrollTop, maxScrollTop);
			HANWHAIN.history.scroll && HANWHAIN.history.scroll(scrollTop, maxScrollTop);
			jQuery.each(HANWHAIN.scrollFunctions, function() {
				this(scrollTop, maxScrollTop);
			});

		}

		return scroll;

	})(),

	resize: function(ignore) {

		var width, height;

		width = document.documentElement.offsetWidth;
		height = $(window).height();
		if (ignore !== true) {
			if (!jQuery.browser.mobile && width == HANWHAIN.areaWidth && height == HANWHAIN.areaHeight) {
				return;
			} else if (jQuery.browser.mobile && width == HANWHAIN.areaWidth) {
				return;
			}
		}

		HANWHAIN.areaWidth = document.documentElement.offsetWidth;
		HANWHAIN.areaHeight = $(window).height();

		HANWHAIN.index.resize && HANWHAIN.index.resize();
		HANWHAIN.history.resize && HANWHAIN.history.resize();
		HANWHAIN.allmenu.resize && HANWHAIN.allmenu.resize();
		HANWHAIN.noScroll.resize();
		HANWHAIN.bigDots.resize();

		HANWHAIN.scroll();

	},

	load: function() {
		HANWHAIN.bigDots.resize();
	},

	initialize: function() {


		if (this.initialized) {
			return;
		}
		this.initialized = true;


		// add test header/footer
		var href = location.href;
		if ((/:9170/).test(href) && !(/\/(lay_|pop_|iframe_)[^\/]+\.html$/).test(href) && !(/(\/error|prepare|test|index|main2)\.html$/).test(href) && !(/index\.html$/).test(href) && !(/layout\.html$/).test(href) && !(/main_\.html$/).test(href) && !(/\/all_menu/).test(href)) {
			var depth1 = (/\/hanwha\//).test(href) ? 1 : (/\/dream\//).test(href) ? 2 : (/\/meet\//).test(href) ? 3 : (/\/apply\//).test(href) ? 4 : (/\/login\//).test(href) ? 5 : (/\/mypage\//).test(href) ? 6 : 0,
				depth2 = 0, depth3 = 0;
			if (depth1 == 1) {
				depth2 = (/\/business/).test(href) ? 1 : (/\/value/).test(href) ? 3 : (/\/system/).test(href) ? 4 : 2;
			} else if (depth1 == 2) {
				depth2 = (/\/internship/).test(href) ? 2 : 1;
			} else if (depth1 == 3) {
				depth2 = (/\/affiliates/).test(href) ? 1 : (/\/job/).test(href) ? 2 : 3;
				depth3 = (/_details/).test(href) ? 1 : 0;
			} else if (depth1 == 4) {
				depth2 = (/\/program/).test(href) ? 1 : (/\/faq/).test(href) ? 2 : (/\/hrdb/).test(href) ? 4 : 3;
				depth3 = (/(_details|_details2|agreement|apply[1-9]|_finish)\./).test(href) ? 1 : 0;
			} else if (depth1 == 6) {
				if ((/\/(mypage_result)\.html/).test(href)) {
					depth3 = 1;
				}
			}
			$(document.body).attr('data-nav-current', depth1 +'-'+ depth2 +'-'+ depth3);
			$(WRAPHTML).find('#contents').append(document.body.children).parent().parent().appendTo(document.body);
			$(HEADERHTML).insertBefore($('#wrap')[0].firstChild);
			$(FOOTERHTML).appendTo($('#wrap'));
			$(ALLMENUHTML).appendTo(document.body);
			if (depth1 == 3 && depth3 == 1) {
				if (depth2 == 1) {
					$('#container div.tit-area').html([
						'<h2>계열사 소개 <strong>한화갤러리아</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>',
						'<a href="#" class="alim" title="팝업띄움">채용 알림 설정</a>'
					].join(''));
				} else if (depth2 == 3) {
					$('#container div.tit-area').html([
						'<h2>한화 inside <strong>한화투자증권 사원이 말하는 취업 스펙!</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>'
					].join(''));
				}
			} else if (depth1 == 4 && depth3 == 1) {
				if ((/\/(recruit_details|recruit_details2|recruit_finish)\./).test(href)) {
					$('#container div.tit-area').html([
						'<h2>채용 공고 <strong>한화S&amp;C, 2014년 하반기 신입사원 모집공고</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>',
						'<a href="#" class="qna" title="팝업띄움">1:1 문의하기</a>'
					].join(''));
				} else if ((/\/hrdb_/).test(href)) {
					$('#container div.tit-area').html([
						'<h2>인재 DB <strong>지원서 작성하기</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>',
						'<a href="#" class="my" title="팝업띄움">나의 지원현황 보기</a>'
					].join(''));
				} else {
					$('#container div.tit-area').html([
						'<h2>채용공고 <strong>지원서 작성하기</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>',
						'<a href="#" class="my" title="팝업띄움">나의 지원현황 보기</a>'
					].join(''));
				}
			} else if (depth1 == 6 && depth3 == 1) {
				if ((/\/(mypage_result)\./).test(href)) {
					$('#container div.tit-area').html([
						'<h2>마이페이지 <strong>결과조회</strong></h2>',
						'<a href="#" class="back">이전페이지로 가기</a>',
						'<a href="#" class="qna" title="팝업띄움">1:1 문의하기</a>'
					].join(''));
				}
			}
			if ((/85:9170/).test(href)) {
				$('<div style="position:fixed;left:0;top:0;width:20px;height:20px;background:#eee;z-index:1000" />').click(function() {
					location.href = location.href.replace('192.168.200.85', 'dfffy.com');
				}).appendTo(document.body);
			}
		}

		//remove all text nodes for remove space between tags
		jQuery.fn.removeTextChildren = function() {
			return this.each(function() {
				var children = this.childNodes,
					i = 0, max = children.length;
				for ( ; i < max; i++ ) {
					if ( children[i].nodeType !== 1 ) {
						this.removeChild(children[i]);
						max--;
						i--;
					}
				}
			});
		}

		// not page. cancel scroll fix
		if (!$('#wrap').length) {
			$(document.documentElement).unbind(' keydown');
		}

		if ($.support.canvas) {
			$(document.documentElement).addClass('canvas');
		}

		if ($.browser.ie && 9 > $.browser.ie) {
			$(document.body).addClass('msie8');
		}


		this.scrollBarWidth = this.getScrollBarWidth();

		this.gnb = this.gnb();
		this.footer = this.footer();
		this.allmenu = this.allmenu();

		if ($('section.main-con').length) {
			this.index = this.index();
		}

		// big dot effect
		$('div.visual.mypage').each(function() {
			HANWHAIN.bigDots.add(this, 15, 0.1);
		});
		$('div.lay-job-details h1').each(function() {
			HANWHAIN.bigDots.add(this, 10, 0.1);
		});
		$('section.login').each(function() {
			HANWHAIN.bigDots.add(this, 20, 0.7);
		});

		// history
		if ($('section.history').length) {
			this.history = this.history();
		}

		$(window)
			.scroll(this.scroll)
			.resize(this.resize)
			.load(this.load);
		this.resize();
		this.scroll();


		// input clear
		$('div.visual.job, div.visual.faq').each(function() {
			HANWHAIN.setInputClear($(this).find('input'));
		});

		// avoid ie scroll capturing on input
		// $('input[type="text"], input[type="password"], textarea').on('keydown', function(e) {
		$('body').on('keydown', 'input[type="text"], input[type="password"], textarea', function(e) {
			e.stopPropagation();
		});


		// modify for accessibility issue 150429
		$('.column-2 div.fl li input, .column-2 div.fr li input')
			.bind({
				'mouseenter focus': function() {
					$(this.parentNode).addClass('focus');
				},
				'mouseleave blur': function() {
					$(this.parentNode).removeClass('focus');
				},
				change: function() {
					$(this.parentNode).decideClass('on', this.checked);
				}
			})
			.each(function() {
				$(this.parentNode).decideClass('on', this.checked);
			})
			.parent().find('label')
			.bind({
				'mouseenter': function() {
					$(this.parentNode).addClass('focus');
				},
				'mouseleave': function() {
					$(this.parentNode).removeClass('focus');
				}
			});


		// join input expandable
		$('input.expandable').each(HANWHAIN.makeExpandableInput);
		/*
		$('fieldset.join').each(function() {
			$(this).find('input[type="text"], input[type="password"]')
				.not('[readonly], [disabled]')
				.each(HANWHAIN.makeExpandableInput);
		});
		*/
		$('fieldset.join').each(function() {
			$(this).find('input[type="text"], input[type="password"]')
				.not('[readonly], [disabled]')
				.each(HANWHAIN.checkInputExist);
		});


		// skip button
		// mypage top, privacy list
		$('section.mypage div.header ul a, section.etc > div.top > ol a').click(function() {
			var EL_target = $(this.getAttribute('href'));
			if (EL_target.length) {
				HANWHAIN.smoothScrollTop(EL_target[0].offsetTop-100);
			}
			return false;
		});


		// tab
		$('.tab-type.auto').each(function() {
			HANWHAIN.makeTab($(this).find('> li'));
		});
		$('section.timeline').each(function() {
			HANWHAIN.makeTab($(this).find('> ul > li'), true);
		});


		// faq
		$('.faq-list').each(HANWHAIN.makeFaqList);


		// toggles
		$('div.tab-zone a.view.toggle').each(function() {

			var EL_button = $(this),
				EL_layer = $(EL_button.attr('href')),
				EL_jobList = $('#job-kinds-tab'),
				EL_jobBlocker, top,
				noAni = false,
				opened = false;

			EL_button.click(function() {
				if (opened) {
					EL_button.removeClass('close').attr('title', '레이어열림');
					HANWHAIN.effects.layerHide(EL_layer);
					opened = false;
				} else {
					setJobTop();
					EL_button.addClass('close').attr('title', '레이어닫힘');
					HANWHAIN.effects.layerShow(EL_layer, noAni);
					opened = true;
				}
				noAni = false;
				return false;
			});

			// 직무 소개
			if (EL_jobList.length) {
				EL_jobList.find('> li > a').click(function() {
					if (opened) {
						setJobTop();
						EL_button.click();
					}
				});
				EL_layer.removeTextChildren();
				noAni = true;
				EL_button.click();
			} else {
				EL_jobList = null;
			}

			function setJobTop() {
				if (EL_jobList) {
					top = -(parseInt(EL_jobList.css('height'))-65);
					EL_layer.css({top: top, marginBottom: top});
				}
			}
			/*
			var EL_button = $(this),
				text = EL_button.html();
			HANWHAIN.makeToggler(EL_button, text, text.indexOf('한 눈에 보기') != -1 ? text +' 닫기' : text.replace('보기', '닫기'));
			*/
		});
		// 채용공고 상세검색
		$('.tab-zone a.view.search').each(function() {
			var layer = $('#lay-affiliates'),
				button = $(this);

			layer.show();
			button.remove();
			return;

			function open() {
				button.addClass('close');
				HANWHAIN.effects.layerShow(layer);
			}
			function close() {
				button.removeClass('close');
				HANWHAIN.effects.layerHide(layer);
			}
			button.click(function() {
				if (button.hasClass('close')) {
					close();
				} else {
					open();
				}
				return false;
			});
		});


		// tip
		if ($('div.tip-area').length) {
			// this.setTipArea = this.setTipArea($('div.tip-area'));
			this.setTipArea($('div.tip-area'));
		}


		// sliders
		// Dream > 멤버십프로그램 상세(popup)
		// Meet > 직무소개(popup)
		$('div.thumbs-list, section.photo-list').each(function() {
			var EL_box = $(this),
				EL_slider = EL_box.find('> div.thumbs, > div.photos'),
				EL_paging = EL_box.find('> div.toggle-type ul');
			if (2 > EL_slider.children().length) {
				EL_paging.parent().remove();
				return;
			}
			EL_slider.xlider({
				endless: true,
				useTransition: false, // jQuery.browser.mobile,
				paging: EL_paging,
				arrows: [
					EL_box.find('a.prev'),
					EL_box.find('a.next')
				]
			});
			EL_paging.parent().clone().insertBefore(EL_slider).html('')
				.append(EL_paging.parent().find('a.prev, a.next'));
			EL_slider.css('height', '100%');
		});
		// Meet > 계열사 소개 상세 > 어떤 직무를 할 수 있을까?
		$('div.details aside > dl dd').each(function() {
			var EL_box = $(this),
				EL_items = EL_box.find('> ul').wrap('<div />').parent(),
				EL_slider = EL_items.wrapAll('<div style="width:256px;" />').parent(),
				EL_paging = EL_box.find('> p span');
			if (EL_items.length > 1) {
				EL_slider.xlider({
					endless: true,
					useTransition: false, // jQuery.browser.mobile,
					arrows: [
						EL_box.find('a.prev'),
						EL_box.find('a.next')
					],
					onChange: setPage
				});
				setPage(0);
				EL_paging.parent().insertBefore(EL_slider);
			} else {
				EL_paging.parent().remove();
			}
			function setPage(page) {
				EL_paging.html((page+1) +'/'+ EL_items.length);
			}
		});
		// Meet > 계열사 소개 상세 > 한화인을 만나보세요.
		$('div.interview-list').each(function() {
			var EL_box = $(this),
				EL_select = EL_box.find('fieldset select'),
				EL_slider = EL_box.find('> div').not('.toggle-type').wrapAll('<div />').parent(),
				EL_paging = EL_box.find('.toggle-type ul');

			if (2 > EL_slider.find('> div').length) {
				EL_select.change().remove();
				EL_paging.parent().remove();
				return;
			}
			// HANWHAIN.createPaging(EL_paging, EL_slider.children().length);

			if (EL_select.length) {
				EL_select.change(function() {
					EL_slider.xlider('change', this.selectedIndex);
				});
			}
			EL_slider.xlider({
				endless: true,
				useTransition: false, // jQuery.browser.mobile,
				paging: EL_paging,
				arrows: [
					EL_box.find('a.prev'),
					EL_box.find('a.next')
				],
				onChange: !EL_select.length ? null : function(page) {
					EL_select[0].options.selectedIndex = page;
					EL_select.fakeselect();
				},
				onChangeEnd: !EL_select.length ? null : function(page) {
					EL_select.change();
				}
			});
			EL_paging.parent().clone().insertBefore(EL_box[0].firstChild).html('')
				.append(EL_paging.parent().find('a.prev, a.next'));

		});


		// password certify create tab & canvas bg update
		$('label[for="pw-certify1-1"]').each(function() {
			var EL_list = $(this.parentNode.parentNode.parentNode),
				EL_radios = EL_list.find('input[type="radio"]'),
				isPoorBroser = $.browser.ie && 9 > $.browser.ie;
			EL_radios.change(function() {
				EL_list.find('div.details').hide().eq(EL_radios.index(EL_radios.filter(':checked'))).show();
				HANWHAIN.bigDots.resize();
			});
		});


		// pager > mypage
		if ($('section.mypage').length) {
			$('[data-pager]').each(function() {
				HANWHAIN.makePager(this, this.getAttribute('data-pager'), parseInt(this.getAttribute('data-pager-display')));
			});
		};


		$('#job-kinds-tab').wrap('<form />');


		// fake form initialize
		$('select').fakeselect(
			$(document.body).hasClass('popup') ? {option: {maxlength: 5}} :
			($.browser.ie && $.browser.ie) ? {effect: {show: 'none', hide: 'none'}} :
			null);
		$('input[type="radio"], input[type="checkbox"]').fakecheck();
		if (document.createElement('input').placeholder == undefined) {
			$(document.documentElement).addClass('noplaceholder');
			$('input').not('[type="radio"], [type="checkbox"], [type="password"]').fakeplaceholder();
		} else {
			$(document.documentElement).addClass('placeholder');
		}

		// ios safari bug
		$('body > div.lay-program, body > div.lay-job-details, body > div.lay-details').each(function() {
			this.style.WebkitTransform = 'translate3d(0, 0, 0)';
		});
		
		$('input[type="text"], input[type="password"], textarea')
			// .not('[readonly], [disabled]')
			.not($('fieldset.join input'))
			.each(HANWHAIN.checkInputOnlyExist);

		// override jQuery val for readonly's exist check
		var originalJQueryVal = jQuery.fn.val;
		jQuery.fn.val = function(_value) {
			if ((/^(text)$/i).test(this.type || this.attr('type'))) {
				this.decideClass('exist', _value);
			}
			return originalJQueryVal.apply(this, arguments);
		};

		$('select').each(HANWHAIN.checkSelectExist);


		// youtube iframe from editor
		$('#contents section.inside-details, #contents section.apply.details').each(function() {
			var EL_iframes = $(this).find('iframe'),
				src;
			if (EL_iframes.length) {
				EL_iframes.each(function() {
					src = this.src;
					if ((/youtube\.com/i).test(src)) {
						src = src + (src.indexOf('?') == -1 ? '?' : '&') +'wmode=transparent';
						this.src = src;
					}
				});
			}
		});


	}

}

// Array.reduce for old browsers
// referrence: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce
if (!Array.prototype.reduce) {
  Array.prototype.reduce = function(callback /*, initialValue*/) {
    'use strict';
    if (this == null) {
      throw new TypeError('Array.prototype.reduce called on null or undefined');
    }
    if (typeof callback !== 'function') {
      throw new TypeError(callback + ' is not a function');
    }
    var t = Object(this), len = t.length >>> 0, k = 0, value;
    if (arguments.length == 2) {
      value = arguments[1];
    } else {
      while (k < len && !(k in t)) {
        k++; 
      }
      if (k >= len) {
        throw new TypeError('Reduce of empty array with no initial value');
      }
      value = t[k++];
    }
    for (; k < len; k++) {
      if (k in t) {
        value = callback(value, t[k], k, t);
      }
    }
    return value;
  };
}





var WRAPHTML = [
	'<div id="wrap">',
		'<div id="container" class="wide">	',
			'<section id="contents">',

				// move to header on initialize
				'<div class="tit-area">',
					'<h2>메뉴명 <strong>결과조회</strong></h2>',
					'<a href="#" class="back">이전페이지로 가기</a>',
					'<a href="#" class="qna" title="팝업띄움">1:1 문의하기</a>',
				'</div>',

			'</section>',
		'</div>',
	'</div>',
	''
].join('');

var HEADERHTML = [
	'<header data-nav-current="1-1-0">',
		'<span id="skipNav">',
			'<a href="#contents">본문바로가기</a>',
			'<a href="#gnb">대메뉴바로가기</a>',
		'</span>',
		'<h1><a href="../main/main.html"><img src="/images/common/hanwha.png" alt="Hanwha in"></a></h1>',
		'<span class="blind">주메뉴</span>',
		'<section id="gnb">',
			'<ul class="nav">',
				'<li>',
					'<a href="../hanwha/business.html">Hanwha</a>',
					'<div class="lay-sub">',
						'<section>',
							'<p>한화가<br>',
							'궁금하신가요?</p>',
							'<ul>',
								'<li><a href="../hanwha/business.html">한화의 사업</a></li>',
								'<li><a href="../hanwha/history.html">한화가 걸어온 길</a></li>',
								'<li><a href="../hanwha/value.html">한화인의 핵심가치</a></li>',
								'<li><a href="../hanwha/system.html">한화의 제도</a></li>',
							'</ul>',
						'</section>',
					'</div>',
				'</li>',
				'<li>',
					'<a href="../dream/dreamtune.html">Dream</a>',
					'<div class="lay-sub">',
						'<section>',
							'<p>한화에서<br>',
							'당신의 꿈을<br>',
							'찾아 드립니다.</p>',
							'<ul>',
								'<li><a href="../dream/dreamtune.html">Dream Tunes</a></li>',
								'<li><a href="../dream/internship.html">멤버십 프로그램</a></li>',
							'</ul>',
						'</section>',
					'</div>',
				'</li>',
				'<li>',
					'<a href="../meet/affiliates.html">Meet</a>',
					'<div class="lay-sub">',
						'<section>',
							'<p>한화의 계열사와<br>',
							'한화인들을<br>',
							'만나보세요.</p>',
							'<ul>',
								'<li><a href="../meet/affiliates.html">계열사 소개</a></li>',
								'<li><a href="../meet/job.html">직무 소개</a></li>',
								'<li><a href="../meet/inside.html">한화 inside</a></li>',
							'</ul>',
							'<aside>',
								'<h3>Meet 한화인</h3>',
								'<figure>',
									'<img src="/images/common/@tmp_thumb_c.jpg" alt="">',
									'<figcaption>',
										'<strong>김윤정</strong> 사원<br>',
										'한화 갤러리아 마케팅팀<br>',
										'<a href="../meet/lay_details.html" title="팝업띄움" onclick="HANWHAIN.layer.open(this, 918);return false;">인터뷰 보기</a>',
									'</figcaption>',
								'</figure>',
							'</aside>',
						'</section>',
					'</div>',
				'</li>',
				'<li>',
					'<a href="../apply/program.html">Apply</a>',
					'<div class="lay-sub">',
						'<section>',
							'<p>한화와 함께<br>',
							'꿈을 실현하세요.</p>',
							'<ul>',
								'<li><a href="../apply/program.html">채용 절차</a></li>',
								'<li><a href="../apply/faq.html">FAQ</a></li>',
								'<li><a href="../apply/recruit.html">채용 공고</a></li>',
								'<li><a href="../apply/hrdb.html">인재 DB</a></li>',
							'</ul>',
						'</section>',
					'</div>',
				'</li>',
			'</ul>',
		'</section>',
		'<ul id="util">',
			'<li>',
				'<a href="#lay-alim" class="photo" title="레이어열림">',
				'	<b class="blind">알림메세지 :</b> <em>3</em>',
				'	<img src="/images/common/edge.png" alt="" class="edge">',
				'	<img src="/images/main/intro.jpg" alt="">',
				'</a>',
				'<a href="#lay-alim" class="name" title="레이어열림">한화인</a>',
				
				'<div id="lay-alim" class="lay-alim" style="display:none">',
					'<img src="/images/common/arrow.png" alt="" class="arrow">',
					'<p>',
						'월요일,<br>',
						'12월 10일',
						'<span>20140226131055</span>',
					'</p>',
					'<ul>',
						'<li class="on">',
							'<a href="#" title="현재페이지">미제출 지원서 <span>3</span></a>',
							'<ul class="alim">',
								'<li>',
									'<a href="#">',
										'<strong>한화 생명보험 1차 면접일이 2일 전입니다.</strong>',
										'<small>알림 12월 12일 9:00 AM</small>',
									'</a>',
								'</li>',
								'<li>',
									'<a href="#">',
										'<strong>한화 생명보험 1차 면접일이 2일 전입니다.</strong>',
										'<small>알림 12월 12일 9:00 AM</small>',
									'</a>',
								'</li>',
								'<li>',
									'<a href="#">',
										'<strong>한화 생명보험 1차 면접일이 2일 전입니다.</strong>',
										'<small>알림 12월 12일 9:00 AM</small>',
									'</a>',
								'</li>',
								'<li>',
									'<a href="#">',
										'<strong>한화 생명보험 1차 면접일이 2일 전입니다.</strong>',
										'<small>알림 12월 12일 9:00 AM</small>',
									'</a>',
								'</li>',
								'<li>',
									'<a href="#">',
										'<strong>한화 생명보험 1차 면접일이 2일 전입니다.</strong>',
										'<small>알림 12월 12일 9:00 AM</small>',
									'</a>',
								'</li>',
							'</ul>',
						'</li>',
						'<li>',
							'<a href="#">관심 컨텐츠 <span>13</span></a>',
							'<ul class="bookmark" style="display:none">',
								'<li><a href="../meet/affiliates_details.html">계열사 소개 <strong>한화S&amp;C</strong></a></li>',
								'<li><a href="../apply/recruit_details.html">채용공고 <strong>한화갤러리아</strong> <small>진행중</small></a></li>',
								'<li><a href="../meet/lay_details.html" onclick="HANWHAIN.layer.open(this, 918);return false;">직무 소개 <strong>한화 갤러리아 마케팅팀</strong></a></li>',
								'<li><a href="../apply/recruit_details.html">채용공고 <strong>한화첨단소재</strong> <small class="close">마감</small></a></li>',
								'<li><a href="../hanwha/system.html">Hanwha <strong>한화의 제도</strong></a></li>',
								'<li><a href="../dream/internship.html">Meet <strong>맴버쉽 프로그램</strong></a></li>',
								'<li><a href="../meet/affiliates_details.html">계열사 소개 <strong>한화S&amp;C</strong></a></li>',
								'<li><a href="../apply/recruit_details.html">채용공고 <strong>한화갤러리아</strong> <small>진행중</small></a></li>',
								'<li><a href="../meet/job_details.html">직무 소개 <strong>한화 갤러리아 마케팅팀</strong></a></li>',
								'<li><a href="../apply/recruit_details.html">채용공고 <strong>한화첨단소재</strong> <small class="close">마감</small></a></li>',
								'<li><a href="../hanwha/system.html">Hanwha <strong>한화의 제도</strong></a></li>',
								'<li><a href="../dream/internship.html">Meet <strong>맴버쉽 프로그램</strong></a></li>',
							'</ul>',
						'</li>',
					'</ul>',
					'<span class="btn">',
						'<a href="../mypage/mypage.html" class="mypage">마이페이지</a>',
						'<a href="../main/main.html" class="logout">로그아웃</a>',
					'</span>',
				'</div>',
			'</li>',
			'<li><a href="#" class="eng">english</a></li>',
			'<li><a href="#" class="menu">한화in 이용 가이드(팝업띄움)</a></li>',
		'</ul>',
		// '<div class="tit-area">',
		// 	'<h2>채용공고 상세 <strong>지원서 작성하기</strong></h2>',
		// 	'<a href="#" class="back">이전페이지로 가기</a>',
		// 	'<a href="#" class="my" title="팝업띄움">나의 지원현황 보기</a>',
		// '</div>',
	'</header>',
	''
].join('');

var FOOTERHTML = [
	'<footer>',
		'<span class="blind">바닥글</span>',
		'<section>',
			'<img src="/images/common/hanwha2.png" alt="Hanwha" class="bi">',
			'<ul class="util">',
				'<li><a href="#" target="_blank" title="새창열림">한화그룹</a></li>',
				'<li><a href="#" target="_blank" title="새창열림">한화인재경영원</a></li>',
				'<li><a href="/etc/clause.html">이용약관</a></li>',
				'<li><a href="/etc/privacy.html">개인정보취급방침</a></li>',
			'</ul>',
			'<address><img src="/images/common/copyright.png" alt="Copyright &copy; 2015 Hanwha Group. All rights reserved."></address>',
			'<ul class="share">',
				'<li><a href="#" class="facebook" target="_blank" title="새창열림">Facebook</a></li>',
				'<li><a href="#" class="twitter" target="_blank" title="새창열림">Twitter</a></li>',
				'<li><a href="#" class="blog" target="_blank" title="새창열림">Blog</a></li>',
				'<li>',
					'<a href="#" class="family" title="레이어열림">계열사 바로가기</a>',
					'<div id="lay-family">',
						'<div class="lay-family">',
							'<div class="container">',
								'<dl>',
									'<dt>제조·건설</dt>',
									'<dd>',
										'<ul>',
											'<li><a href="http://www.hanwhacorp.co.kr" target="_blank" title="새창열림">(주)한화/화약</a></li>',
											'<li><a href="http://www.hanwhacorp.co.kr" target="_blank" title="새창열림">(주)한화/방산</a></li>',
											'<li><a href="http://www.hanwhatrade.com" target="_blank" title="새창열림">(주)한화/무역</a></li>',
											'<li><a href="http://www.hanwhacorpmach.com" target="_blank" title="새창열림">(주)한화기계</a></li>',
											'<li><a href="http://hcc.hanwha.co.kr" target="_blank" title="새창열림">한화케미칼</a></li>',
											'<li><a href="http://www.hwam.co.kr" target="_blank" title="새창열림">한화첨단소재</a></li>',
											'<li><a href="http://www.hwpd.co.kr" target="_blank" title="새창열림">한화폴리드리머</a></li>',
											'<li><a href="http://hec.hanwha.co.kr" target="_blank" title="새창열림">한화에너지</a></li>',
											'<li><a href="http://www.hanwhasolar.com" target="_blank" title="새창열림">한화큐셀코리아</a></li>',
											'<li><a href="http://www.hwenc.co.kr" target="_blank" title="새창열림">한화건설</a></li>',
											'<li><a href="http://www.hcd21.co.kr" target="_blank" title="새창열림">한화도시개발</a></li>',
										'</ul>',
									'</dd>',
								'</dl>',
								'<dl>',
									'<dt>금융</dt>',
									'<dd>',
										'<ul>',
											'<li><a href="http://www.hanwhalife.com" target="_blank" title="새창열림">한화생명</a></li>',
											'<li><a href="http://www.hwgeneralins.com" target="_blank" title="새창열림">한화손해보험</a></li>',
											'<li><a href="http://www.hanwhawm.com" target="_blank" title="새창열림">한화투자증권</a></li>',
											'<li><a href="http://www.hanwhafund.co.kr" target="_blank" title="새창열림">한화자산운용</a></li>',
											'<li><a href="http://www.hanwhainvestment.co.kr" target="_blank" title="새창열림">한화인베스트먼트</a></li>',
											'<li><a href="http://www.hanwhasbank.com" target="_blank" title="새창열림">한화저축은행</a></li>',
										'</ul>',
									'</dd>',
								'</dl>',
								'<dl>',
									'<dt>서비스·레저</dt>',
									'<dd>',
										'<ul>',
											'<li><a href="http://www.hwrc.co.kr" target="_blank" title="새창열림">한화호텔&amp;리조트</a></li>',
											'<li><a href="http://www.hanwhagalleria.co.kr" target="_blank" title="새창열림">한화갤러리아</a></li>',
											'<li><a href="http://www.63realty.co.kr" target="_blank" title="새창열림">한화63시티</a></li>',
											'<li><a href="http://www.hsnc.co.kr" target="_blank" title="새창열림">한화S&amp;C</a></li>',
											'<li><a href="http://www.hancomm.co.kr" target="_blank" title="새창열림">한 컴</a></li>',
											'<li><a href="http://www.hwsd.co.kr" target="_blank" title="새창열림">한화역사</a></li>',
											'<li><a href="http://www.hanwhaeagles.co.kr" target="_blank" title="새창열림">한화이글스</a></li>',
										'</ul>',
									'</dd>',
								'</dl>',
							'</div>',
						'</div>',
					'</div>',
				'</li>',
			'</ul>',
		'</section>',
	'</footer>',
	''
].join('');

var ALLMENUHTML = [
	'<section id="allmenu" class="menu">',
		'<div class="container">',
			'<h1 class="blind">전체메뉴</h1>',
			'<ul class="tabs">',
				'<li class="on">',
					'<a href="#">가슴 속에 불꽃을<br>품고있는 당신<br><strong>한화인 <em>전체</em></strong></a>',
				'</li>',
				'<li>',
					'<a href="#">신입의 패기로 미래가<br>되고 싶은<br><strong>예비 불꽃인 <em>추천</em></strong></a>',
				'</li>',
				'<li>',
					'<a href="#">본인의 꿈과 진로에<br>대해 고민하는<br><strong>이 시대의 청년 <em>추천</em></strong></a>',
				'</li>',
				'<li>',
					'<a href="#">완숙한 노련미로<br>꿈을 펼치고 싶은<br><strong>경력 지원자 <em>추천</em></strong></a>',
				'</li>',
			'</ul>',
			'<div class="tab-contents">',
				'<ul>',
					'<li>',
						'<h2>Hanwha</h2>',
						'<ul>',
							'<li><a href="#">한화의 사업</a></li>',
							'<li><a href="#">한화가 걸어온 길</a></li>',
							'<li><a href="#">한화인의 핵심가치</a></li>',
							'<li><a href="#">인사제도</a></li>',
						'</ul>',
						'<figure>',
							'<img src="../../images/main/img_menu.png" alt="">',
							'<figcaption>',
								'<em>한화그룹</em>',
								'<p>History Webtoon</p>',
								'60년 전, 한화인의 불꽃을 만나보세요.',
							'</figcaption>',
						'</figure>',
					'</li>',
					'<li>',
						'<h2>Dream</h2>',
						'<ul>',
							'<li><a href="#">DREAM TUNES</a></li>',
							'<li><a href="#">멤버십 프로그램</a></li>',
						'</ul>',
						'<figure>',
							'<img src="../../images/main/img_menu2.png" alt="">',
							'<figcaption>',
								'계열사/직무 추천 프로그램',
								'<p>Dream Tunes</p>',
								'가슴 속 불꽃을 확인시켜 줄 프로그램입니다.',
							'</figcaption>',
						'</figure>',
					'</li>',
					'<li>',
						'<h2>Meet</h2>',
						'<ul>',
							'<li><a href="#">계열사 소개</a></li>',
							'<li><a href="#">직무 소개</a></li>',
							'<li><a href="#">한화 inside</a></li>',
						'</ul>',
						'<figure>',
							'<img src="../../images/main/img_menu3.png" alt="">',
							'<figcaption>',
								'<em>직무별 담당자의 생생</em>',
								'<p>직무 인터뷰</p>',
								'한화인이 들려주는 이야기에 귀 기울여 보세요.',
							'</figcaption>',
						'</figure>',
					'</li>',
					'<li>',
						'<h2>Apply</h2>',
						'<ul>',
							'<li><a href="#">채용 절차 </a></li>',
							'<li><a href="#">FAQ</a></li>',
							'<li><a href="#">채용 공고</a></li>',
							'<li><a href="#">인재 DB</a></li>',
						'</ul>',
						'<figure>',
							'<img src="../../images/main/img_menu4.png" alt="">',
							'<figcaption>',
								'<em>채용 공고</em>',
								'<p>현재 15건의 채용 공고가 있습니다.</p>',
								'한화인에 지원해 보세요.',
							'</figcaption>',
						'</figure>',
					'</li>',
				'</ul>',
			'</div>',
		'</div>',
		'<a href="#" class="close">팝업닫기</a>',
	'</section>',
	''
].join('');