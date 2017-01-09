<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 절대경로주소 : /프로젝트명/WebContent/...  -->
<link rel="stylesheet" href="/Hanwha/css/style.css">
<script src="/Hanwha/js/jquery-1.11.2.min.js"></script>
<script src="/Hanwha/js/jquery-d.js"></script>
<!-- <script src="/Hanwha/web/js/jquery-fakeform-0.5.js"></script>  --><!-- 메인페이지 동영상 팝업. -->
<script src="/Hanwha/js/hanwhain.js"></script>
<script src="/Hanwha/js/common.js"></script>
<script src="/Hanwha/js/jquery.common.js"></script>
<script src="/Hanwha/js/bookmark.js"></script>
<script src="/Hanwha/js/facebook.js"></script>
</head>

<body>
	<header>
		<script src="/Hanwha/js/grayscale.js"></script>
<script src="/Hanwha/js/hanwhain.js"></script>

<span id="skipNav">
    <a href="#contents">본문바로가기</a>
    <a href="#gnb">대메뉴바로가기</a>
</span>

<h1>
	<!-- 로고 클릭시 index.do(index.jsp)로 이동 -->
	<a href="/Hanwha/index.do"> 
		<img src="/Hanwha/images/common/hanwha.png" alt="Hanwha in">
	</a>
</h1>

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
														<img src="../images/common/webtoon_02.gif" alt="웹툰 이미지 2화" />
							<figcaption>
							불꽃처럼 <br />한화처럼<br />
							<a href="../hanwha/history/history.do?webToonNo=1" title="페이지 이동" >웹툰 보기</a>
							</figcaption>
						</figure>
					</aside>

								<!-- 2015-05-18 수정 [e] -->
                </section>
            </div>
        </li>
        <li>
            <a href="../dream/dream_tune/dream_tune.do">Dream</a>
            <div class="lay-sub">
                <section>
                    <p>한화에서<br>
                    당신의 꿈을<br>
                    찾아 드립니다.</p>
                    <ul>
                        <li><a href="../dream/dream_tune/dream_tune.do">Dream Tunes</a></li>
                        <li><a href="../dream/membership_program/list.do">멤버십 프로그램</a></li>
                    </ul>
                </section>
            </div>
        </li>
        <li>
            <a href="../web/meet/subsidiary/list.do">Meet</a>
            <div class="lay-sub">
                <section>
                    <p>한화의 계열사와<br>
                    한화인들을<br>
                    만나보세요.</p>
                    <ul>
                        <li><a href="../web/meet/subsidiary/list.do">계열사 소개</a></li>
                        <li><a href="../web/meet/detail_job/list.do">직무 소개</a></li>
                        <li><a href="../web/meet/employment_tip/list.do">한화 inside</a></li>
						<li class="kHide"><a href="../web/meet/meet_hanwhain/list.do">Meet 한화인</a></li>
                    </ul>
										<aside>
                        <h3>Meet 한화인</h3>
                        <figure>
                            <img src="/Hanwha/upfile/others/contents/jobInterview/142563324105270333.jpg" alt="한화인 이동희 사진" />
                            <figcaption>
                                <strong>이동희</strong><br>
                                &#40;주&#41;한화/화약 / 국내영업<br>
                                <a href="../web/meet/meet_hanwhain/list.do" title="meet한화인 페이지 이동">인터뷰 보기</a>
                            </figcaption>
                        </figure>
                    </aside>
					                </section>
            </div>
        </li>
        <li>
            <a href="../web/apply/procedure/procedure.do">Apply</a>
            <div class="lay-sub">
                <section>
                    <p>한화와 함께<br>
                    꿈을 실현하세요.</p>
                    <ul>
                        <li><a href="../web/apply/procedure/procedure.do">채용 절차</a></li>
                        <li><a href="../web/apply/faq/list.do">FAQ</a></li>
                        <li><a href="../web/apply/notification/list.do">채용 공고</a></li>
                        <li><a href="../web/apply/notification/personDb.do">인재 DB</a></li>
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
    <!-- 로그인 후  :: 임시 세션 저장 -->
	<% if(session.getAttribute("id") !=null && session.getAttribute("id").equals("hyebin1902")){ %>
	 <a href="/Hanwha/apply/resume/personal_info.do">마이페이지</a>
	 <a href="/Hanwha/member/logoutAction.do">로그아웃</a>
	 <%} %>
	 <%= session.getAttribute("id") %>
	 
	 <%if(session.getAttribute("id") == null) { %>
        <!-- 로그인 전 -->
    <span class="photo">
		<img src="/Hanwha/images/common/img_blank.png" alt="">
	</span>
    <a href="/Hanwha/member/login.do" class="login">로그인</a>
    </li>
    <%} %>
<script type="text/javascript">
    $(document).ready(function() {
        var recruitCnt = "11";
        $("#menuRecruit").text(recruitCnt+"건");
    });
    
    function topBookmarkReload() {
        jQuery.getJSON("../web/common/bookmark/top_list.do", function(data) {
            $(".bookmark").empty();
            
            var html = '';
            var size = 0;
            
            for (var i = 0; i < data.bookmarkRecruitList.length; i++) {
                var bookmark = data.bookmarkRecruitList[i];
                
                html += '<li>';
                html += '   <a href="/web/apply/notification/view.do?rtSeq=' + bookmark.recruit.seq + '">';
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
                    html += '<a href="/web/meet/subsidiary/view.do?seq=' + bookmark.sdSeq + '">' + bookmark.topLayerTtl + '</a>';
                } else if (bookmark.tp == "2") {
                    html += '<a href="/web/meet/detail_job/view.do?sdSeq=' + bookmark.sdSeq + '&djSeq=' + bookmark.djSeq + '" onclick="HANWHAIN.layer.open(this, 742);return false;">';
                    html += '   ' + bookmark.topLayerTtl;
                    html += '</a>';
                } else if (bookmark.tp == "3") {
                    html += '<a href="/web' + bookmark.url + '">' + bookmark.topLayerTtl + '</a>';
                } else if (bookmark.tp == "4") {
                    html += '<a href="/web/meet/job_interview/view_iframe.do?seq=' + bookmark.jiSeq + '" title="팝업띄움" onclick="HANWHAIN.layer.open(this, 918);return false;">';
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
</body>
</html>