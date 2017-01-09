<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=1004">
<meta name="title" content="한화그룹 채용사이트 한화in">
<meta name="description" content="한화그룹 채용사이트 한화인, 계열사 신입채용/경력채용/인턴채용 등 지원서 온라인접수, 채용절차 확인, 채용 관련 콘텐츠 수록">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한화인 채용사이트</title>

<!-- 모바일페이지 설정부분 -->
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
<!-- // 모바일페이지 설정부분 -->

<!-- 필요 없지 않을까요.. header.jsp에서 include하니까..  -->
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

<!-- 모바일 페이지 주소설정 부분 -->
<!-- <script>
if ((/android|webos|iphone|ipod|blackberry|iemobile|opera mini/i).test(navigator.userAgent)) {
	location.href = "http://m.hanwhain.com/index.do";
	}
</script> -->
<script src="../js/jquery.cookie.js"></script>

<!-- 메인 팝업 부분 -->
<!-- <script type="text/javascript">
$(window).load(function(){
//mainPopup
	$('.notice_pop .p_clolse a').click(function(){
		$(this).parents('.notice_pop').hide();
	})
	$('#notice_pop input').click(function(){
		jQuery.cookie('popup_01', 'ck', { expires: 1 , path: '/' });
		$('#notice_pop').hide();
	})	
})
</script> -->
<script type="text/javascript">
    $(document).ready(function() {
//popup
	$('section.vod h1,section.vod p').css({opacity:'0'})
	$('#vod-layer ul li').mouseover(function(){
		$('.Kpopup').hide()
		$('section.vod h1,section.vod p').css({opacity:'1'})
	})
				$("input[name='subsidiary']").click(function() {
			$("input[name='represJob']").prop("checked", false).fakecheck();
			fnSearch();
		});
		
				$("input[name='represJob']").click(function() {
			$("input[name='subsidiary']").prop("checked", false).fakecheck();
			fnSearch();
		});
        
        $('select, input, textarea').fakeform();
    });
	
	function openPopup() {
			}
    
    function fnMoveApply() {
		$("input[name='schTp']").val("");
        $("input[name='subsidiary']").prop("checked", false);
		$("input[name='represJob']").prop("checked", false);
		fnSearch();
    }
    
    function fnSearch() {
		$("#searchForm").attr("target", "recruitIframe");
        $("#searchForm").submit();
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
        postLink("../apply/resume/personal_info.do", params, "_self");
    }
</script>
</head>
<body  data-nav-current='0-0-0'  >
<div id="wrap">
	<!-- Header -->
<jsp:include page="../inc/header.jsp"/>
	<!-- // Header -->
	
	<!-- Container -->
	<div id="container" class="wide">
		
		<section id="contents">
			<span class="blind">본문</span>
            <!-- Contents -->
                
<!-- Contents -->
<!-- ./apply/notification/main_list_iframe.do -->
<form id="searchForm" name="searchForm" method="get" action="" target="recruitIframe">
    <input type="hidden" id="schTp" name="schTp"/>
    <input type="hidden" id="schNm" name="schNm"/>
    <input type="hidden" id="rtSeq" name="rtSeq"/>
    
    <!-- 메인 섹션 부분 시작 -->
<section class="main-con">
<!-- 팝업01
	<div id="notice_pop" class="notice_pop">
		<p class="p_clolse"><a href="#"><img src="http://www.hsnc.co.kr/kr/mod/images/main/pop_closeO.gif" alt="팝업 닫기" /></a></p>
		<p class="btn"><a href="http://www.hanwhain.com/apply/notification/view.do?rtSeq=1669" target="_blank"><img src="/images/main/btn_03.gif" alt="지원하기" /></a></p>
		<p class="kImg"><img src="/images/main/popup_04.gif" alt="Hanwha Membership Program"></p>
		<div class="popupHide">
		<h2>Hanwha Membership Program</h2>
		<p>한화그룹의 현재가 아닌 미래를 이끌어 나갈 젊고 창의적인 인재와의 만남, HMP!</p>
		</div>
        <p class="p_btnArae">
			<label>더 이상 보지 않음
				<input type="checkbox" />
			</label>
		</p>
	</div>
