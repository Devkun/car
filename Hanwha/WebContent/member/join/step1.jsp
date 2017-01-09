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
<title>가입방법 선택하기&lt;회원가입&lt;한화인 채용사이트</title>

<meta property="og:type" content="website">
<meta property="og:site_name" content="Hanwhain">
<meta property="og:title" content="Hanwhain">
<meta property="og:description" content="한화그룹 온라인 채용사이트">
<meta property="og:image" content="http://www.hanwhain.com/images/favicon/social.jpg"><!-- full url -->
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon/favicon.ico">
<meta name="apple-mobile-web-app-title" content="Hanwhain">
<link rel="apple-touch-icon" href="/images/favicon/icon57.jpg" sizes="57x57">
<link rel="apple-touch-icon" href="/images/favicon/icon72.jpg" sizes="72x72">
<link rel="apple-touch-icon" href="/images/favicon/icon76.jpg" sizes="76x76">
<link rel="apple-touch-icon" href="/images/favicon/icon114.jpg" sizes="114x114">
<link rel="apple-touch-icon" href="/images/favicon/icon120.jpg" sizes="120x120">
<link rel="apple-touch-icon" href="/images/favicon/icon144.jpg" sizes="144x144">
<link rel="apple-touch-icon" href="/images/favicon/icon152.jpg" sizes="152x152">
<meta name="msapplication-TileImage" content="/images/favicon/win8-144.jpg">
<meta name="msapplication-TileColor" content="#f17330">
<meta name="application-name" content="Hanwhain">
<meta name="msapplication-square70x70logo" content="/images/favicon/ie11-70.jpg">
<meta name="msapplication-square150x150logo" content="/images/favicon/ie11-150.jpg">
<meta name="msapplication-wide310x150logo" content="/images/favicon/ie11-310-wide.jpg">
<meta name="msapplication-square310x310logo" content="/images/favicon/ie11-310-square.jpg">

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
<script src="/js/html5.js"></script>
<![endif]-->


<script type="text/javascript">
	function joinFacebook() {
		FB.getLoginStatus(function(response) {
    		if (response.status === 'connected') {
    			goStep2Facebook();
    		} else {
    			FB.login(function(response) {
    				goStep2Facebook();
    			}, {scope: 'public_profile,email'});
    		}
    	});
	}
	
	function goStep2Facebook() {
		FB.api('/me', function(response) {
    		$("#facebookForm > input[name='id']").val(response.id);
    		$("#facebookForm > input[name='email']").val(response.email);
    		$("#facebookForm > input[name='firstName']").val(response.first_name);
    		$("#facebookForm > input[name='lastName']").val(response.last_name);
    		
    		$("#facebookForm").submit();
    	});
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
        postLink("/apply/resume/personal_info.do", params, "_self");
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
		<li class="on">가입방법 선택하기<em>(현재페이지)</em></li>
		<li>실명인증하기</li>
		<li>정보입력하기</li>
		<li>가입완료</li>
	</ul>
	
	<h3>원하시는 회원가입 방법을 선택해주세요.</h3>
	
	<div class="certify-select">
		<a href="./step2.do">
			<dl>
				<dt>아이디 회원가입</dt>
				<dd>아이디 회원가입은 아이디와 암호를 입력하는 <br>
				일반적인 회원가입 방식입니다.</dd>
			</dl>
		</a>
		<a href="javascript:joinFacebook();">
			<dl>
				<dt>Facebook 회원가입</dt>
				<dd>페이스북 회원가입은 이용하시는 페이스북 계정으로 <br>
				아이디와 암호를 대신하는 회원가입 방식입니다.</dd>
			</dl>
		</a>
	</div>
</section>

<!-- 페이스북 가입 폼 -->
<!-- <form id="facebookForm" name="facebookForm" method="post" action="./step2_facebook.do">
	<input type="hidden" name="id" />
	<input type="hidden" name="email" />
	<input type="hidden" name="firstName" />
	<input type="hidden" name="lastName" />
</form>
 -->
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
						<li><a href="/hanwha/business/business.do">한화의 사업</a></li>
						<li><a href="/hanwha/history/history.do">한화가 걸어온 길</a></li>
						<li><a href="/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
						<li><a href="/hanwha/personal_system/personal.do">한화의 제도</a></li>
					</ul>
					<figure>
						<a href="/hanwha/history/history.do">
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
						<li><a href="/dream/dream_tune/dream_tune.do">DREAM TUNES</a></li>
						<li><a href="/dream/membership_program/list.do">멤버십 프로그램</a></li>
					</ul>
					<figure>
						<a href="/dream/dream_tune/dream_tune.do">
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
						<li><a href="/meet/subsidiary/list.do">계열사 소개</a></li>
						<li><a href="/meet/detail_job/list.do">직무 소개</a></li>
						<li><a href="/meet/employment_tip/list.do">한화 inside</a></li>
					</ul>
					<figure>
						<a href="/meet/detail_job/list.do">
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
						<li><a href="/apply/procedure/procedure.do">채용 절차 </a></li>
						<li><a href="/apply/faq/list.do">FAQ</a></li>
						<li><a href="/apply/notification/list.do">채용 공고</a></li>
						<li><a href="/apply/notification/personDb.do">인재 DB</a></li>
					</ul>
					<figure>
						<a href="/apply/notification/list.do">
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
nl.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'www.hanwhain.com/js/wlo.js';
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
