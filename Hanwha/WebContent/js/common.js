/**
 * 지정된 URL(페이지 주소)로 이동합니다
 *
 * @param url 이동할 URL(페이지 주소)
 */
function link(url) {
	location.href = url;
}

/**
 * 지정된 URL(페이지 주소)로 이동합니다
 *
 * @param url 이동할 URL(페이지 주소)
 */
function move(url) {
	location.href = url;
}

/**
 * 팝업형태로 새창을 오픈합니다
 *
 * @param url 오픈할 URL(페이지 주소)
 * @param width 팝업 넓이
 * @param height 팝업 높이
 */
function openWin1(url, width, height) {
	openWin(url, '', width, height, '', '');
}


/**
 * 팝업형태로 새창을 오픈합니다
 *
 * @param url 오픈할 URL(페이지 주소)
 * @param width 팝업 넓이
 * @param height 팝업 높이
 * @param scroll 스크롤 여부
 */
function openWin2(url, width, height, scroll) {
	openWin(url, 'openWin', width, height, scroll, '');
}

/**
 * 팝업형태로 새창을 오픈합니다
 *
 * @param url 오픈할 URL(페이지 주소)
 * @param width 팝업 넓이
 * @param height 팝업 높이
 * @param scroll 스크롤 여부
 * @param resize 리사이즈 여부
 */
function openWin3(url, width, height, scroll, resize) {
	openWin(url, 'openWin', width, height, scroll, resize);
}


/**
 * 팝업형태로 새창을 오픈합니다
 *
 * @param url 오픈할 URL(페이지 주소)
 * @param target 타켓
 * @param width 팝업 넓이
 * @param height 팝업 높이
 * @param scroll 스크롤 여부
 * @param resize 리사이즈 여부
 */
function openWin(url, target, width, height, scroll, resize) {
	var x = window.screenLeft;
    var y = window.screenTop;
    var left = x+((document.body.offsetWidth-width)/2);
    var top = y+((document.body.offsetHeight-height)/2);

	winParams = 'height='+height+',width='+width+',top='+top+',left='+left+',scrollbars='+scroll+',resizable='+resize;
	win = window.open(url, target, winParams);
	win.window.focus();
}

/**
 * 숫자에 있는 콤마를 제거합니다.
 *
 * @param val 콤마를 제거할 문자열
 */
function delComma(val) {
	val = val.replace(/,/gi,"");

	return val;
}

function setNumberFormat(el) {
	var val = el.value;
    var minusFlag = 0;

    if (val.charAt(0) == "-") {
    	minusFlag = 1;
    }

    val = val.replace(/[^.0-9]/g ,"");
    val = val.replace(/[.]+/g ,".");

    if (minusFlag == 1) {
    	el.value = "-" + numberFormat(val);
    } else {
    	el.value = numberFormat(val);
    }
}

/**
 * 숫자 3자리마다 콤마를 추가합니다.
 *
 * @param num 콤마를 추가할 number
 */
function numberFormat(val) {
	var reg = /(^[+-]?\d+)(\d{3})/;
	var result = "" + val;

	while (reg.test(result)) {
		result = result.replace(reg, '$1' + ',' + '$2');
	}

	return result;
}

/**
 * 숫자만 입력할 수 있게 합니다.
 *
 * @param val 숫자만 남기고 걸러낼 문자열
 */
function numberOnly(val) {
	re = /[^0-9]/gi;
	return val.replace(re, "");
}

/**
 * 숫자만 입력되었는지 확인한다.
 */
function inputNumberOnly(val) {
  	re = /[^0-9]/gi;
  	return re.test(val);
}

/**
 * 한글만 입력할 수 있게 합니다.
 */
function koreanOnly(str) {
	var pattern = /[가-힝]+/;
	if(pattern.test(str)) { // 정상
		return true;
	} else { // 비정상
		return false;
	}
}

/**
 * 영문만 입력할 수 있게 합니다.
 *
 * @param val 영문만 남기고 걸러낼 문자열
 */
function engOnly(val) {
	re = /[^a-zA-Z]/gi;
	return val.replace(re, "");
}

/*
 *	영문, 숫자만 입력할 수 있게 합니다.
 */
