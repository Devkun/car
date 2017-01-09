$.fn.extend({
	/**
	 * 자동 탭 이동
	 * $("input[name='mgr_tel2']").autoTab("input[name='mgr_tel3']");
	 */
	autoTab: function(destination) {
		$(this).keyup(function(event) {
			var maxLen = $(this).attr("maxlength");
			if ($(this).val().length >= maxLen) {
				$(destination).val("");
				$(destination).focus();
			}
		});
		return false;
	},
	/**
	 * 숫자만 입력
	 * $("input[name='mgr_tel2']").onlyNum();
	 */
	onlyNum: function() {
		$(this).css("ime-mode", "disabled");
		$(this).keypress(function(event) {
			var numPattern = /^[0-9]$/;
			var keyChar = String.fromCharCode(event.which);
			if (event.which != 13) {
				if (!numPattern.test(keyChar)) {
					return false;
				}
			}
		});
		return false;
	},
	/**
	 * 영문만 입력
	 * $("input[name='mgr_engNm']").onlyEng();
	 */
	onlyEng: function() {
		$(this).css("ime-mode", "disabled");
		$(this).keypress(function(event) {
			var engPattern = /^[a-zA-Z]$/;
			var keyChar = String.fromCharCode(event.which);
			if (event.which != 13) {
				if (!engPattern.test(keyChar)) {
					return false;
				}
			}
		});
		return false;
	},
	/**
	 * 영문, 숫자만 입력
	 * $("input[name='mgr_id']").onlyEngNum();
	 */
	onlyEngNum: function() {
		$(this).css("ime-mode", "disabled");
		$(this).keypress(function(event) {
			var engNumPattern = /^[a-zA-Z0-9]$/;
			var keyChar = String.fromCharCode(event.which);
			if (event.which != 13) {
				if (!engNumPattern.test(keyChar)) {
					return false;
				}
			}
		});
		return false;
	},
	/**
	 * checkbox에 대한 전체 체크/해제
	 *
	 * @param destination  : 체크/해제의 대상이 되는 selector
	 */
	checkedAll: function(destination) {
		$(this).click(function(event) {
			if ($(this).attr("checked") == true) {
				$(destination).attr("checked", "checked");
			} else {
				$(destination).attr("checked", "");
			}
		});
		return false;
	},
	/**
	 * 검색어 클릭 시 자동 삭제
	 * $("input[name='mgr_id']").delVal();
	 */
	delVal: function() {
		$(this).click(function(event) {
			$(this).val("");
		});
		return false;
	}
});

/**
 * 첫번째 텍스트 박스에 자동 포커스
 */
function initFocus() {
	$("input,select").each(function(i) {
		if ($(this).attr("type") != "hidden") {
			if ($(this).val() == "") {
				$(this).focus();
				return false;
			}
		}
	});
}

/**
 * 모든 텍스트 박스를 자동 탭 이동
 */
function autoTabAll() {
	var maxLen;
	$("input,select").each(function(i) {
		if ($(this).attr("maxlength") != undefined && $(this).attr("maxlength") != "") {
			$(this).keyup(function(event) {
				maxLen = $(this).attr('maxlength');
				if ($(this).val().length >= maxLen) {
					if ($(this).attr("tagName") == "SELECT" || $(this).attr("type") != "radio") {
						$("input,select").eq((i + 1)).focus();
					} else {
						$("input,select").eq((i + 1)).val("");
						$("input,select").eq((i + 1)).focus();
					}
				}
			});
		}
	});
}

/**
 * 자동 영문, 숫자만 입력
 *
 *  html 속성 값 : textType="num" 숫자만
 *  html 속성 값 : textType="eng" 영문만
 *  html 속성 값 : textType="engNum" 영문 숫자만
 *  html 속성 값 : textType="engLow" 영문 소문자만
 *  html 속성 값 : textType="engUpp" 영문 대문자만
 */
