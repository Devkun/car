<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=1004">
<meta name="title" content="한화그룹 채용사이트 한화in">
<meta name="description" content="한화그룹 채용사이트 한화인, 계열사 신입채용/경력채용/인턴채용 등 지원서 온라인접수, 채용절차 확인, 채용 관련 콘텐츠 수록">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>실명인증하기&lt;회원가입&lt;한화인 채용사이트</title>

<meta property="og:type" content="website">
<meta property="og:site_name" content="Hanwhain">
<meta property="og:title" content="Hanwhain">
<meta property="og:description" content="한화그룹 온라인 채용사이트">
<meta property="og:image" content="http://www.hanwhain.com/Hanwha/images/favicon/social.jpg"><!-- full url -->
<link rel="shortcut icon" type="image/x-icon" href="/Hanwha/images/favicon/favicon.ico">
<meta name="apple-mobile-web-app-title" content="Hanwhain">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon57.jpg" sizes="57x57">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon72.jpg" sizes="72x72">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon76.jpg" sizes="76x76">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon114.jpg" sizes="114x114">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon120.jpg" sizes="120x120">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon144.jpg" sizes="144x144">
<link rel="apple-touch-icon" href="/Hanwha/images/favicon/icon152.jpg" sizes="152x152">
<meta name="msapplication-TileImage" content="/Hanwha/images/favicon/win8-144.jpg">
<meta name="msapplication-TileColor" content="#f17330">
<meta name="application-name" content="Hanwhain">
<meta name="msapplication-square70x70logo" content="/Hanwha/images/favicon/ie11-70.jpg">
<meta name="msapplication-square150x150logo" content="/Hanwha/images/favicon/ie11-150.jpg">
<meta name="msapplication-wide310x150logo" content="/Hanwha/images/favicon/ie11-310-wide.jpg">
<meta name="msapplication-square310x310logo" content="/Hanwha/images/favicon/ie11-310-square.jpg">

<link rel="stylesheet" href="/Hanwha/css/style.css">
<script src="/Hanwha/js/jquery-1.11.2.min.js"></script>
<script src="/Hanwha/js/jquery-d.js"></script>
<script src="/Hanwha/js/jquery-fakeform-0.5.js"></script>
<script src="/Hanwha/js/hanwhain.js"></script>
<script src="/Hanwha/js/common.js"></script>
<script src="/Hanwha/js/jquery.common.js"></script>
<script src="/Hanwha/js/bookmark.js"></script>
<script src="/Hanwha/js/facebook.js"></script>
<!--[if lt IE 9]>
<script src="/Hanwha/js/html5.js"></script>
<![endif]-->


<script type="text/javascript">
	if(window.location.protocol == "https:") {
		location.href="http://www.hanwhain.com/Hanwha/member/join/step2.do"
	}

	$(document).ready(function() {
		$("#agree1, #agree2").click(function() {
			if ($("#agree1").is(":checked") && $("#agree2").is(":checked")) {
				$("#agree_all").prop("checked", true).fakecheck();
			} else {
				$("#agree_all").prop("checked", false).fakecheck();
			}
		});
	});

	/* 확인버튼 유효성체크 */
	function goMobilePhoneCertification() {
		if ($("#agree1").is(":checked") == false) {
			alert("이용약관에 동의해주세요.");
			$("#agree1").focus();
			return;
		}

		if ($("#agree2").is(":checked") == false) {
			alert("개인정보 수집 및 이용목적에 대해 동의해주세요.");
			$("#agree2").focus();
			return;
		}
		$("#agreeForm").submit();
		
		
	
/* 		jQuery.getJSON("/Hanwha/certification/checkplus_sEncData.do", function(data) {
			if ($.trim(data.sMessage) == "") {
				$("#mobilePhoneCertificationForm").find("input[name='EncodeData']").val(data.sEncData);
				$("#mobilePhoneCertificationForm").find("input[name='param_r2']").val($("input[name='tp']:checked").val());
				
				window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				$("#mobilePhoneCertificationForm").attr("action", "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb");
				$("#mobilePhoneCertificationForm").attr("target", "popupChk");
				$("#mobilePhoneCertificationForm").submit();
			} else {
				alert(data.sMessage);
			}
		}); */
	}
	