function engNumberOnly(str) {
	var pattern = /^([0-9a-z](?:(?:(?:\w[\.\_]?)*)\w)+)([a-z0-9])$/i;
	if(pattern.test(str)) {
		return true;
	} else {
		return false;
	}
}

function chkEngNum(str) {
	var pattern = /^[a-zA-Z0-9]{6,15}$/;
	var patternEng = /[a-zA-Z]/;
	var patternNum  = /[0-9]/;
	if(!(pattern.test(str) && patternEng.test(str) && patternNum.test(str))) {
		return true;
	}
}

/**
 * 한글, 숫자, 특수문자는 입력할 수 없게하고 alert을 띄워줌.
 *
 * @param val 검사할 문자열
 */
function engOnlyAlert(txt) {
	var cnt = 0;

	for(i = 0; i < txt.length; i++) {
		if((txt.charCodeAt(i) >= 65 && txt.charCodeAt(i) <= 122) || txt.charCodeAt(i) == 32) {
			// ascii
		} else {
			// not ascii
			cnt++;
		}
	}
	if(cnt > 0) alert("한글, 숫자, 특수문자는 입력하실 수 없습니다.");
	return (cnt > 0) ? false : true;
}

/**
 * 가장 앞 부분에는 0을 붙일 수 없게 함.
 *
 * @param val 문자열
 */
function numberLimitZero(val) {
	return val.substring(0, 1) == 0 ? '' : val;
}

/**
  * 숫자를 한글(숫자)문자로 변환한다
  * @param val - 숫자 또는 숫자 문자열
  * 사용예) numberToHan(12345) = "만이천삼백사십오"
  *
  * ( 참고URL:/meritzfire/wbiz/page/cyberservice/loan/loan_propose.do )
  */
function numberToHan(val) {
	var num;
	var result = "";

	if(!val || val.substr(0,1) == 0) {
		return result;
	} else {
		num = parseInt(val);
	}
	num += "0000";

	hn = new Array("영","일","이","삼","사","오","육","칠","팔","구");
	hj = new Array("","만","억","조","경","해","시","양","구","간","정","재","극","항하사","아승지","나유타","불가사의","무량대수");
	ul = new Array("영천","영백","영십","영");
	tm = new Array();

	if (num.charAt(0)=="-") {
		result = "마이너스 ";
		num = num.substr(1,num.length-1);
	}

    loop_size = Math.ceil(num.length/4);
    num2 = "";

    for (count=num.length; count >= 0; count--) {
    	num2 += num.substring(count,count-1);
    }
    num = num2;

    for (i=0;i<loop_size;i++) {
    	sum = hj[i] + " ";
        tm[i] = num.substr(i*4,4);

        tm2 = "";
    	for (count=tm[i].length; count >= 0; count--) {
			tm2 += tm[i].substring(count,count-1);
		}
 		tm[i] = tm2;
		part_jari = tm[i].length;

        for (j=0;j<10;j++) {
			for (k=0;k<10;k++) {
				tm[i] = tm[i].replace(k,hn[k]);
			}
        }

		if (part_jari == 4) {
			tm[i] = tm[i].charAt(0)+"천"+tm[i].charAt(1)+"백"+tm[i].charAt(2)+"십"+tm[i].charAt(3);
		} else if (part_jari == 3) {
			tm[i] = tm[i].charAt(0)+"백"+tm[i].charAt(1)+"십"+tm[i].charAt(2);
		} else if (part_jari == 2) {
			tm[i] = tm[i].charAt(0)+"십"+tm[i].charAt(1);
		} else {
			tm[i] = tm[i].charAt(0);
		}

		for (l=0;l<4;l++) {
            if (tm[i].match(ul[l])) {
            		part_jari--; tm[i] = tm[i].replace(ul[l],"");
            }
		}

        if (part_jari != 0) {
        	tm[i] += sum;
        }
	}

	for (loop_size;loop_size>-1;loop_size--) {
		result += tm[loop_size];
	}

    result = result.replace("undefined","");

    return result;
}

function getSex(juminNo2) {
	var sexFlag = juminNo2.substring(0,1);
	if (sexFlag == "1" || sexFlag == "3") {
		return "1"; // 남성
	} else{
		return "2"; // 여성
	}
}

