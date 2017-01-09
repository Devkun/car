
// Dream Tunes
$(function() {

	var 
		EL_intro = $('#dt-intro'),
		EL_sections = $('section.dreamtune').not('#dt-intro, #dt-steps, #dt-step1'),

		EL_steps = $('#dt-steps'),
		EL_stepItems = EL_steps.find('a'),

		EL_fake = $('<div class="dt-fake" />'),
		EL_loading = $('<div id="dt-loading" />'),

		EL_current = EL_intro,

		supportOpacity = jQuery.support.opacity,
		supportTransform = jQuery.support.transform,
		weiredTransform = supportTransform && jQuery.browser.ie,

		started = false,
		currentStep = 0,

		selectedDatas = {},

		fromKeyboard = false,
		keyPressed = false;


	setBallonControl(EL_steps.find('ul.steps li'), function(EL_balloon) {
		return (/ (on|pass) /).test(' '+ EL_balloon[0].parentNode.className +' ');
	});
	EL_steps.find('ul.steps').css('top', 0);
	EL_stepItems.each(function(i) {
			this.setAttribute('data-step', i+1);
		}).click(jumbStep);
	EL_fake.insertBefore(EL_intro);
	EL_intro.css('position', 'absolute');
	EL_sections.each(setRankable);

	// EL_loading.html('<span></span><em>Loading...</em>').appendTo(document.body).find('span')._spriteanimation(60, 20, 'backgroundPosition', 0.75, true).data('spriteanimation').play();

	resize();


	// intro
	(function() {

		var
			EL_title = EL_intro.find('div.hgroup'),
			EL_cardcase = EL_intro.find('div.cardcase'),
			EL_cards = EL_intro.find('img[class^="card"]'),
			EL_goButton = EL_intro.find('a.go'),
			i = 0, numCards = EL_cards.length;

		for (; i < numCards; i++) {
			EL_cards[i] = $(EL_cards[i]);
		}

		EL_cardcase.mouseenter(hover).mouseleave(leave).click(click);
		EL_goButton.mouseenter(hover).mouseleave(leave).click(click)
			.keydown(keyPress).focus(hover).blur(leave);

		function hover() {
			if (supportOpacity && !started) {
				for (i = 1; i < numCards; i++) {
					EL_cards[i]._stop()._animate({translate3dY: -(5*i)}, {queue: false, duration: 350, easing: 'easeOutBack', delay: (i-1)*20});
				}
			}
		}

		function leave() {
			if (supportOpacity && !started) {
				for (i = 1; i < numCards; i++) {
					EL_cards[i]._stop()._animate({translate3dY: 0}, {queue: false, duration: 250, easing: 'easeOutQuart'});
				}
			}
		}

		function click() {
			fromKeyboard = keyPressed;
			keyPressed = false;
			if (supportOpacity && !started) {
				EL_title._animate({opacity: 0}, {queue: false, duration: 350, easing: 'easeInOutQuad'});
				EL_cardcase._animate({opacity: 0, translate3dY: 100/*, rotate: 1*/}, {queue: false, duration: 1000, easing: 'easeInOutQuad', complete: nextStep});
				for (i = numCards-1; i > -1; i--) {
					EL_cards[i]._stop()._animate({translate3dY: -(650+Math.random()*50), rotate: (Math.random()*100-50)/10}, {queue: false, duration: 500, easing: 'easeInOutQuad', delay: (numCards-i-1)*50});
				}
				EL_goButton._animate({opacity: 0}, {queue: false, duration: 150, easing: 'easeInOutQuad'});
				started = true;
			} else {
				nextStep();
			}
			return false;
		}

	})();


	// worldcup
	(function() {
		
		var
			EL_box = $('#dt-step1'),
			EL_subStep = EL_box.find('ul.steps-sub'),
			EL_subStepItem = EL_subStep.children(),
			EL_cardBox = EL_box.find('span.card'),
			EL_cards = EL_cardBox.find('a'),
			EL_ment = EL_box.find('div.hgroup p').eq(0),
			EL_resultMent = EL_box.find('div.hgroup p').eq(1),
			EL_ranks = [],
			EL_buttonBox = EL_box.find('div.btn-area'),
			EL_resetButton = EL_buttonBox.find('a.refresh'),
			EL_goButton = EL_buttonBox.find('a.go'),

			subStep = 0,
			leftCards = 8,
			passedCards = 0,
			selected = null,
			wasted = null,
			rank = null,
			displayIndexs = null,

			minHeight = 477,
			maxHeight = 524,
			verticalPadding = 230,

			clickable = true,

			resultXs = supportTransform ? [-477, -245, -13, 219] : [-462, -230, 2, 234],
			// resultXs = [0, 0, 0, 0],

			i = 0, numCards = EL_cards.length;


		for (; i < numCards; i++) {
			EL_cards[i] = $(EL_cards[i])
				.attr('data-index', i)
				.mouseenter(hover)
				.mouseleave(leave)
				.focus(hover)
				.blur(leave)
				.keydown(keyPress)
				.click(select);
		}

		for (i = 0; i < 4; i++) {
			EL_ranks[i] = $('<mark class="ranking'+ (i+1) +'">'+ (i+1) +'순위</mark>');
		}

		EL_resetButton.keydown(keyPress).click(function(e) {
			fromKeyboard = keyPressed;
			keyPressed = false;
			reset();
			return false;
		});
		EL_goButton.keydown(keyPress).click(function(e) {
			var newRank = [];
			fromKeyboard = keyPressed;
			keyPressed = false;
			jQuery.each(rank, function(i) {
				newRank[i] = parseInt(EL_cards[rank[i]].attr('data-card-no'))-1;
			});
			setSelectedData(newRank);
			nextStep();
			return false;
		});

		EL_box.bind('display', reset);


		function hover() {
			var index, otherIndex;
			if (clickable) {
				index = EL_cards[displayIndexs[0]][0] == this ? 0 : 1,
				otherIndex = index ? 0 : 1;
				if (supportOpacity) {
					EL_cards[displayIndexs[index]]._stop()._animate({scale: 1, opacity: 1}, {queue: false, duration: 350, easing: 'easeOutCubic'});
					EL_cards[displayIndexs[otherIndex]]._stop()._animate({scale: 0.975, opacity: 0.7}, {queue: false, duration: 350, easing: 'easeOutCubic'});
				} else {
					EL_cards[displayIndexs[index]].css('marginTop', -5);
					EL_cards[displayIndexs[otherIndex]].css('marginTop', 0);
				}
			}
		}

		function leave() {
			if (clickable) {
				if (supportOpacity) {
					EL_cards[displayIndexs[0]]._stop()._animate({scale: 1, opacity: 1}, {queue: false, duration: 350, easing: 'easeOutCubic'});
					EL_cards[displayIndexs[1]]._stop()._animate({scale: 1, opacity: 1}, {queue: false, duration: 350, easing: 'easeOutCubic'});
				} else {
					EL_cards[displayIndexs[0]].css('marginTop', 0);
					EL_cards[displayIndexs[1]].css('marginTop', 0);
				}
			}
		}

		function select(e) {

			if (!clickable) {
				return false;
			}

			fromKeyboard = keyPressed;
			keyPressed = false;

			var index = parseInt(this.getAttribute('data-index')),
				otherIndex = displayIndexs[index == displayIndexs[0] ? 1 : 0];

			passedCards += 2;
			subStep++;

			if (leftCards > 2) {
				selected[leftCards/2].push(index);
				if (leftCards == 4) {
					wasted.push(otherIndex);
				}
				hiding(index, otherIndex);
			} else if (subStep == 7) { // 3,4
				rank.push(index, otherIndex);
				hiding(index, otherIndex);
			} else { // final
				rank.unshift(index, otherIndex);
				hiding(index, otherIndex, true);
			}
			// console.log(selected[4], selected[2], wasted, rank);

			return false;
		}

		function hiding(selectedIndex, wastedIndex, isEnd) {
			if (leftCards == passedCards) {
				leftCards = Math.max(2, leftCards/2);
				passedCards = 0;
			}
			if (supportTransform) {
				clickable = false;
				!weiredTransform && EL_cards[selectedIndex].css('transform', ''); // chrome bug
				EL_cards[selectedIndex]._animate({
						translate3dX: EL_cards[selectedIndex].hasClass('odd') ? 130 : -130,
						scale: weiredTransform ? 1 : 1.075, rotateY: 359.9
					}, {queue: false, duration: 750, easing: 'easeOutCubic', complete: function() {
						if (isEnd) {
							ending();
						} else {
							EL_cards[selectedIndex]._animate({scale: weiredTransform ? 1 : 1.1, opacity: 0},
								{queue: false, duration: 350, easing: 'easeInOutQuad', complete: function() {
									EL_cards[selectedIndex].hide()._css({translate3dX: 0, scale: 1, rotateY: 0, opacity: 1});
									EL_cards[wastedIndex].hide()._css({translate3dX: 0, scale: 1, opacity: 1});
									ready();
								}});
						}
					}});
				EL_cards[wastedIndex]._animate({scale: 0.9, opacity: 0}, {queue: false, duration: 350, easing: 'easeOutCubic'});
			} else {
				EL_cards[selectedIndex].hide();
				EL_cards[wastedIndex].hide();
				if (isEnd) {
					ending();
				} else {
					ready();
				}
			}
		}

		function ending() {

			var x, i = 0;
			// console.log(rank);

			for (; i < 4; i++) {
				!i && supportTransform && EL_ranks[i]._css({scale: 1.5, opacity: 0});
				EL_ranks[i].appendTo(EL_cards[rank[i]]);
			}

			if (supportTransform) {
				for (i = 0; i < 4; i++) {
					x = resultXs[i];
					if (EL_cards[rank[i]].hasClass('odd')) {
						x += 258;
					}
					if (!i) {
						EL_ranks[i]._animate({scale: 1, opacity: 1}, {queue: false, duration: 350, delay: 250, easing: 'easeOutBack'});
						EL_cards[rank[i]]._animate({scale: 1, translate3dX: x}, {queue: false, duration: 750, delay: 1000, easing: 'easeInOutCubic'});
					} else {
						EL_cards[rank[i]]._css({translate3dX: x, translate3dY: 100, scale: 1, opacity: 0}).show()
							._animate({translate3dY: 0}, {queue: false, duration: 750, easing: 'easeOutCubic', delay: i*150+1500});
						EL_cards[rank[i]]._animate({opacity: 1}, {queue: false, duration: 750, easing: 'easeInOutQuad', delay: i*150+1500});
					}
				}
				EL_ment._animate({opacity: 0}, {queue: false, duration: 350, delay: 1000, easing: 'easeInOutQuad', complete: function() {
					EL_ment.hide();
					EL_resultMent.css('opacity', 0).show()._animate({opacity: 1}, {queue: false, duration: 500, easing: 'easeInOutQuad'});
				}});
				EL_box.css('height', EL_box[0].offsetHeight-verticalPadding)._animate({height: maxHeight}, {queue: false, duration: 500, delay: 2500, easing: 'easeOutCubic', step: function(v) {
					setFakeHeight(v.height+verticalPadding);
				}});
				EL_subStep._animate({opacity: 0}, {queue: false, duration: 250, easing: 'easeInOutQuad'});
				EL_buttonBox.css('opacity', 0).show()
					._animate({opacity: 1}, {queue: false, duration: 500, delay: 2500, easing: 'easeInOutQuad', complete: function() {
						fromKeyboard && EL_resetButton.focus();
					}});
			} else {
				clickable = false;
				EL_ment.hide();
				EL_resultMent.show()
					.css('height', EL_resultMent[0].offsetHeight).css('height', ''); // ie 8 bug
				for (i = 0; i < 4; i++) {
					x = resultXs[i];
					EL_cards[rank[i]].css('marginLeft', x).css('marginTop', '').show();
				}
				EL_subStep.hide();
				EL_buttonBox.show();
				setFakeHeight(maxHeight+verticalPadding);
				fromKeyboard && EL_resetButton.focus();
			}

		}

		function ready() {
			if (leftCards > 4) {
				displayIndexs = [passedCards, passedCards+1];
			} else if (subStep == 6) {
				displayIndexs = [wasted[passedCards], wasted[passedCards+1]];
			} else {
				displayIndexs = [selected[leftCards][passedCards], selected[leftCards][passedCards+1]];
			}
			// trace.log(displayIndexs)
			EL_cards[displayIndexs[0]].addClass('odd').show();
			EL_cards[displayIndexs[1]].removeClass('odd').show();
			if (supportTransform) {
				clickable = false;
				EL_cards[displayIndexs[0]]._css({translate3dX: -200, opacity: 0})
					._animate({translate3dX: 0, rotate: 0.001, opacity: 1}, {queue: false, duration: 500, delay: 250, easing: 'easeOutCubic', complete: function() {
						clickable = true;
						fromKeyboard && EL_cards[displayIndexs[0]].focus();
					}});
				EL_cards[displayIndexs[1]]._css({translate3dX: 200, opacity: 0})
					._animate({translate3dX: 0, rotate: 0.001, opacity: 1}, {queue: false, duration: 500, delay: 250, easing: 'easeOutCubic'});
			} else {
				clickable = true;
				fromKeyboard && EL_cards[displayIndexs[0]].focus();
			}
			EL_subStepItem.removeClass('on')[subStep].className = 'on';
		}

		function reset() {
			var i = 0;
			if (subStep) {
				if (supportTransform) {
					EL_cardBox._animate({opacity: 0}, {queue: false, duration: 350, easing: 'easeInOutQuad', complete: function() {
						for (i = 0; i < 4; i++) {
							EL_ranks[i].detach();
						}
						for (i = 0; i < numCards; i++) {
							EL_cards[i].attr('style', '');
						}
						EL_cardBox.css('opacity', '');
						subStep = 0;
						ready();
					}});
					EL_resultMent.hide();
					EL_ment.show()._animate({opacity: 1}, {queue: false, duration: 500, easing: 'easeInOutQuad'});
					EL_box._animate({height: minHeight}, {queue: false, duration: 350, easing: 'easeOutCubic', step: function(v) {
						setFakeHeight(v.height+verticalPadding);
					}});
					EL_subStep._animate({opacity: 1}, {queue: false, duration: 250, delay: 300, easing: 'easeInOutQuad'});
					EL_buttonBox._animate({opacity: 0}, {queue: false, duration: 150, easing: 'easeInOutQuad', complete: function() {
						EL_buttonBox.hide();
					}});
				} else {
					for (i = 0; i < 4; i++) {
						EL_ranks[i].detach();
					}
					for (i = 0; i < numCards; i++) {
						EL_cards[i].attr('style', '');
					}
					EL_ment.show();
					EL_resultMent.hide();
					EL_subStep.show();
					EL_buttonBox.hide();
					setFakeHeight(minHeight+verticalPadding);
					subStep = 0;
				}
			}
			leftCards = 8;
			passedCards = 0;
			selected = {4: [], 2: []};
			wasted = [];
			rank = [];
			if (!subStep) {
				ready();
			}
			return false;
		}

	})();


	// icons ranking
	function setRankable() {

		var EL_box = $(this),
			EL_podium = EL_box.find('ul.rank li'),
			EL_badgeList = EL_box.find('ul.badge li'),
			EL_badges = EL_box.find('ul.badge a'),
			EL_nextButton = EL_box.find('a.go'),
			EL_buttonBlocker = $('<div class="blocker" />'),

			selected = [-1, -1, -1],
			blankIndex = 0,
			passable = false,

			i = 0, numBadges = EL_badges.length;


		EL_box.find('ul.badge').insertBefore(EL_box.find('ul.rank'));

		setBallonControl(EL_badgeList, function(EL_balloon) {
			return EL_balloon[0].parentNode.className.indexOf('select') == -1;
		});
		for (; i < numBadges; i++) {
			EL_badgeList[i] = $(EL_badgeList[i]);
			EL_badges[i] = $(EL_badges[i]).attr('data-index', i).keydown(keyPress).click(select);
		}

		EL_buttonBlocker.appendTo(EL_nextButton.parent());
		EL_nextButton.keydown(keyPress).click(function() {
			fromKeyboard = keyPressed;
			keyPressed = false;
			var data;
			if (passable) {
				data = [];
				jQuery.each(selected, function(index) {
					// data.push(EL_badges[selected[index]][0].innerHTML);
					data.push(selected[index]);
				});
				setSelectedData(data);
				nextStep();
			}
			return false;
		});

		EL_box.bind('display', function() {
			fromKeyboard && focusFirstSelectableBadge();
		});
		reset();

		
		function select(e) {
			fromKeyboard = keyPressed;
			keyPressed = false;
			var index = parseInt(this.getAttribute('data-index'));
			if (passable) {
				alert('모든 항목이 선택 완료되었습니다.');
				fromKeyboard && EL_nextButton.focus();
			} else if (!passable && !EL_badgeList[index].hasClass('select')) {
				shot(index, blankIndex);
				EL_badgeList[index].addClass('select');
				selected[blankIndex] = index;
				check();
			}
			return false;
		}

		function deselect(e) {

			fromKeyboard = keyPressed;
			keyPressed = false;

			var EL_clicked = $(this),
				index = parseInt(this.getAttribute('data-index')),
				wastedIndex = selected[index],
				i = 0;

			if (EL_clicked.data('dead')) {
				return false;
			}

			selected[index] = -1;
			check();

			EL_badgeList[wastedIndex].removeClass('select');
			fromKeyboard && focusFirstSelectableBadge();

			// if (supportOpacity) {
			// 	EL_clicked.data('dead', true)._animate({opacity: 0}, {queue: false, duration: 150, easing: 'easeInOutQuad', complete: function() {
			// 		EL_clicked.detach();
			// 	}});
			// } else {
				EL_clicked.detach();
			// }

			return false;

		}

		function focusFirstSelectableBadge() {
			for (var i = 0; i < numBadges; i++) {
				if (!EL_badgeList[i].hasClass('select')) {
					EL_badges[i].focus();
					break;
				}
			}
		}

		function shot(index, podiumIndex) {
			var EL_medal = $([
					'<a href="#" class="'+ EL_badgeList[index].attr('class') +'">',
						'<em>', EL_badges[index][0].innerHTML, '</em>',
						'<del><em>취소하기</em></del>',
					'</a>'
				].join('')),
				origin = EL_badges[index][0].getBoundingClientRect(),
				to = EL_podium[podiumIndex].getBoundingClientRect();
			EL_medal.attr('data-index', podiumIndex).keydown(keyPress).click(deselect);
			EL_medal.appendTo(EL_podium[podiumIndex]);
			if (supportTransform) {
				EL_medal._css({translate3dX: (origin.left-to.left)/3*2, translate3dY: (origin.top-to.top)/3*2, /*zIndex: 1, */opacity: 0})
					._animate({translate3dX: 0, translate3dY: 0, opacity: 1}, {queue: false, duration: 350, easing: 'easeOutCubic', complete: function() {
						EL_medal.css('zIndex', '');
					}});
			}
		}

		function check() {
			var i = 0;
			blankIndex = 3;
			for (i = 0; i < 3; i++) {
				if (selected[i] == -1) {
					blankIndex = i;
					break;
				}
			}
			passable = blankIndex == 3;
			setButton();
			// passable && fromKeyboard && EL_nextButton.focus();
			passable && fromKeyboard && $(EL_podium[0]).find('a').focus();
		}

		function setButton() {
			if (passable) {
				EL_nextButton.removeAttr('tabIndex');
				if (supportOpacity) {
					EL_buttonBlocker._animate({opacity: 0}, {queue: false, duration: 150, easing: 'easeInOutQuad', complete: function() {
						EL_buttonBlocker.hide();
					}});
				} else {
					EL_buttonBlocker.hide();
				}
			} else {
				EL_nextButton.attr('tabIndex', -1);
				EL_buttonBlocker._stop().css('opacity', 0.75).show();
			}
		}

		function reset() {
			// var i = 0, max = selected.length;
			// for (; i < max; i++) {
			// 	EL_badgeList[selected[i]].removeClass('select');
			// }
			// EL_podium.find('a').remove();
			passable = false;
			// selected.length = 0;
			setButton();
		}

	}


	function setBallonControl(EL_sibling, checker) {

		return;

		var EL_items = EL_sibling.find('a'),
			EL_balloons = [],
			focusedIndex = -1,
			i = 0, numItems = EL_items.length;

		EL_items.focus(show).blur(hide)
			.mouseenter(show).mouseleave(hide);
		for (; i < numItems; i++) {
			EL_items[i].setAttribute('data-index', i);
			EL_balloons[i] = $(EL_items[i].parentNode).find('> span').hide();
			if (EL_balloons[i].length) {
				if (supportTransform) {
					EL_balloons[i]._css({translate3dY: 10, opacity: 0});
				}
			} else {
				EL_balloons[i] = null;
			}
		}

		function show(d, _index) {
			var index = d === true ? _index : parseInt(this.getAttribute('data-index')),
				i = 0;
			// if (d !== true && d.type == 'focus') {
			// 	focusedIndex = index;
			// }
			for (; i < numItems; i++) {
				if (EL_balloons[i]) {
					if (i == index && (!checker || (checker && checker(EL_balloons[i])))) {
						EL_balloons[i].css('display', 'block');
						if (supportTransform) {
							EL_balloons[i]._animate({opacity: 1, translate3dY: 0}, {queue: false, duration: 350, easing: 'easeOutCubic'});
						}
					} else {
						EL_balloons[i]._stop()._css({translate3dY: 10, opacity: 0, display: 'none'});
					}
				}
			}
		}

		function hide() {
			show(true, focusedIndex);
		}

	}

	function nextStep() {
		var query, index, j;
		if (!currentStep) {
			if (supportOpacity) {
				EL_steps.css('opacity', 0)._animate({opacity: 1}, {queue: false, duration: 350, easing: 'easeInOutQuad'});
			}
			EL_steps.show();
		}
		currentStep++;
		if (currentStep > 6) {
			query = [];
			for (index in selectedDatas) {
				for (j = 0; j < selectedDatas[index].length; j++) {
					selectedDatas[index][j]++;
				}
				query.push('step'+ index +'='+ selectedDatas[index].join(','));
			}

			EL_loading.html('<span></span><em>Loading...</em>').appendTo(document.body).find('span')._spriteanimation(60, 20, 'backgroundPosition', 0.75, true).data('spriteanimation').play();
// setTimeout(function() {
			location.href = $('#dt-step6 a.go').attr('href') +'?'+ query.join('&');
// }, 5000);
			// $('#dt-step6 a.go').attr('href') + 
			// trace.fixed();
			// trace.log('종료');
			// trace.log('선택된 데이터');
			// for (var i in selectedDatas) {
			// 	trace.log('step'+ i +': '+ selectedDatas[i]);
			// }
			// (function() {
			// 	var second = 7;
			// 	function check() {
			// 		if (second) {
			// 			trace.log(second +'초 후 결과페이지로 이동');
			// 			second--;
			// 			setTimeout(check, 1000);
			// 		} else {
			// 			location.href = './dreamtune_step7.html';
			// 		}
			// 	}
			// 	check();
			// })();
			return false;
		}
		changeStep();
		return false;
	}

	function jumbStep() {
		var index = parseInt(this.getAttribute('data-step'));
		if (currentStep > index) {
			currentStep = index;
			changeStep(true);
		}
		return false;
	}

	function setSelectedData(data) {
		selectedDatas[currentStep] = data;
		// console.log(selectedDatas);
	}

	function setStepItemClass(index) {
		index++;
		this.parentNode.className = index == currentStep ? 'on' : currentStep > index ? 'pass' : '';
	}

	function changeStep(isBackward) {
		// EL_current.hide();
		// EL_current = $('#dt-step'+ currentStep);
		// EL_current.show().trigger('display');
		// resize();
		// return;
		var EL_prev = EL_current;
		EL_current = $('#dt-step'+ currentStep);
		EL_prev.hide();
		EL_current.css('zIndex', 1).show();
		if (supportOpacity) {
			EL_current.css('opacity', 0)._animate({opacity: 1}, {queue: false, duration: 350, easing: 'easeInOutQuad', complete: function() {
				!isBackward && EL_current.trigger('display');
			}});
			$('html, body')._animate({scrollTop: 0}, {queue: false, duration: 500, easing: 'easeOutCubic'});
		} else {
			EL_prev.hide();
			EL_current.trigger('display');
			HANWHAIN.setScrollTop(0);
		}
		setAreaHeight(EL_current[0].offsetHeight);
		EL_stepItems.each(setStepItemClass);
	}

	function setAreaHeight(height) {
		if (supportOpacity) {
			EL_fake._stop()._animate({height: height}, {queue: false, duration: 350, easing: 'easeOutCubic', step: function(v) {
				EL_steps.css('marginTop', v.height-109);
			}});
		} else {
			setFakeHeight(height);
		}
	}

	function setFakeHeight(height) {
		EL_fake.css('height', height);
		EL_steps.css('marginTop', height-109);
	}

	function keyPress() {
		keyPressed = true;
	}

	function resize() {
		var height = EL_current[0].offsetHeight;
		setFakeHeight(height);
	}

	// test
	// nextStep();
	// nextStep();
	// nextStep();
	// nextStep();
	// nextStep();

});