/* 	function goIpinCertification() {
		if ($("#agree1").is(":checked") == false) {
			alert("이용약관에 동의해주세요.");
			$("#agree1").focus();
			return;
		}

		if ($("#agree2").is(":checked") == false) {
			alert("개인정보 수집 및 이용목적에 대해 동의해주세요.");
			$("#agree2").focus();
			return;
		}
		
		jQuery.getJSON("/Hanwha/certification/ipin_sEncData.do", function(data) {
			if ($.trim(data.sRtnMsg) == "") {
				$("#ipinCertificationForm").find("input[name='enc_data']").val(data.sEncData);
				$("#ipinCertificationForm").find("input[name='param_r2']").val($("input[name='tp']:checked").val());
				
				window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
				$("#ipinCertificationForm").attr("action", "https://cert.vno.co.kr/ipin.cb");
				$("#ipinCertificationForm").attr("target", "popupIPIN2");
				$("#ipinCertificationForm").submit();
			} else {
				alert(data.sMessage);
			}
		});
	} */
	
	function goSendEmailPopup() {
		if ($("#agree1").is(":checked") == false) {
			alert("이용약관에 동의해주세요.");
			$("#agree1").focus();
			return;
		}

		if ($("#agree2").is(":checked") == false) {
			alert("개인정보 수집 및 이용목적에 대해 동의해주세요.");
			$("#agree2").focus();
			return;
		}
		
		window.open('./email_popup.do', 'popupChk', 'width=485, height=350, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	}
	
	function goTestPage() {
	
	}
</script>

<script type="text/javascript">
    /**
    미제출 지원서
    */
    function fnIndexViewApplyDetail(param) {
        var keys = ['rtSeq'],
        values = [param],
        params = keys.reduce(function (previous, key, index) {
            previous[key] = values[index];
            return previous
        }, {})
        postLink("/Hanwha/apply/resume/personal_info.do", params, "_self");
    }
</script>
</head>
<body  >
<div id="wrap">
	<!-- Header -->
<jsp:include page="/inc/header.jsp"/>
	<!-- // Header -->
	
	<!-- Container -->
	<div id="container" class="wide">
		
		<section id="contents">
			<span class="blind">본문</span>
            <!-- Contents -->
                
<!-- Contents -->
<h2 class="blind">회원가입</h2>

<section class="login">
	<ul class="steps">
		<li>가입방법 선택하기</li>
		<li class="on">실명인증하기<em>(현재페이지)</em></li>
		<li>정보입력하기</li>
		<li>가입완료</li>
	</ul>
	
	<form id="agreeForm" method="post" action="./step3.do" >
	<fieldset class="agreement">
	<legend>이용약관, 개인정보 수집 및 이용에 모두 동의</legend>
		<h3 class="blind">이용약관, 개인정보 수집 및 이용에 모두 동의</h3>
		<label for="agree_all">이용약관, 개인정보 수집 및 이용에 모두 동의합니다. <input type="checkbox" name="" id="agree_all" value="" class="colored" /></label>
		
		<label for="agree1">이용약관 동의(필수)<input type="checkbox" name="" id="agree1" value="" class="colored"></label>
		<textarea title="이용약관" readonly>
제1조 (목적)
이 약관은 한화그룹 (이하 "회사")이 제공하는 온라인 채용 웹사이트 서비스 (이하 "서비스")의 이용조건 및 절차, 회사와 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다.

제2조 (약관의 효력과 개정)
1. 이 약관은 웹사이트를 통하여 이를 공지하거나 전자우편 등 기타의 방법으로 이용자에게 통지함으로써 효력이 발생합니다. 
2. 회사는 본 약관을 사전 고지 없이 개정할 수 있으며, 개정된 약관은 제9조에 정한 방법으로 공지합니다. 회원은 개정된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 개정에 대한 동의로 간주됩니다. 개정된 약관은 공지와 동시에 그 효력이 발생됩니다.

제3조 (약관 이외의 준칙)
이 약관에 명시되어 있지 않은 사항은 전기통신 기본법, 전기통신 사업법, 기타 관련법령의 규정에 따릅니다.

제4조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
가. 회원: 서비스에 개인정보를 제공하여 회원등록을 한 자로서, 서비스의 정보를 지속적으로 제공받으며, 이용할 수 있는 자를 말합니다. 
나. 아이디 (ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 입력한 문자와 숫자의 조합을 말합니다. 
다. 비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합을 말합니다. 
라. 이메일주소: 인터넷을 통한 우편입니다. 
마. 해지: 회사 또는 회원이 서비스 이용 이후 그 이용계약을 종료시키는 의사표시를 말합니다. 
바. 웹사이트: 회사가 이용자에게 서비스를 제공하기 위하여 컴퓨터 등 정보통신설비를 이용해 이용자가 열람 및 이용할 수 있도록 설정한 가상의 서비스 공간을 말합니다.

제5조 (서비스의 제공 및 변경)
1. 회사가 제공하는 서비스는 다음과 같습니다. 
가. 회사 정보
나. 채용 정보 
다. 각종 이벤트 정보 
라. 회사의 온라인 입사지원 서비스
마. 회사는 필요한 경우 서비스의 내용을 추가 또는 변경하여 제공할 수 있습니다.

제6조 (서비스의 중단)
1. 회사는 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 
2. 제 1항에 의한 서비스 중단의 경우에는 제 9조에 정한 방법으로 이용자에게 통지합니다.
회사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상하지 아니합니다. 단, 회사에 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.

제7조 (회원가입)
1. 이용자는 회사가 정한 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다. 
2. 회사는 제 1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다. 
가. 이름이 실명이 아닌 경우 
나. 등록 내용에 허위, 기재누락, 오기가 있는 경우 
다. 타인의 명의를 사용하여 신청한 경우 
라. 가입신청자가 이 약관 제 8조 3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우(단, 제 8조 3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.) 
마. 14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
바. 기타 회원으로 회사 소정의 이용신청요건을 충족하지 못하는 경우
3. 회원가입계약의 성립시기는 회원가입이 완료된 시점으로 합니다.
4. 회원은 제 10조 1항에 의한 등록사항에 변경이 있는 경우 회원정보변경 항목을 통해 직접 변경사항을 수정, 등록하여야 합니다.

제8조 (회원탈퇴 및 자격 상실 등)
1. 회원은 언제든지 웹사이트에서 탈퇴할 수 있으며, 본인이 직접 온라인을 통해 탈퇴 신청을 해야 합니다.
2. 회원 가입시 입력한 개인정보는 재가입 방지를 위해 회원 탈퇴 요청 후 3개월간 보유되며, 이후 일괄 파기됩니다.
3. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다. 
가. 회원가입 신청 시 허위 내용을 등록한 경우 
나. 타인의 서비스 이용을 방해하거나 그 정보를 도용하는 등 서비스 운영질서를 위협하는 경우 
다. 서비스를 이용하여 법령과 이 약관이 금지하거나, 공서양속에 반하는 행위를 하는 경우 
라. 제 13조 에 명기된 회원의 의무사항을 준수하지 못할 경우
4. 회사가 회원자격을 제한/정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원자격을 상실 시킬 수 있습니다. 
5. 회사가 회원자격을 상실 시키는 경우 회원에게 이를 통지하고 탈퇴를 처리합니다. 이 경우 회원에게 이를 통지하고, 탈퇴 전에 소명할 기회를 부여합니다.

제 9조 (이용자에 대한 통지)
1. 회사가 이용자에 대한 통지를 하는 경우, 이용자가 가입하신 아이디를 활용할 수 있습니다. 
2. 회사가 불특정 다수 이용자에 대해 통지를 하는 경우 1주일 이상 서비스 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.

제 10조 (개인 정보 보호)
1. 회사는 회원가입을 위한 이용자 정보 수집 시 회사측이 필요한 최소한의 정보를 수집합니다.
다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
가.	성명 
나.	성별
다. 생년월일
라. 희망 아이디(ID)
마. 비밀번호
바. 이메일주소
사. 휴대전화번호
2. 회사가 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. 
3. 제공된 개인정보는 당해 이용자의 동의 없이 제 3자에게 제공할 수 없으며, 이에 대한 모든 책임은 회사가 집니다. 다만 다음의 경우에는 예외로 합니다. 
가. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 
나. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 
다. 관계법령에 의하여 국가기관으로부터 요구 받은 경우 
라. 범죄에 대한 수사상의 목적이 있거나, 정보통신 윤리위원회의 요청이 있는 경우 
마. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
4. 이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 할 수 있습니다. 다만 다음의 경우에는 예외로 합니다.
가. 온라인 서류접수 마감 후 평가가 진행되고 있는 기간 중 평가에 영향을 줄 수 있는 정보
5. 회사로부터 개인정보를 제공받은 제 3자는 개인정보를 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.

제 11조 (회사의 의무)
1. 회사는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야만 합니다. 
2. 회사는 서비스에 관련된 설비를 항상 운용할 수 있는 상태로 유지/보수하고, 장애가 발생하는 경우 지체 없이 이를 수리/복구할 수 있도록 최선의 노력을 다하여야 합니다. 
3. 회사는 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안시스템을 갖추어야 합니다. 
4. 회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제 12조 (회원의 ID 및 비밀번호에 대한 의무)
1. 회원에게 부여된 아이디(ID)와 비밀번호의 관리책임은 회원에게 있으며 관리 소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. 
2. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제 3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.

제 13조 (회원의 의무)
1. 회원은 관계법령, 본 약관의 규정, 이용안내 및 주의사항 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.
2. 회원은 회사의 사전승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다. 
3. 회원은 서비스를 이용하여 얻은 정보를 회사의 사전승낙 없이 복사, 복제, 변경, 번역, 출판/방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다. 
4. 회원은 자기 신상정보의 변경사항 발생시 즉각 변경하여야 합니다.
회원정보를 수정하지 않아 발생하는 모든 결과에 대한 책임은 회원에게 있습니다. 
5. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하지 않아야 하며, 다음 행위를 함으로 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
가. 다른 회원의 아이디(ID)를 부정하게 사용하는 행위 
나. 다른 회원의 E-mail 주소를 취득하여 스팸메일을 발송하는 행위 
다. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 
라. 선량한 풍속, 기타 사회질서를 해하는 행위 
마. 회사 및 타인의 명예를 훼손하거나 모욕하는 행위 
바. 회사 및 타인의 지적재산권 등의 권리를 침해하는 행위
사. 해킹행위 또는 컴퓨터 바이러스의 유포행위 
아. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
자. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
차. 회사가 제공하는 서비스의 내용을 변경하는 행위 
카. 기타 관계법령에 위배되는 행위

제 14조 (게시물 삭제)
1. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나, 다음 각 호에 해당한다고 판단되는 경우 사전통지 없이 게시물을 삭제할 수 있습니다. 
가. 다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용 
나. 공공질서 또는 미풍양속에 위반되는 내용 
다. 범죄적 행위에 결부된다고 인정되는 내용 
라. 제 3자의 저작권 등 기타 권리를 침해하는 내용 
마. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 내용 
바. 근거나 확인절차 없이 회사를 비난하거나 유언비어를 유포한 내용 
사. 기타 관계법령에 의거하여 위반된다고 판단되는 내용
2. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나 동 조 제1항 각 호에 해당한다고 판단되는 정보를 링크하고 있을 경우 사전통지 없이 게시물을 삭제할 수 있습니다.

제 15조 (게시물에 대한 권리 / 의무)
게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 이용자에게 있습니다.

제 16조 (저작권의 귀속 및 이용제한)
1. 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속합니다. 
2. 이용자는 서비스를 이용함으로써 얻은 정보를 회사의 사전승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.

제 17조 (양도금지)
회원이 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.

제 18조 (손해배상)
회사는 무료로 제공되는 서비스와 관련하여 이용자에게 어떠한 손해가 발생하더라도 동 손해가 회사의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부여하지 아니합니다.

제 19조 (면책 / 배상)
1. 회사는 이용자가 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 이용자는 자신의 책임 아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있습니다. 
2. 회사는 제 13조의 규정에 위반하여 이용자간 또는 이용자와 제 3자간에 서비스를 매개로 한 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 이용자가 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다. 
3. 이용자가 제 13조, 기타 이 약관의 규정을 위반함으로 인하여 회사가 이용자 또는 제 3자에 대하여 책임을 부담하게 되고, 이로써 회사에 손해가 발생하게 되는 경우, 이 약관을 위반한 이용자는 회사에 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 회사를 면책시켜야 합니다.

제 20조 (분쟁의 해결)
1. 회사와 이용자는 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.
2. 제 1항의 규정에도 불구하고, 동 분쟁으로 인하여 소송이 제기될 경우 본사의 소재지 관할 법원을 관할로 합니다.
		</textarea>
		
		<label for="agree3">개인정보 수집 및 이용에 대한 동의(필수) <input type="checkbox" name="agree2" id="agree2" value="" class="colored"></label>
		<textarea title="개인정보 수집 및 이용" readonly>
1) 수집하는 개인정보 항목
한화그룹 온라인 채용 홈페이지(hanwhain.com)는 별도의 회원가입 없이 대부분의 컨텐츠에 접근할 수 있으나, 입사지원 및 알림, 문의 등의 서비스를 이용하시고자 할 경우 다음의 최소한의 필수 정보를 입력해주셔야 합니다. 
- 성명, 성별, 국적, 생년월일, ID, 비밀번호, 이메일주소, 휴대전화번호
2) 수집 및 이용목적
  - 성명, 성별, 생년월일, ID, 비밀번호 : 회원 본인식별 절차에 이용
  - 이메일주소, 휴대전화번호 : 회원 맞춤서비스(공고알림, 관심직무등) 및 안내(회사소식/관심정보/임시비밀번호등) 서비스에 이용
3) 개인정보 보유기간
  - 회원 가입 시 입력한 개인정보는 재가입 방지를 위해 회원 탈퇴 요청 후 3개월간 보유되며, 이후 일괄 파기됩니다.
