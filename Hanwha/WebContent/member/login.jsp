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
<title>로그인&lt;한화인 채용사이트</title>

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



<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        /*
        if(opener){
            $(document.body).addClass('popup');
            $("#normal").hide();
            $("#popupSection").hide();
        }
        */

		    });
    
	function goSubmit() {
		//탈퇴회원 여부 확인
		jQuery.ajax(
            { type: "POST"
            , url: "/member/leave_member_check_ajax.do"
            , data: {userId:$("input[name=username]").val()}
            , async : false
            , dataType : "json"
            , success: function(response) {
				if(response.status == 'LEAVEMEMBER') {
					alert(response.result+'는 탈퇴 회원입니다. \n탈퇴일로 부터 90일 이내 탈퇴처리 될 예정입니다.');
					return;
				} else {
					$("#j_username").val($("input[name=username]").val());
                	$("#j_password").val($("input[name=password]").val());    
                	document.action_form.submit();
				}
              }
            , error : function(jqXHR, textStatus, errorThrown) {
                 alert("아이디 또는 비밀번호를 다시 확인하세요.\n한화인에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.");
                 return;
              }
        });
	}
	
	// 페이스북 로그인
	function goFacebookLogin() {
		FB.getLoginStatus(function(response) {
    		if (response.status === 'connected') {
    			    			FB.api('/me', function(response) {
            		$("#facebookForm > input[name='id']").val(response.id);
            		$("#facebookForm > input[name='email']").val(response.email);
            		$("#facebookForm > input[name='firstName']").val(response.first_name);
            		$("#facebookForm > input[name='lastName']").val(response.last_name);
            		
            		$("#facebookForm").submit();
            	});
    		} else {
    			    			FB.login(function(response) {
    				if (response.status === 'connected') {
    					// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
    					FB.api('/me', function(response) {
                    		$("#facebookForm > input[name='id']").val(response.id);
                    		$("#facebookForm > input[name='email']").val(response.email);
                    		$("#facebookForm > input[name='firstName']").val(response.first_name);
                    		$("#facebookForm > input[name='lastName']").val(response.last_name);
                    		
                    		$("#facebookForm").submit();
                    	});
    				}
    			}, {scope: 'public_profile,email'});
    		}
    	});
	}
	
	// 로그인 엔터키 이벤트
    function keydownEnterSearch(evt) {
    	if (evt.keyCode == 13) {
			goSubmit();
    		return false;
    	}
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
<body   class='msie9' >
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

<section class="login">
	<div class="block login" style="width:685px;">
		<h2>로그인 하기</h2>
		
		<form name="action_form" id="action_form" action="/Hanwha/member/loginAction.do" method="post">
<!-- 			<input type="hidden" id="j_username" name="j_username" />
			<input type="hidden" id="j_password" name="j_password" />
			<input type="hidden" id="loginRedirect" name="loginRedirect" value=""/> -->
		<section class="id">
			<h3>아이디 로그인</h3>
			
			<fieldset>
			<legend>아이디/비밀번호 입력</legend>
				<label for="join1">아이디 <input type="text" name="username" value="" placeholder="아이디를 입력해주세요." id="join1"></label>
				<label for="join2">비밀번호 <input type="password" name="password" value="" placeholder="비밀번호를 입력해주세요." id="join2" class="pw" onkeydown="keydownEnterSearch(event)" ></label>
			</fieldset>
			
			<span class="btn">
<!-- 				<a href="javascript:goSubmit();" title="로그인하기" >
					<img src="../images/common/bt_login.png" alt="로그인" />
				</a> -->
				<input type="submit" value="로그인">
			</span>
			
			<ul>
				<li><a href="./find_id.do">아이디 찾기</a></li>
				<li><a href="./find_password_step1.do">비밀번호 찾기</a></li>
			</ul>
		</section>
		
		</form>
		
		<section class="facebook">
			<h3>Facebook 로그인</h3>
			
			<p>본인 인증을 하지 않으면, <strong>"입사지원, 채용 알림 설정"등 <br>
			서비스 이용에 제한</strong>이 있습니다.<br>
			이용을 원하시면 <a href="./join/step1.do">회원가입</a>을 해주세요.</p>
			
			<span class="btn"><a href="javascript:goFacebookLogin();" class="btn2" title="새창열림">Facebook 로그인</a></span>
		</section>
		
	</div>
	
	<p class="c">
		한화인 회원이 아니시라면 지금 한화인에 가입하세요.<br>
		여러분의 꿈에 한화가 함께합니다.<br>
		<a href="/Hanwha/member/join/step1.do" class="btn2">회원가입 하기</a>
	</p>
</section>
<!-- // Contents -->

<form id="facebookForm" name="facebookForm" method="post" action="./login_facebook.do">
	<input type="hidden" name="id" />
	<input type="hidden" name="email" />
	<input type="hidden" name="firstName" />
	<input type="hidden" name="lastName" />
	<input type="hidden" name="loginRedirect" value=""/>
</form>


            <!-- // Contents -->
        </section>
		
	</div>
	<!-- // Container -->
	
	<!-- Footer -->
    	<!-- Footer -->
	<footer>
	<!-- 계열사 바로가기 -->
	<div id="lay-family">
		<div class="lay-family">
			<div class="container">
				<dl>
					<dt>제조·건설</dt>
					<dd>
						<ul>
							<li><a href="http://www.hanwhacorp.co.kr" target="_blank" title="새창열림">(주)한화/화약</a></li>
							<li><a href="http://www.hwenc.co.kr" target="_blank" title="새창열림">한화건설</a></li>							
							<li><a href="http://www.hanwhacorp.co.kr" target="_blank" title="새창열림">(주)한화/방산</a></li>
							<li><a href="http://www.hanwha-qcells.com" target="_blank" title="새창열림">한화큐셀</a></li>							
							<li><a href="http://www.hanwhacorp.co.kr" target="_blank" title="새창열림">(주)한화/무역</a></li>
							<li><a href="http://www.hwam.co.kr" target="_blank" title="새창열림">한화첨단소재</a></li>								
							<li><a href="http://www.hanwhacorp.co.kr/machinery/index.jsp" target="_blank" title="새창열림">(주)한화/기계</a></li>
							<li><a href="http://hec.hanwha.co.kr/main.do" target="_blank" title="새창열림">한화에너지</a></li>							
							<li><a href="http://www.hanwhatechwin.co.kr" target="_blank" title="새창열림">한화테크윈</a></li>
							<li><a href="http://www.hcd21.co.kr/" target="_blank" title="새창열림">한화도시개발</a></li>							
							<li><a href="http://www.hanwhathales.com" target="_blank" title="새창열림">한화탈레스</a></li>
							<li><a href="http://www.hanwhacompound.co.kr" target="_blank" title="새창열림">한화컴파운드</a></li>
							<li><a href="http://hcc.hanwha.co.kr" target="_blank" title="새창열림">한화케미칼</a></li>	
							<li><a href="http://hgc.hanwha.com" target="_blank" title="새창열림">한화종합화학</a></li>
							<li><a href="http://www.hanwha-total.com" target="_blank" title="새창열림">한화토탈</a></li>												
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>금융</dt>
					<dd>
						<ul>
							<li><a href="http://www.hanwhalife.com" target="_blank" title="새창열림">한화생명</a></li>
							<li><a href="http://www1.hwgeneralins.com" target="_blank" title="새창열림">한화손해보험</a></li>
							<li><a href="http://www.hanwhafund.co.kr" target="_blank" title="새창열림">한화자산운용</a></li>
							<li><a href="https://www.hanwhawm.com" target="_blank" title="새창열림">한화투자증권</a></li>							
							<li><a href="http://www.hanwhainvestment.co.kr" target="_blank" title="새창열림">한화인베스트먼트</a></li>
							<li><a href="http://www.hanwhasbank.com" target="_blank" title="새창열림">한화저축은행</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>서비스·레저</dt>
					<dd>
						<ul>
							<li><a href="http://www.hwrc.co.kr" target="_blank" title="새창열림">한화호텔앤드리조트</a></li>
							<li><a href="http://www.hanwhagalleria.co.kr" target="_blank" title="새창열림">한화갤러리아</a></li>
							<li><a href="http://www.63realty.co.kr" target="_blank" title="새창열림">한화63시티</a></li>							
							<li><a href="http://www.hsnc.co.kr" target="_blank" title="새창열림">한화S&C</a></li>
							<li><a href="http://www.hwsd.co.kr" target="_blank" title="새창열림">한화역사</a></li>
							<li><a href="http://www.hanwhaeagles.co.kr" target="_blank" title="새창열림">한화이글스</a></li>
							<li><a href="http://www.gosns.co.kr" target="_blank" title="새창열림">한화에스테이트</a></li>
						</ul>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	<!-- //계열사 바로가기 -->
		<span class="blind">바닥글</span>
		<section>
			<img src="/Hanwha/images/common/hanwha2.png" alt="Hanwha" class="bi">
			<ul class="util">
				<li><a href="http://www.hanwha.co.kr/" target="_blank" title="새창열림">한화그룹</a></li>
                <li><a href="http://edu.hanwha.co.kr/" target="_blank" title="새창열림">한화인재경영원</a></li>
				<li><a href="/etc/clause.do" title="새창열림">이용약관</a></li>
                <li><a href="/etc/privacy.do" title="새창열림">개인정보처리방침</a></li>
			</ul>
			<address><img src="/Hanwha/images/common/copyright.png" alt="Copyright &copy; 2015 Hanwha Group. All rights reserved."></address>
			
			<ul class="share">
				<li><a href="https://www.facebook.com/hanwhadays" target="_blank" class="facebook" title="새창열림">한화데이즈 페이스북</a></li>
                <li><a href="https://twitter.com/hanwhadays" target="_blank" class="twitter" title="새창열림">한화데이즈 트위터</a></li>
                <li><a href="http://blog.hanwhadays.com/" target="_blank" class="blog" title="새창열림">한화데이즈 블로그</a></li>
				<li>
					<a href="#none" class="family" title="레이어열림">계열사 바로가기</a>
				</li>
			</ul>
		</section>
	</footer>
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
