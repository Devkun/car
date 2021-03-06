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
<title>가입완료&lt;회원가입&lt;한화인 채용사이트</title>



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
<body   class='login confirm' >
<div id="wrap">
	<!-- Header -->
	<header>
		<script src="/Hanwha/js/grayscale.js"></script>
<script src="/Hanwha/js/hanwhain.js"></script>

<span id="skipNav">
    <a href="#contents">본문바로가기</a>
    <a href="#gnb">대메뉴바로가기</a>
</span>

<h1><a href="/Hanwha/"><img src="/Hanwha/images/common/hanwha.png" alt="Hanwha in"></a></h1>

<span class="blind">주메뉴</span>
<section id="gnb">
    <ul class="nav">
        <li>
            <a href="/Hanwha/hanwha/business/business.do">Hanwha</a>
            <div class="lay-sub">
                <section class="sectionNew">
                    <p>한화가<br>
                    궁금하신가요?</p>
                    <ul>
                        <li><a href="/Hanwha/hanwha/business/business.do">한화의 사업</a></li>
                        <li><a href="/Hanwha/hanwha/history/history.do">한화가 걸어온 길</a></li>
                        <li><a href="/Hanwha/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
                        <li><a href="/Hanwha/hanwha/personal_system/personal.do">한화의 제도</a></li>
                    </ul>
			<!-- 2015-05-18 수정 [s] -->
											<aside>
						<h3 style="position:absolute;top:-20px;left:23px;z-index:20">한화 역사 웹툰</h3>
						<figure>
														<img src="/Hanwha/images/common/Hanwha_0106viewtoon_01.gif" alt="웹툰 이미지 1화" />
							<figcaption>
							불꽃처럼 <br />한화처럼<br />
							<a href="/Hanwha/hanwha/history/history.do?webToonNo=1" title="페이지 이동" >웹툰 보기</a>
							</figcaption>
						</figure>
					</aside>

								<!-- 2015-05-18 수정 [e] -->
                </section>
            </div>
        </li>
        <li>
            <a href="/Hanwha/dream/dream_tune/dream_tune.do">Dream</a>
            <div class="lay-sub">
                <section>
                    <p>한화에서<br>
                    당신의 꿈을<br>
                    찾아 드립니다.</p>
                    <ul>
                        <li><a href="/Hanwha/dream/dream_tune/dream_tune.do">Dream Tunes</a></li>
                        <li><a href="/Hanwha/dream/membership_program/list.do">멤버십 프로그램</a></li>
                    </ul>
                </section>
            </div>
        </li>
        <li>
            <a href="/Hanwha/meet/subsidiary/list.do">Meet</a>
            <div class="lay-sub">
                <section>
                    <p>한화의 계열사와<br>
                    한화인들을<br>
                    만나보세요.</p>
                    <ul>
                        <li><a href="/Hanwha/meet/subsidiary/list.do">계열사 소개</a></li>
                        <li><a href="/Hanwha/meet/detail_job/list.do">직무 소개</a></li>
                        <li><a href="/Hanwha/meet/employment_tip/list.do">한화 inside</a></li>
						<li class="kHide"><a href="/Hanwha/meet/meet_hanwhain/list.do">Meet 한화인</a></li>
                    </ul>
										<aside>
                        <h3>Meet 한화인</h3>
                        <figure>
                            <img src="/Hanwha/upfile/others/contents/jobInterview/142563383867090653.jpg" alt="한화인 전진철 사진" />
                            <figcaption>
                                <strong>전진철</strong><br>
                                (주)한화/방산 / 연구개발<br>
                                <a href="/Hanwha/meet/meet_hanwhain/list.do" title="meet한화인 페이지 이동">인터뷰 보기</a>
                            </figcaption>
                        </figure>
                    </aside>
					                </section>
            </div>
        </li>
        <li>
            <a href="/Hanwha/apply/procedure/procedure.do">Apply</a>
            <div class="lay-sub">
                <section>
                    <p>한화와 함께<br>
                    꿈을 실현하세요.</p>
                    <ul>
                        <li><a href="/Hanwha/apply/procedure/procedure.do">채용 절차</a></li>
                        <li><a href="/Hanwha/apply/faq/list.do">FAQ</a></li>
                        <li><a href="/Hanwha/apply/notification/list.do">채용 공고</a></li>
                        <li><a href="/Hanwha/apply/notification/personDb.do">인재 DB</a></li>
                    </ul>
                </section>
            </div>
        </li>
    </ul>
</section>
		<ul id="util">
            <li>
    <script type="text/javascript">
    function fnErrorMemeberImg(obj) {
        obj.src='/Hanwha/images/common/img_blank.png';
        return;
    }
    </script>
    <!-- 로그인 후 -->
        <!-- 로그인 전 -->
    <span class="photo">
		<img src="/Hanwha/images/common/img_blank.png" alt="">
	</span>
    <a href="/Hanwha/member/login.do" class="login">로그인</a>
    </li>