/**
 * 주민번호로 나이를 가져온다
 * @param juminNo
 * @return
 */
function getAge(juminNo1, juminNo2) {
	//연, 월, 일 가져오기
	var ju1 = juminNo1.substr(0,2);
	var ju2 = juminNo1.substr(2,2);
	var ju3 = juminNo1.substr(4,2);

	//주민번호 뒤번호 앞자리 가져오기
	var ju4 = juminNo2.substr(0,1);
	var year;

	if ("3478".indexOf(ju4) != -1) { //주민번호 뒷자리 첫번째가 3또는 4또는 7또는 8 이라면(7, 8은 우리나라 외국인 거주자)
	    year = "20" + ju1;
	} else {
	    year = "19" + ju1;
	}

	var nowDate = new Date();
	var nowYear = nowDate.getYear();

	return (parseInt(nowYear) - parseInt(year) + 1);
}

function check14Age(juminNo1, juminNo2) {
	//연, 월, 일 가져오기
	var ju1 = juminNo1.substr(0,2);
	var ju2 = juminNo1.substr(2,2);
	var ju3 = juminNo1.substr(4,2);
	var ju4 = juminNo2.substr(0,1);

	if ("3478".indexOf(ju4) != -1) { //주민번호 뒷자리 첫번째가 3또는 4또는 7또는 8 이라면(7, 8은 우리나라 외국인 거주자)
	    year = "20" + ju1;
	} else {
	    year = "19" + ju1;
	}

	var birthDate = year + "-" + ju2 + "-" + ju3;
	var chkDate = addYear(birthDate, 14);

	chkDate = parseInt(chkDate.replace(/-/gi, ""));
	nowDate =  parseInt(formatDate(new Date(), "yyyyMMdd"));

	if (chkDate > nowDate) {
		return false;
	} else {
		return true;
	}
}

function getManAge(str) {
	if(str == "" || str == null){
		alert("주민번호를 입력하십시요!");
		return -1;
	}

	year1    = str.substring(0, 2);
	mm1      = str.substring(2, 4);
	dd1      = str.substring(4, 6);

	//2007-06-27
	//2010년을 기준으로
	//주민번호 앞 두자리가 10 이상인 경우는 1900년대생으로 판단
	//주민번호 앞 두자리가 10 이하인 경우는 2000년대생으로 판단
	//2100년 이후에는 이함수는 사용할수 없음
	if (eval(year1 > 10))
	{
		year1 = "19" + year1;
	} else {
		year1 = "20" + year1;
	}


	day = new Date();
	year2 = day.getYear();
	mm2   = day.getMonth() + 1;
	dd2   = day.getDate();
	age = year2 - year1;
	if((mm2 - mm1) < 0){
			age--;
	}else if((mm2 - mm1) == 0){
		if((dd2 - dd1) < 0)	age--;
	}

	return age;
}

function getFileSize(filePath) {
	var len = 0;
	if ( navigator.appName.indexOf("Netscape") != -1) {
		try {
			netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
		} catch(e) {
			alert("signed.applets.codebase_principal_support를 설정해주세요!\n"+e);
			return -1;
		}
		try {
			var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
			file.initWithPath ( filePath );
			len = file.fileSize;
		} catch(e) {
			alert("에러 발생:"+e);
		}
	} else if (navigator.appName.indexOf('Microsoft') != -1) {
		var img = new Image();
		img.dynsrc = filePath;
		len = img.fileSize;
	}
	return len;
}

/*
 * 파일 다운로드시 파일 가능여부 체크 한 후
 * 다운로드 할 파일이 존재하지 않으면 경고창을 출력한다
 *
 *  @param url 다운로드 할 파일 주소(URL)
*/
function checkDownLoad(url, queryString) {
	var xmlHttp;

	if(window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else if(window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }

	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState == 4) {
			if(xmlHttp.status == 200) {
				if (queryString != null && queryString != "") {
					window.location.href = url + "?" + queryString;
				} else {
					window.location.href = url;
				}
			} else {
				alert("죄송합니다. 파일이 검색되지 않습니다.\n\n상담신청으로 문의하여 주시면 고맙겠습니다.");
			}
		}
	};

	if (queryString != null && queryString != "") {
		xmlHttp.open("GET", url, true);
	} else {
		xmlHttp.open("GET", encodeURI(url + "?" + queryString), true);
	}
	xmlHttp.send(null);
}