4) 동의를 거부할 권리 및 동의 거부에 따른 불이익
- 지원자는 본 안내에 따른 개인정보의 수집, 이용 등과 관련한 위 사항에 대하여 원하지 않는 경우 동의를 거부할 수 있습니다.
- 다만, 본 안내에 따른 개인정보의 수집, 이용 등과 관련한 위 사항은 회사의 공정한 채용전형에 있어 필수적인 항목으로 이에 대하여 동의하지 않는 경우 회원가입 및 채용전형에 지원이 불가능하다는 점을 유념하시기 바랍니다.
		</textarea>

		<p>각 항목에 체크하면 동의한 것으로 간주합니다. (필수) 항목에 동의하지 않으면 회원 가입이 불가능합니다.</p>
	
		<script>
		// 체크박스 전체 선택 샘플
		$('#agree_all').change(function() {
			$('#agree1, #agree2').prop('checked', this.checked).fakecheck();
		});
		</script>
		
		<h4>개인정보 위탁 고지</h4>
		<ul>
			<li>수탁자 <strong>한화S&amp;C(주)</strong></li>
			<li>위탁업무 <strong>그룹 채용시스템 관리/운영 유지보수</strong></li>
		</ul>
		
		<p>
			<label for="tp1"><input type="radio" name="tp" id="tp1" value="1" checked="checked" /> 내국인입니다.</label>
			<label for="tp2"><input type="radio" name="tp" id="tp2" value="2" /> 외국인입니다.</label>
		</p>
		
		<div class="btn-area">
				<input type="button" value="확인" onclick="javascript:goMobilePhoneCertification();" class="btn big phone">
				<!-- <a href="javascript:goMobilePhoneCertification();" class="btn big phone" title="팝업띄움">휴대폰 인증하기</a> -->
			</div>
		</div>


	<!-- 인증방식 선택  -->