<script type="text/javascript">
var tmp = jQuery.cookie('popup_01');
if(tmp=="ck"){
	$('#notice_pop').hide();
}
</script>
 //팝업01 -->

<!-- 메인 슬라이드 부분 -->
    <div class="sliders">
                <div class="slider">
            <!--<img src="/upfile/others/contents/main/146588815200059042.jpg" alt="">-->
            <img src="/Hanwha/upfile/others/contents/main/146588815200059042.jpg" alt="">
            <p >
                <em>가슴 속에 불꽃을 품고 있는</em>
<em>당신은 이미 한화인입니다.</em>
                <!--                     <a href="intro" class="vod" title="팝업띄움">동영상 보기</a> 스크립트 주소 -->
                    <a href="https://www.youtube.com/watch?v=0cNeItvQhxQ" class="vod" title="팝업띄움" target="_blank">동영상 보기</a>
                            </p>
        </div>
                <div class="slider">
            <!--<img src="/upfile/others/contents/main/146588119844933576.jpg" alt="">-->
            <img src="/Hanwha/upfile/others/contents/main/146588119844933576.jpg" alt="">
            <p  class="l" >
                <em>60년 전, 처음 시작된</em>
<em>한화인의 불꽃을 만나보세요.</em>
                										<a href="hanwha/history/history.do" class="go">자세히보기</a>
					                            </p>
        </div>
                <div class="slider">
            <!--<img src="/upfile/others/contents/main/146588121451972602.jpg" alt="">-->
            <img src="/Hanwha/upfile/others/contents/main/146588121451972602.jpg" alt="">
            <p  class="l" >
                <em>불꽃을 찾고 계신가요? 당신에게 어울리는</em>
<em>한화의 계열사와 직무를 찾아드립니다.</em>
                										<a href="dream/dream_tune/dream_tune.do" class="go">자세히보기</a>
					                            </p>
        </div>
                <div class="slider">
            <!--<img src="/upfile/others/contents/main/146588122727817413.jpg" alt="">-->
            <img src="/Hanwha/upfile/others/contents/main/146588122727817413.jpg" alt="">
            <p  class="l" >
                <em>한화의 다양한 직무와 꿈을</em>
<em>이루어 가고 있는 한화인을 만나보세요.</em>
                										<a href="meet/detail_job/list.do" class="go">자세히보기</a>
					                            </p>
        </div>
                <div class="slider">
            <!--<img src="/upfile/others/contents/main/146588816686898594.jpg" alt="">-->
            <img src="/Hanwha/upfile/others/contents/main/146588816686898594.jpg" alt="">
            <p  class="l" >
                <em>한화와 함께 하는 길은 열려 있습니다.</em>
<em>당신의 불꽃을 인재DB에 등록해주세요.</em>
                										<a href="apply/notification/personDb.do" class="go">자세히보기</a>
					                            </p>
        </div>
    </div>
    <!-- // 메인 슬라이드 부분  끝-->
    
    
   <div class="toggle-type">
		<a href="#" class="play">자동흐름</a>
		<a href="#" class="pause">자동흐름 일시정지</a>
        <a href="#" class="prev">이전 항목 보기</a>
        <ul>
                                        <li  class="on" ><a href="#">첫번째 항목</a></li>
                                            <li ><a href="#">첫번째 항목</a></li>
                                            <li ><a href="#">첫번째 항목</a></li>
                                            <li ><a href="#">첫번째 항목</a></li>
                                            <li ><a href="#">첫번째 항목</a></li>
                                    </ul>
        <a href="#" class="next">다음 항목 보기</a>
    </div>
    
    <ul class="video-list">
		<li>
			<img src="/Hanwha/images/main/img_video.png" alt="">
			<a href="https://www.youtube.com/watch?v=QvioS9SbyH0" title="한화인 인터뷰 동영상 보기" target="_blank">동영상 보기</a>
			한화인 인터뷰
		</li>
		<li>
			<img src="/Hanwha/images/main/img_video2.png" alt="">
			<a href="https://www.youtube.com/watch?v=dshmMn6z9O4" title="불꽃금융인편 동영상 보기" target="_blank">동영상 보기</a>
			불꽃금융인편
		</li>
		<li>
			<img src="/Hanwha/images/main/img_video3.png" alt="">
			<a href="https://www.youtube.com/watch?v=UuNU8EZKquM" title="불꽃호텔리어편 동영상 보기" target="_blank">동영상 보기</a>
			불꽃호텔리어편
		</li>
		<li>
			<img src="/Hanwha/images/main/img_video4.png" alt="">
			<a href="https://www.youtube.com/watch?v=0cNeItvQhxQ" title="불꽃디자이너편 동영상 보기" target="_blank">동영상 보기</a>
			불꽃디자이너편
		</li>
	</ul>