function textTypeAll() {
	$("input[type='text'],input[type='password']").each(function(i) {
		var textType = $(this).attr("textType");
		var pattern;

		if (textType != undefined && textType != "") {
			if ($(this).attr("textType") == "eng") {
				pattern = /^[a-zA-Z]$/;
			} else if ($(this).attr("textType") == "engUpp") {
				pattern = /^[A-Z ]$/;
			} else if ($(this).attr("textType") == "engLow") {
				pattern = /^[a-z ]$/;
			} else if ($(this).attr("textType") == "engNum") {
				pattern = /^[a-zA-Z0-9.]$/;
			} else if ($(this).attr("textType") == "email") {
				pattern = /^[a-zA-Z0-9._-]$/;
			} else if ($(this).attr("textType") == "pwd") {
				pattern = /^[a-zA-Z0-9._\-=~!@#$%^&*()+,<>?\/]$/;
			} else if ($(this).attr("textType") == "date") {
				pattern = /^[0-9.]$/;
			} else if ($(this).attr("textType") == "acct") {
				pattern = /^[0-9-]$/;
			} else {
				pattern = /^[0-9]$/;
			}

			$(this).css("ime-mode", "disabled");
			$(this).keypress(function(event) {
				var keyChar = String.fromCharCode(event.which);
				if (event.which != 13) {
					if (!pattern.test(keyChar)) {
						return false;
					}
				}
			});
		}
	});
}

/**
 * POST 방식으로 링크 걸기
 * @param url : 링크 주소
 * @param params : 파라미터
 * @param target : 타겟(필수 아님)
 *
 * postLink("http://naver.com", { aa: "aa", bb: "bb" }, "_blank");
 *
 */
function postLink(url, params, target) {
	var formHtml = "<form id='postLinkForm' name='postLinkForm' method='POST' action='"+url+"'>";
	if ( params.constructor == Array || params.jquery ) {
		jQuery.each(params, function() {
			formHtml += "<input type='hidden' name='"+this.name+"' value='"+this.value+"'>";
		});
	} else {
		for (var i in params) {
			if (params[i] && params[i].constructor == Array) {
				jQuery.each( params[i], function(){
					formHtml += "<input type='hidden' name='"+i+"' value='"+this+"'>";
				});
			} else {
				formHtml += "<input type='hidden' name='"+i+"' value='"+params[i]+"'>";
			}
		}
	}

	formHtml += "</form>";
	jQuery("body").append(formHtml);
	if (target != null && target != "") {
		document.postLinkForm.target = target;
	}
	$("#postLinkForm").submit();
}

/**
 * json 형식의 문자열을 json 객체로 변환
 * @param str : json 형식의 문자열
 */
function toJson(str) {
	return eval('(' + str + ')');
}

/**
 * 객체를 문자열로 변환
 * @param obj : 변환할 객체
 */
function toString(obj) {
    var str = '{\n';
    for (var p in obj)
    	str += '    ' + p + ': ' + obj[p] + '\n';
    return str + '}';
}

/**
 * 문자열 포맷터
 */
function txtFormat(txt) {
    if(arguments.length <= 1) {
        return txt;
    }

    var tokenCnt = arguments.length - 2;
    for (var token = 0; token <= tokenCnt; token++) {
    	txt = txt.replace(new RegExp("\\{" + token + "\\}", "gi"), arguments[token + 1]);
    }
    return txt;
}


  /**
   * ajaxForm() provides a mechanism for fully automating form submission.
   *
   * The advantages of using this method instead of ajaxSubmit() are:
   *
   * 1: This method will include coordinates for <input type="image" /> elements (if the element
   *    is used to submit the form).
   * 2. This method will include the submit element's name/value data (for the element that was
   *    used to submit the form).
   * 3. This method binds the submit() method to the form for you.
   *
   * The options argument for ajaxForm works exactly as it does for ajaxSubmit.  ajaxForm merely
   * passes the options argument along after properly binding events for submit elements and
   * the form itself.
   */
jQuery.fn.ajaxForm = function(options) {
		return this.ajaxFormUnbind().bind('submit.form-plugin',function() {
			jQuery(this).ajaxSubmit(options);
			return false;
		}).each(function() {
			// store options in hash
			jQuery(":submit,input:image", this).bind('click.form-plugin',function(e) {
				var form = this.form;
				form.clk = this;
				if (this.type == 'image') {
					if (e.offsetX != undefined) {
						form.clk_x = e.offsetX;
						form.clk_y = e.offsetY;
					} else if (typeof jQuery.fn.offset == 'function') { // try to use dimensions plugin
						var offset = jQuery(this).offset();
                      	form.clk_x = e.pageX - offset.left;
                      	form.clk_y = e.pageY - offset.top;
					} else {
						form.clk_x = e.pageX - this.offsetLeft;
						form.clk_y = e.pageY - this.offsetTop;
					}
				}
				// clear form vars
				setTimeout(function() { form.clk = form.clk_x = form.clk_y = null; }, 10);
			});
		});
};

  // ajaxFormUnbind unbinds the event handlers that were bound by ajaxForm
jQuery.fn.ajaxFormUnbind = function() {
	this.unbind('submit.form-plugin');
	return this.each(function() {
		jQuery(":submit,input:image", this).unbind('click.form-plugin');
	});
};


/**
 * ajax 처리 설정
 *
 * @param options 	: type - 전송방식, dataType - 결과 회신 타입,	 timeout - 요청대기시간, contentType - 한글처리 위한 설정
 */
jQuery.ajaxSetup({
	  type: "POST",
	  dataType: "json",
	  timeout: 480000,
	  contentType: "application/x-www-form-urlencoded;charset=UTF-8"
});

function setEmail(nm) {
	if ($("select[name='"+nm+"3'] option:selected").val() == "") {
		$("input[name='"+nm+"2']").val("").show().focus();
	} else {
		$("input[name='"+nm+"2']").hide();
		$("input[name='"+nm+"2']").val($("select[name='"+nm+"3'] option:selected").val());
	}
}

// 팝업 모달 창 닫기
// windowSource :iframe 인 경우 사용
function popCloseDOMWindowModal() {
	$('#DOMWindowIframe').closeDOMWindow();
}


var originalVal = $.fn.val;
$.fn.val = function (value) {
    if (typeof value == 'undefined') {
        // Getter

        if ($(this).is("textarea")) {
            return originalVal.call(this)
                .replace(/\r\n/g, '\n')     // reduce all \r\n to \n
                .replace(/\r/g, '\n')       // reduce all \r to \n (we shouldn't really need this line. this is for paranoia!)
                .replace(/\n/g, '\r\n');    // expand all \n to \r\n

            // this two-step approach allows us to not accidentally catch a perfect \r\n
            //   and turn it into a \r\r\n, which wouldn't help anything.
        }

        return originalVal.call(this);
    }
    else {
        // Setter
        return originalVal.call(this, value);
    }
};