<!-- 		<h3>인증 방식을 선택해주세요</h3>
				<div>
			<div class="btn-area">
				<a href="javascript:goMobilePhoneCertification();" class="btn big phone" title="팝업띄움">휴대폰 인증하기</a>
				<a href="javascript:goIpinCertification();" class="btn big ipin" title="팝업띄움">i-PIN 인증하기</a>
				<a href="javascript:goSendEmailPopup();" class="btn big email" title="팝업띄움">이메일 인증하기</a>
			</div>
			<p class="bottom">아이핀(i-PIN)은 방송통신위원회에서 주관하는 주민등록번호 대체 수단으로 주민등록번호 대신<br>
			아이핀 ID를 발급받아 본인확인을 하는 서비스입니다.</p>
		</div> -->
	<!--  // 인증방식 선택  -->
	</fieldset>
	</form>
</section>


<!-- <form id="mobilePhoneCertificationForm" name="form_chk" method="post">
	<input type="hidden" name="m" value="checkplusSerivce" />	<input type="hidden" name="EncodeData" value="" />	    
		<input type="hidden" name="param_r1" value="2f7765622f6d656d6265722f6a6f696e2f636865636b5f6475706c69636174696f6e2e646f" />
	<input type="hidden" name="param_r2" value="" />
	<input type="hidden" name="param_r3" value="" />