</section>
<!-- // 메인 섹션 부분 끝 -->

<section class="recruit">
    <h2>진행 중 채용 공고 <a href="javascript:fnMoveApply();">전체보기</a></h2>
    <ul>
        <li>
            <a href="#">
                <img src="/Hanwha/images/main/img_recruit.png" alt="">
                <dl>
                    <dt>신입</dt>
                    <dd>
                        <p>미래의 꿈을 만들어가는<br>
                        한화인을 기다립니다.</p>
                        <em>3<span>건</span></em>
                        <small>신입 채용 공고 보기</small>
                    </dd>
                </dl>
            </a>
        </li>
        <li>
            <a href="#">
                <img src="/Hanwha/images/main/img_recruit2.png" alt="">
                <dl>
                    <dt>경력</dt>
                    <dd>
                        <p>삶의 가치를 만들어 가는<br>
                        한화인을 기다립니다.</p>
                        <em>10<span>건</span></em>
                        <small>경력 채용 공고 보기</small>
                    </dd>
                </dl>
            </a>
        </li>
        <li>
            <a href="#">
                <img src="/Hanwha/images/main/img_recruit3.png" alt="">
                <dl>
                    <dt>인턴</dt>
                    <dd>
                        <p>한화와 함께 꿈을 키워갈<br>
                        한화인을 기다립니다.</p>
                        <em>0<span>건</span></em>
                        <small>인턴 채용 공고 보기</small>
                    </dd>
                </dl>
            </a>
        </li>
		        <li>
            <a href="../apply/notification/personDb.do">
                <img src="/Hanwha/images/main/img_recruit4.png" alt="" />
                <dl>
                    <dt>인재 DB 등록</dt>
                    <dd>
                        <p>원하시는 계열사, 직무에<br>
                        인재 DB를 등록해보세요.</p>
                        <small>인재 DB 등록하기</small>
                    </dd>
                </dl>
            </a>
        </li>
		    </ul>
	
    <span class="btn-area">
        <a href="#" class="btn" title="레이어열림">채용 공고 더 보기</a>
    </span>
    
    <div class="column-2">
        <div class="fl">
            <h3>채용진행 중 계열사</h3>
            <ul>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-1" value="192" ><label for="rec1-1">&#40;주&#41;한화/기계</label></li>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-2" value="327" ><label for="rec1-2">한화테크윈</label></li>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-3" value="215" ><label for="rec1-3">한화S&C</label></li>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-4" value="212" ><label for="rec1-4">한화이글스</label></li>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-5" value="197" ><label for="rec1-5">한화케미칼</label></li>
                                                                                            <li><input type="checkbox" name="subsidiary" id="rec1-6" value="198" ><label for="rec1-6">한화큐셀</label></li>
                            </ul>
        </div>
        <div class="fr">
            <h3>채용진행 중 직무</h3>
            <ul>
                                                                                            <li><input type="checkbox" name="represJob" id="rec2-1" value="34" > <label for="rec2-1">경영지원</label></li>
                                                                                            <li><input type="checkbox" name="represJob" id="rec2-2" value="30" > <label for="rec2-2">R&amp;D</label></li>
                                                                                            <li><input type="checkbox" name="represJob" id="rec2-3" value="29" > <label for="rec2-3">IT</label></li>
                            </ul>
        </div>
    </div>
