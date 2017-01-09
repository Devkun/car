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
<title>Dream Tunes&lt;Dream&lt;한화인 채용사이트</title>



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
<body  data-nav-current='2-1-0'   class='depth2' >
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
                                          <img src="/Hanwha/images/common/Hanwhatoon_04.gif" alt="웹툰 이미지 4화" />
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
                            <img src="/Hanwha/upfile/others/contents/jobInterview/142563319472783531.jpg" alt="한화인 유승훈 사진" />
                            <figcaption>
                                <strong>유승훈</strong><br>
                                &#40;주&#41;한화/화약 / 생산기술<br>
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
        <a href="#lay-alim" class="photo" title="레이어열림">
        <b class="blind">알림메세지 :</b> <em>3</em>        <img src="/Hanwha/images/common/edge.png" alt="" class="edge">
            <img src="/Hanwha/image/member_photo.do" alt="" onError="fnErrorMemeberImg(this);">
          </a>
    <a href="#lay-alim" class="name" title="레이어열림">허혜빈</a>
    <!-- 알림 레이어 -->
    <div id="lay-alim" class="lay-alim" style="display:none">
        <img src="/Hanwha/images/common/arrow.png" alt="" class="arrow">
        <p>
            금요일,</br>
            1월 6일
            <span>2:43 <small>pm</small></span>
        </p>
        <ul>
            <li class="on">
                <a href="#" title="현재페이지">미제출 지원서 <span>3</span></a>
                <ul class="alim">
                                        <li>
                                                <a href="javascript:fnIndexViewApplyDetail(1438);">
                            <strong>
                                                                D-175
                                                                | [한화케미칼] CP/TP 분야 R&amp;...
                            </strong>
                            <small>작성일 2017.01.06</small>
                        </a>
                                            </li>
                                        <li>
                                                <a href="javascript:fnIndexViewApplyDetail(1707);">
                            <strong>
                                                                D-2
                                                                | [한화이글스] 부문별(구장관리, 용병 스...
                            </strong>
                            <small>작성일 2017.01.06</small>
                        </a>
                                            </li>
                                        <li>
                                                <a href="javascript:fnIndexViewApplyDetail(1713);">
                            <strong>
                                                                D-9
                                                                | [한화테크윈] [시큐리티부문] CMS 개발...
                            </strong>
                            <small>작성일 2016.12.30</small>
                        </a>
                                            </li>
                                    </ul>
            </li>
            <li>
                            <a href="#">관심 컨텐츠 <span>3</span></a>
                <ul class="bookmark" style="display:none">
                                                                       <li><a href="/Hanwha/meet/detail_job/view.do?sdSeq=264&djSeq=88" onclick="HANWHAIN.layer.open(this, 742);return false;">직무 소개 / &#40;주&#41;한화/화...</a></li>
                                                                          <li><a href="/Hanwha/meet/detail_job/view.do?sdSeq=215&djSeq=56" onclick="HANWHAIN.layer.open(this, 742);return false;">직무 소개 / 한화S&C / IT 설계/...</a></li>
                                                                          <li><a href="/Hanwha/hanwha/business/business.do">한화의 사업</a></li>
                                                      </ul>
            </li>
        </ul>
        <span class="btn">
            <a href="/Hanwha/member/mypage/mypage.do" class="mypage">마이페이지</a>
            <a href="/Hanwha/static/j_spring_security_logout.sec" class="logout">로그아웃</a>
         <a href="#lay-alim" class="name" title="레이어열림">허혜빈</a>
        </span>
    </div>
    <!-- // 알림 레이어 -->
    </li>
<script type="text/javascript">
    $(document).ready(function() {
        var recruitCnt = "7";
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
                    html += '<a href="/Hanwha' + bookmark.url + '">' + bookmark.topLayerTtl + '</a>';
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
<script src="/Hanwha/js/dreamtune.js"></script>
<!-- intro -->
<section id="dt-intro" class="dreamtune intro">
    <h1 class="blind">내게 맞는 한화인은?</h1>
    
    <div class="hgroup">
        <h2>가슴 속 <em>불꽃</em>을 찾아보세요.</h2>
        한화에는 꿈을 펼칠 수 있는 많은 계열사와 다양한 직무가 있습니다.<br>
        간단한 질문을 통해 나의 성향과 장점에 맞는 한화의 계열사와 직무를 추천해 드립니다.<br>
        당신의 가슴 속 불꽃을 펼칠 수 있는 계열사와 직무를 확인해보세요.
    </div>
    <div class="cardcase">
        <img src="/Hanwha/images/dream/img_card_front.png" alt="" class="front">
        <img src="/Hanwha/images/dream/img_card_back1.png" alt="" class="card1">
        <img src="/Hanwha/images/dream/img_card_back2.png" alt="" class="card2">
        <img src="/Hanwha/images/dream/img_card_back3.png" alt="" class="card3">
        <img src="/Hanwha/images/dream/img_card_back4.png" alt="" class="card4">
        <img src="/Hanwha/images/dream/img_card_back5.png" alt="" class="card5">
        <img src="/Hanwha/images/dream/img_card_back6.png" alt="" class="card6">
        <img src="/Hanwha/images/dream/img_card_back7.png" alt="" class="card7">
        <img src="/Hanwha/images/dream/img_card_back8.png" alt="" class="card8">
    </div>
    <div class="btn-area">
        <a href="#" class="btn big go">시작하기</a>
    </div>
</section>
<!-- // intro -->

<!-- steps -->
<section id="dt-steps" class="dreamtune">
    <ul class="steps">
        <li class="on">
            <a href="#">1<br>STEP</a>
            <span><em>Q. 내 성향에 가까운 회사는?</em></span>
        </li>
        <li class="">
            <a href="#">2<br>STEP</a>
            <span><em>Q. 나의 능력은?</em></span>
        </li>
        <li>
            <a href="#">3<br>STEP</a>
            <span><em>Q. 나의 업무스타일은?</em></span>
        </li>
        <li>
            <a href="#">4<br>STEP</a>
            <span><em>Q. 내가 잘 할 수 있는 일은?</em></span>
        </li>
        <li>
            <a href="#">5<br>STEP</a>
            <span><em>Q. 나의 전문성은?</em></span>
        </li>
        <li>
            <a href="#">6<br>STEP</a>
            <span><em>Q. 내가 담당하고 싶은 업무는?</em></span>
        </li>
        <li>
            <a href="#">7<br>STEP</a>
            <!--<span><em></em></span>-->
        </li>
    </ul>
</section>
<!-- // steps -->

<!-- step 1 -->
<section id="dt-step1" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 내 성향에 가까운 회사는?</h2>
        <p>아래에는 성향이 다른 두 종류의 회사 타입이 있습니다.<br>
        비교해보고 자신의 업무 성향에 더 가까운 타입을 선택해 주세요.</p>
        <p class="result-ment">아래는 당신의 성향에 가까운 회사들입니다.<br>
        당신의 가슴 속 불꽃을 펼칠 준비가 되었나요?</p>
    </div>
    <ul class="steps-sub">
        <li><span>1/8</span></li>
        <li><span>2/8</span></li>
        <li><span>3/8</span></li>
        <li><span>4/8</span></li>
        <li><span>5/8</span></li>
        <li><span>6/8</span></li>
        <li><span>7/8</span></li>
        <li><span>8/8</span></li>
    </ul>   <span class="card">
      <a href="#" class="card7" data-card-no="1">
         고객지향
         <em>Customer Focus</em>
         <strong>고객의 불만과 요구사항을<br>
         체계적으로 수집하는 회사</strong>
      </a>
      <a href="#" class="card8" data-card-no="5">
         혁신
         <em>Innovation Risk Taking</em>
         <strong>성공 여부를 알 수 없는 일도<br>
         과감하게 시도하는 회사</strong>
      </a>
      <a href="#" class="card6" data-card-no="4">
         혁신
         <em>Innovation Risk Taking</em>
         <strong>신규 사업에 많은 시간과 비용을<br>
         아낌없이 투자하는 회사</strong>
      </a>
      <a href="#" class="card5" data-card-no="7">
         동반성장
         <em>Social Responsibility</em>
         <strong>업무 상 관련된 주체들과<br>
         장기적으로 상생하는 회사</strong>
      </a>
      <a href="#" class="card2" data-card-no="2">
         고객지향
         <em>Customer Focus</em>
         <strong>고객의 요구사항을 전 구성원이<br>
         숙지하고 업무 처리에<br>
         반영하는 회사</strong>
      </a>
      <a href="#" class="card1" data-card-no="3">
         혁신
         <em>Innovation Being<br>
         Innovative</em>
         <strong>새로운 아이디어 제안을<br>
         적극적으로 권장하는 회사</strong>
      </a>
      <a href="#" class="card4" data-card-no="6">
         사회공헌
         <em>Social Responsibility</em>
         <strong>사회 공헌 및 참여 활동을<br>
         많이 하는 회사</strong>
      </a>
      <a href="#" class="card3" data-card-no="8">
         동반성장
         <em>Social Responsibility</em>
         <strong>협력업체와 함께<br>
         성장해 나가는 것을 중요하게<br>
         여기는 회사</strong>
      </a>
   </span>
    <div class="btn-area">
        <a href="#" class="btn big refresh">다시하기</a>
        <a href="#" class="btn big go">다음단계</a>
    </div>
</section>
<!-- // step 1 -->

<!-- step 2 -->
<section id="dt-step2" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 나의 능력은?</h2>
        당신에게는 다른 사람과 차별되는 능력들이 있습니다.<br>
        아래 내용을 보고 당신의 장점이라 생각되는 것을 1, 2, 3 순위로 골라보세요.
    </div>
    <ul class="rank">
        <li>1순위</li>
        <li>2순위</li>
        <li>3순위</li>
    </ul>
    <ul class="badge">
        <li class="badge1-1">
            <a href="#">구술 표현력</a>
            <span><em>다른 사람에게 전달하려는 정보 혹은 아이디어를 이야기나 설명으로 전달하는 능력</em></span>
        </li>
        <li class="badge1-2">
            <a href="#">문장 표현력</a>
            <span><em>전달하려는 정보나 아이디어를 문서나 글로 작성해서 누구에게나 이해시키는 능력</em></span>
        </li>
        <li class="badge1-3">
            <a href="#">사고의 유창성</a>
            <span><em>주제에 상관없이 다양하고 많은 아이디어를 생각해낼 수 있는 능력</em></span>
        </li>
        <li class="badge1-4">
            <a href="#">독창성</a>
            <span><em>특정 문제를 해결하기 위해 창의적인 아이디어를 제시할 수 있는 능력</em></span>
        </li>
        <li class="badge1-5">
            <a href="#">문제 지각력</a>
            <span><em>무엇이 잘못되었는지, 또는 무엇이 잘못되어 가는지를 파악하는 능력</em></span>
        </li>
        <li class="badge1-6">
            <a href="#">수리적 추리력</a>
            <span><em>복잡한 수리적인 문제를 어떤 공식이나 방법을 동원해야 하는지 파악하는 능력</em></span>
        </li>
        <li class="badge1-7">
            <a href="#">계산 능력</a>
            <span><em>빠르고 정확하게 사칙연산(덧셈, 뺄셈, 곱셈, 나눗셈)을 하는 능력</em></span>
        </li>
        <li class="badge1-8">
            <a href="#">공간 지각</a>
            <span><em>내 현재 위치나, 다른 물건들의 위치 등을 파악하는 능력</em></span>
        </li>
        <li class="badge1-9">
            <a href="#">시각화</a>
            <span><em>사물의 전체나 부분이 변경되었을 떄 이후에 어떤 모양일지 머릿속에 그리는 능력</em></span>
        </li>
        <li class="badge1-10">
            <a href="#">멀티태스킹</a>
            <span><em>한 번에 두 가지 이상의 여러가지 일들을 동시에 해낼 수 있는 능력</em></span>
        </li>
    </ul>
    <div class="btn-area">
        <a href="#" class="btn big go">다음단계</a>
    </div>
</section>
<!-- // step 2 -->

<!-- step 3 -->
<section id="dt-step3" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 나의 업무스타일은?</h2>
        당신의 업무스타일이 궁금합니다. 일이나 과제를 할 때 가장 중요하게 생각하는 것은 무엇입니까?<br>
        아래 항목에서 1, 2, 3 순위를 골라보세요.
    </div>
    <ul class="rank">
        <li>1순위</li>
        <li>2순위</li>
        <li>3순위</li>
    </ul>
    <ul class="badge style">
        <li class="badge2-1">
            <a href="#">성취지향성</a>
            <span><em>나는 도전적인 성취 목표를 세우고, 완벽한 과제 수행을 위해 끊임없이 노력한다.</em></span>
        </li>
        <li class="badge2-2">
            <a href="#">자발성</a>
            <span><em>나는 자발적으로 책임을 도맡으며 도전할 수 있는 기회를 만들어간다.</em></span>
        </li>
        <li class="badge2-3">
            <a href="#">팀워크</a>
            <span><em>나는 타인과 함께 일하는 것을 즐기며 더 큰 시너지를 내려고 노력한다.</em></span>
        </li>
        <li class="badge2-4">
            <a href="#">사교성</a>
            <span><em>나는 다른 사람과 일할 때는 더 많이 소통하며 알아가고 친해지고 싶어진다.</em></span>
        </li>
        <li class="badge2-5">
            <a href="#">꼼꼼함</a>
            <span><em>나는 일이 마무리될 때까지 세심히 주의를 기울여서 완벽함을 추구한다.</em></span>
        </li>
        <li class="badge2-6">
            <a href="#">윤리</a>
            <span><em>나는 정직하고 윤리적인 가치관을 가지고 있으며 이를 기준으로 업무에 임한다.</em></span>
        </li>
        <li class="badge2-7">
            <a href="#">혁신</a>
            <span><em>나는 독창적이거나 창의적인 아이디어를 제안해서 업무를 해결하려 노력한다.</em></span>
        </li>
        <li class="badge2-8">
            <a href="#">분석적 사고</a>
            <span><em>나는 문제가 발생한 상황에 대해 논리적으로 접근하여 문제를 분석한다.</em></span>
        </li>
    </ul>
    <div class="btn-area">
        <a href="#" class="btn big go">다음단계</a>
    </div>
</section>
<!-- // step 3 -->

<!-- step 4 -->
<section id="dt-step4" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 내가 잘 할 수 있는 일은?</h2>
        누구보다 이것은 자신있다고 생각하는 일이 있으신가요?<br>
        아래 보기 중에서 당신이 잘 할 수 있는 것을 1, 2, 3 순위로 골라보세요.
    </div>
    <ul class="rank">
        <li>1순위</li>
        <li>2순위</li>
        <li>3순위</li>
    </ul>
    <ul class="badge">
        <li class="badge3-1">
            <a href="#">대인관계 센스</a>
            <span><em>다른 사람들과 활발히 대화하고 돌아오는 반응을 빠르고 센스있게 이해하기</em></span>
        </li>
        <li class="badge3-2">
            <a href="#">설득</a>
            <span><em>다른 사람이 마음이나 행동을 바꿀수 있도록 언어적, 비언어적인 방법으로 설득하기</em></span>
        </li>
        <li class="badge3-3">
            <a href="#">협상</a>
            <span><em>서로 다른 의견이나 생각의 차이를 좁혀서 하나의 결론에 도달시켜 의견 조율하기</em></span>
        </li>
        <li class="badge3-4">
            <a href="#">복잡한 문제 해결</a>
            <span><em>복잡한 문제에 대해 다양한 해결책들을 떠올리고 그 중 최선의 방법으로 문제 해결하기</em></span>
        </li>
        <li class="badge3-5">
            <a href="#">운영분석</a>
            <span><em>다양한 요구사항과 고려해야 할 사항들을 숙지하고 그 일의 전체적인 계획 세우기</em></span>
        </li>
        <li class="badge3-6">
            <a href="#">기술 설계</a>
            <span><em>고객의 요구를 만족시키기 위한 적재적소의 장비와 기술을 파악하기</em></span>
        </li>
        <li class="badge3-7">
            <a href="#">프로그래밍</a>
            <span><em>목적에 따라 어떤 컴퓨터 프로그램을 사용할지 파악하고 결정하기</em></span>
        </li>
        <li class="badge3-8">
            <a href="#">운용 모니터링</a>
            <span><em>다양한 지표들을 확인하고 기계의 정상 작동 여부를 정확히 판단하기</em></span>
        </li>
        <li class="badge3-9">
            <a href="#">고장 진단/탐구</a>
            <span><em>설비에 문제가 생겼을 때 원인을 파악하고 문제 해결을 위한 방법을 도출하기</em></span>
        </li>
        <li class="badge3-10">
            <a href="#">품질 관리 분석</a>
            <span><em>첨단기술이나 과학 원리를 응용하여 제품, 서비스 등을 유지하거나 향상시키기</em></span>
        </li>
        <li class="badge3-11">
            <a href="#">의사결정</a>
            <span><em>기회비용이나 이익 등을 전반적으로 고려하여 각 상황에 맞는 최선의 결정내리기</em></span>
        </li>
        <li class="badge3-12">
            <a href="#">시스템 분석</a>
            <span><em>사람, 기술, 환경 등에 관련된 업무 시스템을 체계화하고 효과적으로 정리하기</em></span>
        </li>
        <li class="badge3-13">
            <a href="#">재정 관리</a>
            <span><em>어떠한 일을 추진하기 위해 써야 할 비용을 미리 예상하고 그 지출에 대해 설명하기</em></span>
        </li>
        <li class="badge3-14">
            <a href="#">물자 관리</a>
            <span><em>특정 작업에 필요한 장비, 시설, 재료를 파악하여 적절하게 구입하고 관리하기</em></span>
        </li>
        <li class="badge3-15">
            <a href="#">인적자원 관리</a>
            <span><em>사람들의 능력과 잠재력을 파악하고 어떤 일을 맡겨야 하는지 판단하기 </em></span>
        </li>
    </ul>
    <div class="btn-area">
        <a href="#" class="btn big go">다음단계</a>
    </div>
</section>
<!-- // step 4 -->

<!-- step 5 -->
<section id="dt-step5" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 나의 전문성은?</h2>
        전문성 있는 지식이 전문가를 만듭니다.<br>
        당신에게 전문성이 높다고 생각하는 것을 1, 2, 3 순위로 골라보세요.
    </div>
    <ul class="rank">
        <li>1순위</li>
        <li>2순위</li>
        <li>3순위</li>
    </ul>
    <ul class="badge">
        <li class="badge4-1">
            <a href="#">행정 및 경영</a>
            <span><em>사람 혹은 자원들과의 효율적 배분과 협력을 이끌어내는 경영에 관한 지식</em></span>
        </li>
        <li class="badge4-2">
            <a href="#">사무</a>
            <span><em>행정 및 사무적인 절차와 문서 작성, 기록 등의 업무 시스템에 대한 지식</em></span>
        </li>
        <li class="badge4-3">
            <a href="#">경제 및 회계</a>
            <span><em>경제와 회계 원칙, 재정 데이터 분석에 대한 지식</em></span>
        </li>
        <li class="badge4-4">
            <a href="#">세일즈 및 마케팅</a>
            <span><em>상품과 서비스 판매를 위한 원칙과 효과적인 방법에 대한 지식</em></span>
        </li>
        <li class="badge4-5">
            <a href="#">고객 및 대인<br>서비스</a>
            <span><em>고객 서비스와 대인 서비스 제공을 위한 원칙과 절차에 관한 지식</em></span>
        </li>
        <li class="badge4-6">
            <a href="#">인사관리</a>
            <span><em>인재를 위한 인사채용, 교육, 노사 관계와 협상, 인사 시스템에 대한 지식</em></span>
        </li>
        <li class="badge4-7">
            <a href="#">생산 및 절차</a>
            <span><em>제품을 생산하는 전체 과정 및 유통과정에 대한 지식</em></span>
        </li>
        <li class="badge4-8">
            <a href="#">컴퓨터 및 전자</a>
            <span><em>컴퓨터 부품에 대한 지식을 비롯한 컴퓨터 활용에 대한 지식</em></span>
        </li>
        <li class="badge4-9">
            <a href="#">기술 및 공학</a>
            <span><em>공학과 기술의 실질적인 적용과 이에 대한 지식</em></span>
        </li>
        <li class="badge4-10">
            <a href="#">디자인</a>
            <span><em>제품 생산에 관련된 디자인 기술, 도구, 원리에 대한 지식</em></span>
        </li>
        <li class="badge4-11">
            <a href="#">건축 및 토목</a>
            <span><em>건축 및 토목시설의 건설과 수리에 관한 지식</em></span>
        </li>
        <li class="badge4-12">
            <a href="#">기계</a>
            <span><em>기계나 도구의 사용법, 수리 및 유지보수에 대한 지식</em></span>
        </li>
        <li class="badge4-13">
            <a href="#">수학</a>
            <span><em>응용수학(연산, 대수학, 기하학, 미적분, 통계)에 대한 지식</em></span>
        </li>
        <li class="badge4-14">
            <a href="#">물리학</a>
            <span><em>물리 원칙 및 물리 현상을 이해하기 위한 응용 프로그램 및 프로세스에 대한 지식</em></span>
        </li>
        <li class="badge4-15">
            <a href="#">화학</a>
            <span><em>화학 물질의 사용과 처리에 대한 지식</em></span>
        </li>
        <li class="badge4-16">
            <a href="#">의학 및 치의학</a>
            <span><em>인간의 질병을 진단하고 치료하기 위한 방법에 대한 지식</em></span>
        </li>
        <li class="badge4-17">
            <a href="#">공공 보안 및 안보</a>
            <span><em>안보 정책, 절차 등에 관한 지식 및 사람, 데이터, 기관의 보안유지에 대한 지식</em></span>
        </li>
        <li class="badge4-18">
            <a href="#">법학 및 정치학</a>
            <span><em>법, 판례, 규정, 기관 규칙에 대한 지식</em></span>
        </li>
        <li class="badge4-19">
            <a href="#">전기통신</a>
            <span><em>통신 시스템(전송, 방송, 스위칭, 제어) 작동에 대한 지식</em></span>
        </li>
        <li class="badge4-20">
            <a href="#">커뮤니케이션과 미디어</a>
            <span><em>미디어 프로덕션, 통신, 배포 기술과 방법에 대한 지식</em></span>
        </li>
    </ul>
    <div class="btn-area">
        <a href="#" class="btn big go">다음단계</a>
    </div>
</section>
<!-- // step 5 -->

<!-- step 6 -->
<section id="dt-step6" class="dreamtune">
    <div class="hgroup">
        <h2><em>Q.</em> 내가 담당하고 싶은 업무는?</h2>
        하고 싶은 일을 하면 업무의 효율성은 더 높아집니다.<br>
        당신이 회사에서 담당하고 싶은 업무를 1, 2, 3 순위로 골라보세요.
    </div>
    <ul class="rank">
        <li>1순위</li>
        <li>2순위</li>
        <li>3순위</li>
    </ul>
    <ul class="badge">
        <li class="badge5-1">
            <a href="#">공정, 재료, 주변 상황 모니터링</a>
            <span><em>문제를 찾고 파악하기 위해 다양한 정보들을 모니터링하고 검토하는 일</em></span>
        </li>
        <li class="badge5-2">
            <a href="#">기계 작동 및 공정 확인</a>
            <span><em>기계의 작동 상태나 공정 상태를 검토하고 문제나 변화를 감지하는 일</em></span>
        </li>
        <li class="badge5-3">
            <a href="#">장비, 구조, 자재 검사</a>
            <span><em>결함이나 문제 발생의 원인을 확인하기 위해서 기계, 구조, 재료들을 검사하는 일</em></span>
        </li>
        <li class="badge5-4">
            <a href="#">제품, 공정 혹은 정보의<br>양적인 특징 파악</a>
            <span><em>업무를 하기 위해 필요한 자원인 재료, 비용, 시간 등을 파악하는 일 </em></span>
        </li>
        <li class="badge5-5">
            <a href="#">물건, 서비스 혹은<br>사람의 질적인 특징 파악</a>
            <span><em>회사의 자산이나 사람의 가치, 중요성을 파악하고 평가하는 일</em></span>
        </li>
        <li class="badge5-6">
            <a href="#">의사결정 및 문제 해결</a>
            <span><em>정보를 분석해서 문제를 해결하기 위한 최적의 방안을 결정하는 일</em></span>
        </li>
        <li class="badge5-7">
            <a href="#">최신 기술 습득 및 사용</a>
            <span><em>최신 기술을 배우고 새로운 지식을 업무 장면에 적용하는 일 </em></span>
        </li>
        <li class="badge5-8">
            <a href="#">목표와 전략 세우기</a>
            <span><em>장기적인 목표를 수립하고 그 목표를 달성하기 위한 전략과 활동들을 구체화하는 일</em></span>
        </li>
        <li class="badge5-9">
            <a href="#">소프트웨어 개발 및<br>프로그래밍</a>
            <span><em>컴퓨터나 컴퓨터 시스템을 활용해서 데이터나 정보를 처리하고, 프로그래밍 하는 일 </em></span>
        </li>
        <li class="badge5-10">
            <a href="#">기안 작성, 설계,<br>기술적 장비, 부품, 설비<br>등의 정보 명시</a>
            <span><em>장비나 기계를 어떻게 조립하고 관리하는 것인지 설명하는 일</em></span>
        </li>
        <li class="badge5-11">
            <a href="#">기계, 장비 수리 및 유지</a>
            <span><em>장비나 기계를 직접 정비하거나 수리하고 테스트하는 일 </em></span>
        </li>
    </ul>
    <div class="btn-area">
        <a href="./dream_tune_result.do" class="btn big go">결과보기</a>
    </div>
</section>
<!-- // step 6 -->
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