// 자바스크립트 request 객체
var Request = function() {
    this.getParameter = function(name) {
        var rtnval = '';
        var nowAddress = unescape(location.href);
        var parameters = (nowAddress.slice(nowAddress.indexOf('?')+1,nowAddress.length)).split('&');

        for(var i = 0 ; i < parameters.length ; i++) {
            var varName = parameters[i].split('=')[0];
            if(varName.toUpperCase() == name.toUpperCase()) {
                rtnval = parameters[i].split('=')[1];
                break;
            }
        }
        return rtnval;
    }
}

var request = new Request();

//form 태그 생성후 POST로 이동시키기
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
	document.postLinkForm.submit();
}


/**
 * jQuery를 이용한 checkbox에 대한 전체 체크/해제
 *
 * @param target 	: 체크/해제의 대상이 되는 name 값
 * @param chkVal 	: true, false 값을 전달받아 체크/해제의 조건으로 사용
 * 12.23 최형석 수정
 */
function allCheck(target, booleanVal){
	jQuery("input[name='" + target + "']").prop("checked", booleanVal);
	/*
	if (booleanVal){
		jQuery("input[name='" + target + "']").attr("checked", "checked");
		
	} else {
		jQuery("input[name='" + target + "']").prop("checked", false);
	}
	*/
}

 /**
  * 입력 태그의 값을 반환해줌
  * param tagType : 입력태그 종류
  * param name    : 입력태그에 지정한 name 속성값
  * return        : 하나로 합쳐진 값을 반환함(값이 없을경우 ""로 반환)
  */
function getVal(tagType, name){
	  var val = jQuery(tagType + "[name='" + name + "']").val();
	  if(val == null){
		  val = "";
	  }
	  return val ;
}

 /**
  * 입력 태그의 값을 넣기
  * param tagType : 입력태그 종류
  * param name    : 입력태그에 지정한 name 속성값
  * param value   : 입력태그에 넣을 value 속성값
  */
function setVal(tagType, name, value){
	jQuery(tagType + "[name='" + name + "']").val(value);
}



/**
 * 이미지 리사이즈
 *
 * imgResize(this, 100, 100);
 */
function imgResize(i, maxW, maxH) {
	if(!maxW || !maxH ) {
		return;
	}
	var maxWidth = maxW;
	var maxHeight = maxH;

	var orgWidth = i.width;
	var orgHeight = i.height;

	var newWidth = orgWidth;
	var newHeight = orgHeight;

	var scaleWW = orgWidth/maxWidth;
	var scaleHH = orgHeight/maxHeight;

	// Determine the scale.
	if(orgWidth > maxWidth || (orgHeight > maxHeight && maxHeight > 0)){
		if(scaleWW > scaleHH || maxHeight == 0){
			newWidth = maxWidth;
			newHeight = Math.round(orgHeight/scaleWW);
		} else {
			newHeight = maxHeight;
			newWidth = Math.round(orgWidth/scaleHH);
		}
	}

	// 리사이즈한 크기로 이미지 크기 다시 지정
	i.width = newWidth;
	i.height = newHeight;
}



 /**
  * 문자 사이의 공백을 제거한다.
  * @param str  공백제거할 문자열
  * @return  공백제거된 문자열
  */
function removeBlank(str){
	if (str != null){
		str = str.replace(/\s/g,'');
	} else {
		str = "";
	}
	return str;
}


//한글등을 2글자로 처리하는 문자열길이 구하는 함수
function strByteLength(str){
	totalByte = 0;
	if (str != null){
		if (str.length > 0){
			for (var i = 0; i < str.length; i++) {
				if (escape(str.charAt(i)).length > 4){
					 totalByte += 2;
				} else {
					 totalByte++;
				}
			}
		}
	}

	return totalByte;
}