</section>

</form>

<script>

// 채용 공고 닫기 버튼 클릭
window.closeRecruitList = function() {
	HANWHAIN.resetRecuritTabs();
	fnMoveApply();
}

// 채용공고 탭(신입/경력/인턴) 변경 시 아래 함수 호출
window.mainRecruitTabChanged = (function() {
	var selectedCategory = null;
	return function(index) {
	
		$("input[name='schNm']").val("");
		
		var category;
		if (index == 0) {
			category = '전체';
			$("input[name='schTp']").val("");
		} else if (index == 1) {
			category = '신입';
			$("input[name='schTp']").val("nrcrt");
		} else if (index == 2) {
			category = '경력';
			$("input[name='schTp']").val("carr");
		} else if (index == 3) {
			category = '인턴';
			$("input[name='schTp']").val("intn");
//		} else if (index == 4) {
//			console.log($(this));
//			location.href = "/apply/notification/personDb.do";
		} else if (index == 4) {
			category = '';
			$("input[name='schTp']").val("");
			$("input[name='schNm']").val("한화그룹 고용디딤돌 채용");
		}
		if (category != selectedCategory) {

			// console.log(category);
			
			selectedCategory = category;
			
			$("input[name='subsidiary']").prop("checked", false);
			$("input[name='represJob']").prop("checked", false);
			
			fnSearch();
		}
	}
})();
// mainRecruitTabChanged(0); // 처음 실행
</script>

<!-- 채용공고 목록 -->
<!-- ./apply/notification/main_list_iframe.do -->
<div id="iframe-affiliates">
	<div class="iframe"><iframe id="recruitIframe" name="recruitIframe" src="" title="채용공고 목록" frameborder="0" scrolling="no" class="affiliates" onload="HANWHAIN.setIframeHeight(this);"></iframe></div>
	<div class="btn-area">
		<a href="#" class="btn close" title="레이어닫힘">채용 공고 닫기</a>
	</div>
</div>
<!-- // 채용공고 목록 -->

<!-- * footer(한화소개, 계열사소개, 직무소개) 시작? *  -->
<ul class="link-type2">
    <li>
        <dl class="process">
            <dt>채용 절차</dt>
            <dd>
                한화인이 되기까지 경력별, 단계별<br>
                채용 절차에 대해 알려드립니다.<br>
                <a href="../apply/procedure/procedure.do">채용 절차 보기</a>
            </dd>
        </dl>
    </li>
    <li>
        <dl class="tip">
            <dt>한화 inside</dt>
            <dd>
                한화인이 직접 알려드리는<br>
                채용 합격 비결을 확인해 보세요.<br>
                <a href="./meet/employment_tip/list.do">한화 inside 보기</a>
            </dd>
        </dl>
    </li>
    <li>
        <dl class="notice">
            <dt>채용 공고</dt>
            <dd>
                한화와 함께 꿈을 실현 시킬<br> 
                인재를 기다립니다.<br>
                <a href="./apply/notification/list.do">채용 공고 보기</a>
            </dd>
        </dl>
    </li>
</ul>
<!-- * footer(한화소개, 계열사소개, 직무소개) 끝? *  -->