</form> -->

<!-- <form id="ipinCertificationForm" name="form_ipin" method="post">
	<input type="hidden" name="m" value="pubmain" />		    <input type="hidden" name="enc_data" value="" />		    
    	<input type="hidden" name="param_r1" value="2f7765622f6d656d6265722f6a6f696e2f636865636b5f6475706c69636174696f6e2e646f" />
    <input type="hidden" name="param_r2" value="" />
    <input type="hidden" name="param_r3" value="" />
</form> -->

<!-- // Contents -->

            <!-- // Contents -->
        </section>
		
	</div>
	<!-- // Container -->
	
	<!-- Footer -->
    	<!-- Footer -->
<jsp:include page="/inc/footer.jsp"/>
	<!-- // Footer -->
</div>

<!-- 전체 메뉴 -->
<section id="allmenu" class="menu">
	<div class="container">
		<h1 class="blind">전체메뉴</h1>
		<ul class="tabs">
			<li class="on">
				<a href="#">
					가슴 속에 불꽃을<br>
					품고있는 당신<br>
					<strong>한화인 <em>전체</em></strong>
				</a>
			</li>
			<li>
				<a href="#">
					신입의 패기로 미래가<br>
					되고 싶은<br>
					<strong>예비 불꽃인 <em>추천</em></strong>
				</a>
			</li>
			<li>
				<a href="#">
					본인의 꿈과 진로에<br> 
					대해 고민하는<br>
					<strong>이 시대의 청년 <em>추천</em></strong>
				</a>
			</li>
			<li>
				<a href="#">
					완숙한 노련미로<br>
					꿈을 펼치고 싶은<br>
					<strong>경력 지원자 <em>추천</em></strong>
				</a>
			</li>
		</ul>
		<div class="tab-contents">
			<ul>
				<li>
					<h2>Hanwha</h2>
					<ul>
						<li><a href="/Hanwha/hanwha/business/business.do">한화의 사업</a></li>
						<li><a href="/Hanwha/hanwha/history/history.do">한화가 걸어온 길</a></li>
						<li><a href="/Hanwha/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
						<li><a href="/Hanwha/hanwha/personal_system/personal.do">한화의 제도</a></li>
					</ul>
					<figure>
						<a href="/Hanwha/hanwha/history/history.do">
							<img src="/Hanwha/images/main/img_menu.png" alt="">
							<figcaption>
								<em>한화그룹</em>
								<p>History Webtoon</p>
								60년 전, 한화인의 불꽃을 만나보세요.
							</figcaption>
						</a>
					</figure>
				</li>
				<li>
					<h2>Dream</h2>
					<ul>
						<li><a href="/Hanwha/dream/dream_tune/dream_tune.do">DREAM TUNES</a></li>
						<li><a href="/Hanwha/dream/membership_program/list.do">멤버십 프로그램</a></li>
					</ul>
					<figure>
						<a href="/Hanwha/dream/dream_tune/dream_tune.do">
    						<img src="/Hanwha/images/main/img_menu2.png" alt="">
    						<figcaption>
    							계열사/직무 추천 프로그램
    							<p>Dream Tunes</p>
    							가슴 속 불꽃을 확인시켜 줄 프로그램입니다.
    						</figcaption>
						</a>
					</figure>
				</li>
				<li>
					<h2>Meet</h2>
					<ul>
						<li><a href="/Hanwha/meet/subsidiary/list.do">계열사 소개</a></li>
						<li><a href="/Hanwha/meet/detail_job/list.do">직무 소개</a></li>
						<li><a href="/Hanwha/meet/employment_tip/list.do">한화 inside</a></li>
					</ul>
					<figure>
						<a href="/Hanwha/meet/detail_job/list.do">
    						<img src="/Hanwha/images/main/img_menu3.png" alt="">
    						<figcaption>
    							<em>직무별 담당자의 생생</em>
    							<p>직무 인터뷰</p>
    							한화인이 들려주는 이야기에 귀 기울여 보세요.
    						</figcaption>
						</a>
					</figure>
				</li>
				<li>
					<h2>Apply</h2>
					<ul>
						<li><a href="/Hanwha/apply/procedure/procedure.do">채용 절차 </a></li>
						<li><a href="/Hanwha/apply/faq/list.do">FAQ</a></li>
						<li><a href="/Hanwha/apply/notification/list.do">채용 공고</a></li>
						<li><a href="/Hanwha/apply/notification/personDb.do">인재 DB</a></li>
					</ul>
					<figure>
						<a href="/Hanwha/apply/notification/list.do">
    						<img src="/Hanwha/images/main/img_menu4.png" alt="">
    						<figcaption>
    							<em>채용 공고</em>
    							<p>현재 <strong id="menuRecruit">15건</strong>의 채용 공고가 있습니다.</p>
    							한화인에 지원해 보세요.
    						</figcaption>
						</a>
					</figure>
				</li>
			</ul>
		</div>
	</div>
	<a href="#" class="close">팝업닫기</a>
</section>
<!-- // 전체 메뉴 -->

</body>
<!-- WISELOG ONLINE TRACKING SCRIPT CODE START -->
<!-- DO NOT MODIFY THIS SCRIPT CODE. -->
<!-- COPYRIGHT (C) 1999-2015 NETHRU INC. ALL RIGHTS RESERVED. -->
<script type="text/javascript">
(function() {
var nl = document.createElement('script'); nl.type = 'text/javascript';
nl.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'www.hanwhain.com/Hanwha/js/wlo.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(nl, s);
var done = false;
nl.onload = nl.onreadystatechange = function() {
    if ( !done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete") ) {
        done = true;
        _n_sid = "www.hanwhain.com";
        _n_uid_cookie = "UID";
        n_logging();
        nl.onload = nl.onreadystatechange = null;
    }
}
})();
</script>
<!-- WISELOG ONLINE TRACKING SCRIPT CODE END -->
</html>