<script type="text/javascript">
    $(document).ready(function() {
        var recruitCnt = "8";
        $("#menuRecruit").text(recruitCnt+"건");
    });
    
    function topBookmarkReload() {
        jQuery.getJSON("/Hanwha/common/bookmark/top_list.do", function(data) {
            $(".bookmark").empty();
            
            var html = '';
            var size = 0;
            
            for (var i = 0; i < data.bookmarkRecruitList.length; i++) {
                var bookmark = data.bookmarkRecruitList[i];
                
                html += '<li>';
                html += '   <a href="/Hanwha/apply/notification/view.do?rtSeq=' + bookmark.recruit.seq + '">';
                html += '       채용공고 ';
                html += '       <strong>';
                html += '           ' + bookmark.recruit.subsidiary.nm;
                if (bookmark.recruit.stat2 == "1") {
                    html += '       <small>예정</small>';
                } else if (bookmark.recruit.stat2 == "2") {
                    html += '       <small>진행중</small>';
                } else if (bookmark.recruit.stat2 == "3") {
                    html += '       <small class="close">마감</small>';
                }
                html += '       </strong>';
                html += '   </a>';
                html += '</li>';
                
                size++;
            }
            
            for (var i = 0; i < data.bookmarkList.length; i++) {
                var bookmark = data.bookmarkList[i];
                
                html += '<li>';
                
                if (bookmark.tp == "1") {
                    html += '<a href="/Hanwha/meet/subsidiary/view.do?seq=' + bookmark.sdSeq + '">' + bookmark.topLayerTtl + '</a>';
                } else if (bookmark.tp == "2") {
                    html += '<a href="/Hanwha/meet/detail_job/view.do?sdSeq=' + bookmark.sdSeq + '&djSeq=' + bookmark.djSeq + '" onclick="HANWHAIN.layer.open(this, 742);return false;">';
                    html += '   ' + bookmark.topLayerTtl;
                    html += '</a>';
                } else if (bookmark.tp == "3") {
                    html += '<a href="/Hanwha_0106view' + bookmark.url + '">' + bookmark.topLayerTtl + '</a>';
                } else if (bookmark.tp == "4") {
                    html += '<a href="/Hanwha/meet/job_interview/view_iframe.do?seq=' + bookmark.jiSeq + '" title="팝업띄움" onclick="HANWHAIN.layer.open(this, 918);return false;">';
                    html += '   ' + bookmark.topLayerTtl;
                    html += '</a>';
                }
                html += '</li>';
                
                size++;
            }
            
            $(".bookmark").append(html);
            
            $(".bookmark").prev().find("span").text(size);
        });
    }
    
    function fnTopEndViewApplyDetail(){
        alert("해당 공고는 접수가 종료되었습니다.");
    }
</script>
			<li><a href="/eng/index.do" class="eng">english</a></li>
			<li><a href="#" class="menu">한화in 이용 가이드(팝업띄움)</a></li>
		</ul>
	</header>
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
		<li>실명인증하기</li>
		<li>정보입력하기</li>
		<li class="on">가입완료<em>(현재페이지)</em></li>
	</ul>
	
	<div class="block join">
		<h3><%=request.getAttribute("mem_name") %>님의 <img src="/Hanwha/images/login/tx_hanwhain.png" alt="한화인">가입을 환영합니다!<small>한화와 함께 꿈을 이뤄보세요.</small></h3>
	
					
		<fieldset>
		<legend>아이디/비밀번호 입력</legend>
			<label for="join1">아이디</label>
			<input type="text" name="" value=<%=request.getAttribute("mem_name") %> id="join1" readonly>
		</fieldset>
			
				
		<div class="btn-area">
			<a href="../login.do" class="btn2">로그인 하러가기</a>
		</div>
	</div>
	
	<p class="c">한화가 <strong><%=request.getAttribute("mem_name") %></strong>님의 꿈을 위해 준비했습니다.</p>
</section>

<ul class="link-type2">
	<li>
        <dl class="dream">
            <dt>Dream Tunes</dt>
            <dd>
                간단한 설문조사를 통해 어울리는<br>
                계열사와 직무를 찾아드립니다. <br>
                <a href="/Hanwha/dream/dream_tune/dream_tune.do">내게 맞는 한화인 찾기</a>
            </dd>
        </dl>
    </li>
    <li>
        <dl class="job">
            <dt>직무 소개</dt>
            <dd>
                한화인들이 들려주는 생생한<br>
                직무 이야기를 만나보세요. <br>
                <a href="/Hanwha/meet/detail_job/list.do">직무 소개 보기</a>
            </dd>
        </dl>
    </li>
    <li>
        <dl class="person">
            <dt>인재 DB 등록</dt>
            <dd>
                함께하고 싶은 계열사와 직무에<br>
                인재 DB를 등록하세요.<br>
                <a href="/Hanwha/apply/notification/personDb.do">인재 DB 등록하기</a>
            </dd>
        </dl>
    </li>
</ul>

<!-- // Contents -->

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
				<li><a href="/Hanwha/etc/clause.do" title="새창열림">이용약관</a></li>
                <li><a href="/Hanwha/etc/privacy.do" title="새창열림">개인정보처리방침</a></li>
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