<section id="vod-layer" class="vod">
 	<div class="container">
 		<h1>한화인 인터뷰</h1>
 		<div class="video">
 			<div class="player"></div>
 			<p></p>
 		</div>
 		<ul>
 			<li>
 				<img src="/Hanwha/images/main/img_video.png" alt="">
 				<a href="https://www.youtube.com/watch?v=QvioS9SbyH0" title="한화인 인터뷰 동영상 보기"><em>한화인 인터뷰</em>동영상 보기</a>
 				<p>가슴 속에 불꽃을 품은 한화인들의 이야기를 들어보세요.<br>새롭게 시작하는 한화그룹 채용사이트 한화인이 당신의 가슴 속 꿈과 열정을 응원합니다.</p>
 			</li>
 			<li>
 				<img src="/Hanwha/images/main/img_video2.png" alt="">
 				<a href="https://www.youtube.com/watch?v=dshmMn6z9O4" title="불꽃금융인편 동영상 보기"><em>불꽃금융인편</em> 동영상 보기</a>
 				<p>평범한 일상. 가슴 속에 불꽃을 품으면 어떻게 달라질까요?<br>가슴 속에 불꽃을 품은 한화 금융인을 만나보시죠.</p>
 			</li>
 			<li>
 				<img src="/Hanwha/images/main/img_video3.png" alt="">
 				<a href="https://www.youtube.com/watch?v=UuNU8EZKquM" title="불꽃호텔리어편 동영상 보기"><em>불꽃호텔리어편</em> 동영상 보기</a>
 				<p>평범한 일상. 가슴 속에 불꽃을 품으면 어떻게 달라질까요?<br>가슴 속에 불꽃을 품은 한화 호텔리어를 만나보시죠.</p>
 			</li>
 			<li>
 				<img src="/Hanwha/images/main/img_video4.png" alt="">
 				<a href="https://www.youtube.com/watch?v=0cNeItvQhxQ" title="불꽃디자이너편 동영상 보기"><em>불꽃디자이너편</em> 동영상 보기</a>
 				<p>평범한 일상. 가슴 속에 불꽃을 품으면 어떻게 달라질까요?<br>가슴 속에 불꽃을 품은 한화 디자이너를 만나보시죠.</p>
 			</li>
 		</ul>
 		<label for="day-check"><input type="checkbox" id="day-check"> 오늘 하루 안보기</label>
 		<a href="#" class="btn go">메인 화면 가기</a>
 	</div>
 	<div class="container alone">
 		<h1></h1>
 		<div class="video">
 			<div class="player"></div>
 		</div>
 	</div>
 	<a href="#" class="close">팝업닫기</a>
 </section>

<!-- // Contents -->

            <!-- // Contents -->
        </section>
		
	</div>
	<!-- // Container -->
	
	<!-- Footer -->
    	<!-- 맨 아래 Footer 시작 -->
	<jsp:include page="/inc/footer.jsp"/>
		<!-- // 맨 아래 Footer 끝 -->
	<!-- // Footer -->
</div> <!-- // <div="wrap"> 끝  -->

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
						<li><a href="./hanwha/business/business.do">한화의 사업</a></li>
						<li><a href="./hanwha/history/history.do">한화가 걸어온 길</a></li>
						<li><a href="./hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
						<li><a href="./hanwha/personal_system/personal.do">한화의 제도</a></li>
					</ul>
					<figure>
						<a href="./hanwha/history/history.do">
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
						<li><a href="../dream/dream_tune/dream_tune.do">DREAM TUNES</a></li>
						<li><a href="../dream/membership_program/list.do">멤버십 프로그램</a></li>
					</ul>
					<figure>
						<a href="../dream/dream_tune/dream_tune.do">
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
						<li><a href="./meet/subsidiary/list.do">계열사 소개</a></li>
						<li><a href="./meet/detail_job/list.do">직무 소개</a></li>
						<li><a href="./meet/employment_tip/list.do">한화 inside</a></li>
					</ul>
					<figure>
						<a href="./meet/detail_job/list.do">
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
						<li><a href="../apply/procedure/procedure.do">채용 절차 </a></li>
						<li><a href="../apply/faq/list.do">FAQ</a></li>
						<li><a href="../apply/notification/list.do">채용 공고</a></li>
						<li><a href="../apply/notification/personDb.do">인재 DB</a></li>
					</ul>
					<figure>
						<a href="../apply/notification/list.do">
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