//textArea 글자수 제한(this, 한글[2byte]제한수)
function checkStrLen(obj, maxlen){
	var temp;
	var msglen;
	var msglen = maxlen*2;
	var strValue = obj.value;

	var strLen = strValue.length;
	var tmpstr = "" ;

	if (strLen == 0){
		value = maxlen * 2;
	} else {
		for(var k=0; k < strLen; k++){
			temp = strValue.charAt(k);

			if (escape(temp).length > 4){
				msglen -= 2;
			} else {
				msglen--;
			}

			if(msglen < 0){
				alert("총 영문 " + (maxlen*2) + " 자 또는 한글 " + maxlen + " 자 까지만 입력할 수 있습니다");
				obj.value=tmpstr;
				break;
			} else {
				tmpstr += temp;
			}
		}
	}
}

//특수문자를 제거
function specialTextRemove(str){
	if (str == null || str == ""){
		str = "";
	} else {
		//str = str.replace(/[#\&\+\-%@=\/\\\:;,\.'\"\^`~\_|\!\?\*$#<>()\[\]\{\}]/g, "");
		str = str.replace(/[#\&\\;\'\`|#<>]/g, "");
	}
	return str;
}


/**
 * 현재화면 프린트 팝업
 * @param width = arguments[0]
 */
function popupPrint(){
	var width = 1000;
	if( arguments[0] ) {
		width = arguments[0];
	}
	var opt = "width=" + width + ", height=600, left=200, top=200, scrollbars=yes";
	window.open('?print=true&margin=true','printPopup',opt);
}

/**
 * 검색 일자 설정
 * dateCount("1y", "#schStrtYmd", "#schEndYmd");
 *
 * 종료 일자 필드는 오늘 날짜가 입력됨.
 *
 * @param v		: 기간(0d, 1m, 7d, 등 )
 * @param sId : 시작 일자 필드
 * @param eId : 종료 일자 필드
 * @return
 */
function dateCount(v, sId, eId) {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var day = now.getDate();


	// 오늘
	if (v == "0d"){
	}
	// 일주일
	else if( v == "-7d") {
		day = day - 7;
	}
	// 보름
	else if( v == "-15d") {
		day = day - 15;
	}
	// 1개월
	else if( v == "1m") {
		day = day + 1;
		month = month - 1;
	}
	// 3개월
	else if( v == "3m") {
		day = day + 1;
		month = month - 3;
	}
	// 6개월
	else if( v == "6m") {
		day = day + 1;
		month = month - 6;
	}
	// 1년
	else if( v == "1y"){
		day = day + 1;
		year = year - 1;
	}
	// 어제
	else if(v == "-1d" ) {
		day = day - 1;
	}
	// 이번달
	else if( v == "0m") {
		day = 1;
	}


	if( sId ) {
		jQuery(sId).val(jQuery.datepicker.formatDate("yy-mm-dd", new Date(year, month, day)));
	}

	if( eId ){
		if(v == "-1d" ) {
			jQuery(eId).val(jQuery.datepicker.formatDate("yy-mm-dd", new Date(year, month, day)));
		} else {
			jQuery(eId).val(jQuery.datepicker.formatDate("yy-mm-dd", new Date()));
		}
	}
}

/**
 * 숫자만 입력받기
 * <input type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>
 * @param event
 * @returns {Boolean}
 */
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) {
        return;
    } else {
        return false;
    }
}
function removeChar(event, commaFlag) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if (keyID == 9 || keyID == 46 || keyID == 37 || keyID == 39 ) {
        return;
    } else {
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
        if(commaFlag == "Y"){
        	event.target.value = numberFormat(event.target.value);
        }
    }
}

/**
 * 문자열 바이트 알아내기
 * @param msg
 * @returns {Number}
 */
function calculateMsglen(msg) {
	var nbytes = 0;
	for (i=0; i<msg.length; i++) {
		var ch = msg.charAt(i);
		if(escape(ch).length > 4) {
    		nbytes += 2;
    	} else if (ch == '\n') {
    		if (msg.charAt(i-1) != '\r') {
    			nbytes += 1;
    		}
    	} else if (ch == '<' || ch == '>') {
			nbytes += 4;
		} else {
			nbytes += 1;
    	}
    }
	return nbytes;
}