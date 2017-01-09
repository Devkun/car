<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=1004">
<meta name="title" content="한화그룹 채용사이트 한화in">
<meta name="description"
	content="한화그룹 채용사이트 한화인, 계열사 신입채용/경력채용/인턴채용 등 지원서 온라인접수, 채용절차 확인, 채용 관련 콘텐츠 수록">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한화의 사업&lt;Hanwha&lt;한화인 채용사이트</title>



<!-- <link rel="stylesheet" href="../css/style.css">
<script src="./js/jquery-1.11.2.min.js"></script>
<script src="./js/jquery-d.js"></script>
<script src="./js/jquery-fakeform-0.5.js"></script>
<script src="./js/hanwhain.js"></script>
<script src="./js/common.js"></script>
<script src="./js/jquery.common.js"></script>
<script src="./js/bookmark.js"></script>
<script src="./js/facebook.js"></script> -->
<!--[if lt IE 9]>
<script src="/web/js/html5.js"></script>
<![endif]-->


<script type="text/javascript">
	
</script>

<script type="text/javascript">
	/**
	미제출 지원서
	 */
	function fnIndexViewApplyDetail(param) {
		var keys = [ 'rtSeq' ], values = [ param ], params = keys.reduce(
				function(previous, key, index) {
					previous[key] = values[index];
					return previous
				}, {})
		postLink("./web/images/apply/resume/personal_info.do", params, "_self");
	}
</script>
</head>
<body data-nav-current='1-1-0' class='depth2'>
	<div id="wrap">
	<!-- header 부분 시작 -->
	<jsp:include page="../../inc/header.jsp"/>
	<!-- header 부분 끝 -->

		<!-- Container -->
		<div id="container" class="wide">

			<section id="contents">
				<span class="blind">본문</span>
				<!-- Contents -->

				<!-- Contents -->
				<div class="visual business">
					<img src="/Hanwha/images/hanwha/top_business.jpg" alt="">
					<h2 class="blind">Hanwha</h2>
					<h3 class="blind">한화의 사업</h3>
					<p class="details">
						<strong>이제 글로벌 
						<img src="/Hanwha/images/apply/tx_hanwha.png" alt="한화">의 꿈이 하늘 높이
							비상합니다.
						</strong> 어제보다 더 나은 오늘, 오늘보다 더 큰 내일<br> 한화가 만들어갑니다.
					</p>
				</div>

				<section class="business">
					<h4>불꽃을 품은 사람들이 꿈을 키워가는 회사, 한화</h4>
					<p>
						<strong> 1952년 한국 화약 주식회사의 창립으로 시작된 한화그룹은<br> 60여 년
							긴 시간 동안 수많은 위기와 어려움에도 불구하고 끊임없는 변화와<br> 혁신을 추구해왔으며, 가슴에 뜨거운
							불꽃을 품은 한화인들이<br> 살아 숨 쉬는 역사를 만들어 가고 있는 기업입니다.
						</strong> <small> 한화인들은 '사업으로 국가에 보답한다'라는 사업보국(<span class="ch">事業報國</span>)
							정신을 바탕으로 6·25전쟁에 의해 황폐해진 조국의 기간산업 육성에 기여하고자 노력하였고, '화약'을 통해 인생을
							점화하며 한화그룹의 성장에서 더 나아가 대한민국의 경제 성장을 이끌어가고 있습니다. 자본금 5억 원으로 시작된
							한화그룹은 현재 자산 총액 122조 원, 매출액 38조 원을 달성하였으며, 변화를 두려워하지 않는 도전정신으로 새로운
							사업 분야를 개척하며 지속 성장을 이루어 왔습니다.
						</small> <small> 한화그룹은 국내 52개 계열사, 해외 126개 글로벌 네트워크를 통해 고객 만족을 넘어
							고객 가치 창출을 위한 혁신적인 제품과 서비스를 제공하고 있습니다. 새로운 세대의 지속적인 성장을 위한 태양광 사업을
							비롯하여 방산, 화학, 소재, 해외 건설 사업 등 핵심 사업을 강화하며 글로벌 리딩 그룹으로의 도약을 목표로 정진하고
							있으며 가슴에 뜨거운 불꽃을 품은 인재들과 함께 꿈을 그려 나가는 회사가 되고자 합니다. </small>
					</p>
				</section>

				<section class="business-area">
					<h4>한화인의 불꽃이 빛나는 사업영역</h4>
					<article>
						<ul class="tab-type auto">
							<li class="on"><a href="#tab-content" title="현재 탭">제조·건설</a></li>
							<li><a href="#tab-content2">금융</a></li>
							<li><a href="#tab-content3">서비스·레저</a></li>
						</ul>
						<!-- 제조·건설 -->
						<div id="tab-content" class="tab-contents">
							<h5 class="blind">제조·건설</h5>
							<p>
								Quality Growth 2020의 비전 실현을 위한 핵심적 역할을 담당하고 있는<br> 「제조ㆍ건설
								부문」은 방위산업, 화학산업, 태양광 에너지, 해외 자원 개발 등<br> 신성장 동력을 강화하고 있습니다.
								<!--<small>
					특히 기후 변화 및 에너지 고갈에 대응하는 사업인 태양광 에너지 사업은 한화가 지구와 인류의 지속<br>
					가능한 미래에 기여하겠다는 중장기 비전을 가지고 적극적으로 추진 중인 미래 성장사업입니다.
				</small>-->
							</p>

							<h6>관련 계열사</h6>
							<ul>
								<li><a href="/web/meet/subsidiary/view.do?seq=264">(주)한화/화약</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=194">(주)한화/방산</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=193">(주)한화/무역</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=192">(주)한화/기계</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=327&schTp=1">한화테크윈</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=328&schTp=1">한화탈레스</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=340&schTp=1">한화디펜스</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=197">한화케미칼</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=325&schTp=1">한화종합화학</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=326&schTp=1">한화토탈</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=182">한화건설</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=198">한화큐셀</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=196">한화첨단소재</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=199">한화컴파운드</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=195">한화에너지</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=216">한화도시개발</a></li>
							</ul>
						</div>
						<!-- // 제조·건설 -->

						<!-- 금융 -->
						<div id="tab-content2" class="tab-contents" style="display: none">
							<h5 class="blind">금융</h5>
							<p>
								한화그룹의 성장을 선도하고 있는 「금융 부문」은 생명보험, 손해보험,<br> 증권, 자산운용에 이르는 종합
								금융 네트워크를 구축하여<br> 삶의 질을 높이는 금융 서비스를 제공합니다.
								<!--<small>
					풍부한 경험과 전문성을 활용하여 국내는 물론 베트남 현지에서도<br>
					고객들이 신뢰할 수 있는 보험 상품을 제공하고 있으며, 중국 및 인도네시아 등의 현지 사업을 통해<br>
					아시아 신흥 시장 진출을 가시화 하고 있습니다.
				</small>-->
							</p>

							<h6>관련 계열사</h6>
							<ul>
								<li><a href="/web/meet/subsidiary/view.do?seq=201">한화생명</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=202">한화손해보험</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=208">한화투자증권</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=207">한화자산운용</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=203">한화인베스트먼트</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=204">한화저축은행</a></li>
							</ul>
						</div>
						<!-- // 금융 -->

						<!-- 서비스·레저 -->
						<div id="tab-content3" class="tab-contents" style="display: none">
							<h5 class="blind">서비스·레저</h5>
							<p>
								고급화/차별화 전략을 추구하고 있는 「서비스·레저 부문」은<br> 고객에게 새로운 경험과 맞춤형 서비스를
								제공함으로써<br> 삶의 즐거움을 선사하고자 합니다.
								<!--<small>
					새로운 프리미엄 리조트 체인과 세계적 수준의 아쿠아리움 '한화 아쿠아 플라넷'의 잇따른 성공적<br>
					런칭을 주도한 한화호텔앤드리조트를 비롯하여, 차별화된 리뉴얼을 통해 브랜드 가치를 제고하여<br>
					'Asia NO.1 Premium Retailer'로 성장 중인 한화갤러리아 등의 각 계열사는 글로벌 시장의 생활ㆍ레저<br>
					문화를 선도해 감으로써 소비자들에게 새로운 즐거움을 전하고자 합니다.
				</small>-->
							</p>

							<h6>관련 계열사</h6>
							<ul>
								<li><a href="/web/meet/subsidiary/view.do?seq=214">한화호텔&amp;리조트</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=210">한화갤러리아</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=209">한화63시티</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=330&schTp=3">에스엔에스에이스</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=215">한화S&amp;C</a></li>
								<!-- 				<li><a href="/web/meet/subsidiary/view.do?seq=213">한 컴</a></li> -->
								<li><a href="/web/meet/subsidiary/view.do?seq=211">한화역사</a></li>
								<li><a href="/web/meet/subsidiary/view.do?seq=212">한화이글스</a></li>
							</ul>
						</div>
						<!-- // 서비스·레저 -->
					</article>
				</section>

				<!--15.03.17 삭제-->
				<!--
<section class="business-diagram">
    <p>
        <strong>불꽃을 품은 여러분이 Quality Growth 2020의 주역입니다.</strong>
		<small>
			한화는 비즈니스를 통한 인류의 건강한 번영에 이바지하고자 하는 신념을 가지고 있습니다.
			우리는 세계 곳곳에서 보다 나은 삶의 터전을 만들고, 청정하고 무한하며 지속 가능한 에너지를 생산하고 있으며 윤택하고 편리한 삶을 위한 금융 서비스를 제공함과 함께
			프리미엄 쇼핑과 레저를 통해 특별한 추억을 만들어 드리고자 합니다. 
		</small>
		<small>
			한화는 고객의 에너지로 커 가고 고객은 한화의 에너지로 풍요로워질 것입니다. 이것이 바로 한화가 추구하는 Quality Growth의 핵심입니다.<br>
			한화의 비전인 「Quality Growth 2020」은 세계로 도약하는 한화의 성장전략이기도 하며, 앞으로 이 비전에 따라 주요 사업부문들은 세계적인 경쟁력을 갖추고,
			직원·고객·사회와 함께 성장하는 기업문화를 정착시켜 나갈 것입니다.<br>
			이제, 여러분들이 「Quality Growth 2020」의 주역으로서 뜨거운 꿈을 펼칠 차례입니다.
		</small>
    </p>
    
    <figure>
        <img src="/web/images/hanwha/tx_business.png" alt="아래 텍스트 참조">
        <figcaption class="blind">
            <h3>Quality Growth 2020</h3>
            <ul>
                <li>
                    <dl>
                        <dt>GROWTH</dt>
                        <dd>그룹의 미래를 견인할 확고한 성장 축 장착</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>EXCELLENCE</dt>
                        <dd>업계 선도적 회사 및 사업 확충</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>TRANSFORMATION</dt>
                        <dd>고객 중심, 성과 지향의 新 조직문화 구축</dd>
                    </dl>
                </li>
            </ul>
            
            <h4>신성장 동력</h4>
            <ul>
                <li>
                    <dl>
                        <dt>태양광 에너지</dt>
                        <dd>기후 변화 및 에너지 고갈에 대응하는 사업에서 경쟁력 확보</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>금융·서비스</dt>
                        <dd>금융, 레저, 건강 등 삶의 질을 고양할 수 있는 서비스의 리더</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>화학·소재</dt>
                        <dd>미래형 기술을 통해 인류의 삶에 더 나은 가치 제공</dd>
                    </dl>
                </li>
            </ul>
            
            <h4>글로벌 전략</h4>
            <ul>
                <li>
                    <dl>
                        <dt>세계화</dt>
                        <dd>성장 산업 및 고부가 가치 사업을 중심으로 세계 진출</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>현지화</dt>
                        <dd>현지 시장의 성장에 기여하는 파트너로서 위상 확립</dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>시너지</dt>
                        <dd>계열사 동반 진출로 시너지 극대화</dd>
                    </dl>
                </li>
            </ul>
        </figcaption>
    </figure>
</section>
-->
				<!-- 관심 컨텐츠 등록 -->
				<!-- 관심 컨텐츠 등록 -->
				<p class="bookmark">
					도움이 되셨나요? <small>관심 컨텐츠로 저장하고, 간편하게 확인하세요.</small> <a href="#">관심
						컨텐츠 등록</a>
				</p>
				<script type="text/javascript" src="/Hanwha/js/jquery.form.js"></script>
				<script>
					// 관심 컨텐츠 등록 버튼 토글 예시
					$('p.bookmark a').each(
							function() {
								var btn = $(this), maked = btn
										.hasClass('selected');
								btn.click(function() {

									var returnUrl = location.pathname
											+ location.search;
									returnUrl = returnUrl.replace("/web", "");
									fnNeedLogin("/web", "관심컨텐츠 추가는 ",
											returnUrl, "");

									return false;

								});
							});
				</script>
				<!-- 관심 컨텐츠 등록 -->
				<form id="bookmarkForm" name="bookmarkForm">
					<input type="hidden" name="tp" value="3" /> <input type="hidden"
						name="ttl" value="Hanwha > 한화의 사업" /> <input type="hidden"
						name="smllTtl" value="한화의 사업" /> <input type="hidden"
						name="mblTtl" value="한화의 사업" /> <input type="hidden" name="url"
						value="/hanwha/business/business.do" /> <input type="hidden"
						name="mblUrl" value="/hanwha/info.do" /> <input type="hidden"
						name="action" />
				</form>
				<!-- 관심 컨텐츠 등록 -->

				<ul class="link-type2 line">
					<li>
						<dl class="faq">
							<dt>FAQ</dt>
							<dd>
								한화에 궁금한 점을 물어보세요.<br> 친절히 답변해 드리겠습니다.<br> <a
									href="/web/apply/faq/list.do">FAQ</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="tip">
							<dt>한화 inside</dt>
							<dd>
								한화인이 직접 알려드리는<br> 채용 합격 비결을 확인해 보세요.<br> <a
									href="/web/meet/employment_tip/list.do">한화 inside 보기</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl class="notice">
							<dt>채용 공고</dt>
							<dd>
								한화와 함께 꿈을 실현 시킬<br> 인재를 기다립니다.<br> <a
									href="/web/apply/notification/list.do">채용 공고 보기</a>
							</dd>
						</dl>
					</li>
				</ul>

				<!-- // Contents -->
			</section>

		</div>
		<!-- // Container -->

		<!-- Footer -->
		<!-- Footer -->
		<footer>
			<!-- 계열사 바로가기 -->
			<div id="lay-family"  style="display: none;">
				<div class="lay-family">
					<div class="container">
						<dl>
							<dt>제조·건설</dt>
							<dd>
								<ul>
									<li><a href="http://www.hanwhacorp.co.kr" target="_blank"
										title="새창열림">(주)한화/화약</a></li>
									<li><a href="http://www.hwenc.co.kr" target="_blank"
										title="새창열림">한화건설</a></li>
									<li><a href="http://www.hanwhacorp.co.kr" target="_blank"
										title="새창열림">(주)한화/방산</a></li>
									<li><a href="http://www.hanwha-qcells.com" target="_blank"
										title="새창열림">한화큐셀</a></li>
									<li><a href="http://www.hanwhacorp.co.kr" target="_blank"
										title="새창열림">(주)한화/무역</a></li>
									<li><a href="http://www.hwam.co.kr" target="_blank"
										title="새창열림">한화첨단소재</a></li>
									<li><a
										href="http://www.hanwhacorp.co.kr/machinery/index.jsp"
										target="_blank" title="새창열림">(주)한화/기계</a></li>
									<li><a href="http://hec.hanwha.co.kr/main.do"
										target="_blank" title="새창열림">한화에너지</a></li>
									<li><a href="http://www.hanwhatechwin.co.kr"
										target="_blank" title="새창열림">한화테크윈</a></li>
									<li><a href="http://www.hcd21.co.kr/" target="_blank"
										title="새창열림">한화도시개발</a></li>
									<li><a href="http://www.hanwhathales.com" target="_blank"
										title="새창열림">한화탈레스</a></li>
									<li><a href="http://www.hanwhacompound.co.kr"
										target="_blank" title="새창열림">한화컴파운드</a></li>
									<li><a href="http://hcc.hanwha.co.kr" target="_blank"
										title="새창열림">한화케미칼</a></li>
									<li><a href="http://hgc.hanwha.com" target="_blank"
										title="새창열림">한화종합화학</a></li>
									<li><a href="http://www.hanwha-total.com" target="_blank"
										title="새창열림">한화토탈</a></li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>금융</dt>
							<dd>
								<ul>
									<li><a href="http://www.hanwhalife.com" target="_blank"
										title="새창열림">한화생명</a></li>
									<li><a href="http://www1.hwgeneralins.com" target="_blank"
										title="새창열림">한화손해보험</a></li>
									<li><a href="http://www.hanwhafund.co.kr" target="_blank"
										title="새창열림">한화자산운용</a></li>
									<li><a href="https://www.hanwhawm.com" target="_blank"
										title="새창열림">한화투자증권</a></li>
									<li><a href="http://www.hanwhainvestment.co.kr"
										target="_blank" title="새창열림">한화인베스트먼트</a></li>
									<li><a href="http://www.hanwhasbank.com" target="_blank"
										title="새창열림">한화저축은행</a></li>
								</ul>
							</dd>
						</dl>
						<dl>
							<dt>서비스·레저</dt>
							<dd>
								<ul>
									<li><a href="http://www.hwrc.co.kr" target="_blank"
										title="새창열림">한화호텔앤드리조트</a></li>
									<li><a href="http://www.hanwhagalleria.co.kr"
										target="_blank" title="새창열림">한화갤러리아</a></li>
									<li><a href="http://www.63realty.co.kr" target="_blank"
										title="새창열림">한화63시티</a></li>
									<li><a href="http://www.hsnc.co.kr" target="_blank"
										title="새창열림">한화S&C</a></li>
									<li><a href="http://www.hwsd.co.kr" target="_blank"
										title="새창열림">한화역사</a></li>
									<li><a href="http://www.hanwhaeagles.co.kr"
										target="_blank" title="새창열림">한화이글스</a></li>
									<li><a href="http://www.gosns.co.kr" target="_blank"
										title="새창열림">한화에스테이트</a></li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!-- //계열사 바로가기 -->
			<span class="blind">바닥글</span>
			<section>
				<img src="../../images/common/hanwha2.png" alt="Hanwha" class="bi">
				<ul class="util">
					<li><a href="http://www.hanwha.co.kr/" target="_blank"
						title="새창열림">한화그룹</a></li>
					<li><a href="http://edu.hanwha.co.kr/" target="_blank"
						title="새창열림">한화인재경영원</a></li>
					<li><a href="/web/etc/clause.do" title="새창열림">이용약관</a></li>
					<li><a href="/web/etc/privacy.do" title="새창열림">개인정보처리방침</a></li>
				</ul>
				<address>
					<img src="../../images/common/copyright.png"
						alt="Copyright &copy; 2015 Hanwha Group. All rights reserved.">
				</address>

				<ul class="share">
					<li><a href="https://www.facebook.com/hanwhadays"
						target="_blank" class="facebook" title="새창열림">한화데이즈 페이스북</a></li>
					<li><a href="https://twitter.com/hanwhadays" target="_blank"
						class="twitter" title="새창열림">한화데이즈 트위터</a></li>
					<li><a href="http://blog.hanwhadays.com/" target="_blank"
						class="blog" title="새창열림">한화데이즈 블로그</a></li>
					<li><a href="#none" class="family" title="레이어열림">계열사 바로가기</a>
					</li>
				</ul>
			</section>
		</footer>
		<!-- // Footer -->
	</div>

	<!-- 전체 메뉴 -->
	<section id="allmenu" class="menu">
	<a href="#" class="close hidden">팝업닫기</a><div class="space"></div>
		<div class="container">
			<h1 class="blind">전체메뉴</h1>
			<ul class="tabs">
				<li class="on"><a href="#"> 가슴 속에 불꽃을<br> 품고있는 당신<br>
						<strong>한화인 <em>전체</em></strong>
				</a></li>
				<li><a href="#"> 신입의 패기로 미래가<br> 되고 싶은<br> <strong>예비
							불꽃인 <em>추천</em>
					</strong>
				</a></li>
				<li><a href="#"> 본인의 꿈과 진로에<br> 대해 고민하는<br> <strong>이
							시대의 청년 <em>추천</em>
					</strong>
				</a></li>
				<li><a href="#"> 완숙한 노련미로<br> 꿈을 펼치고 싶은<br> <strong>경력
							지원자 <em>추천</em>
					</strong>
				</a></li>
			</ul>
			<div class="tab-contents">
				<ul>
					<li>
						<h2>Hanwha</h2>
						<ul>
							
						<li data-index="0" data-sub-index="0"><a href="/web/hanwha/business/business.do">한화의 사업</a></li>
						<li data-index="0" data-sub-index="1"><a href="/web/hanwha/history/history.do">한화가 걸어온 길</a></li>
						<li data-index="0" data-sub-index="2"><a href="/web/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
						<li data-index="0" data-sub-index="3"><a href="/web/hanwha/personal_system/personal.do">한화의 제도</a></li>
						</ul>
						<figure>
							<a href="/web/hanwha/history/history.do"> <img
								src="../../images/main/img_menu.png" alt="">
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
							<li data-index="1" data-sub-index="0"><a href="/web/dream/dream_tune/dream_tune.do">DREAM
									TUNES</a></li>
							<li data-index="1" data-sub-index="1"><a href="/web/dream/membership_program/list.do">멤버십
									프로그램</a></li>
						</ul>
						<figure>
							<a href="/web/dream/dream_tune/dream_tune.do"> <img
								src="../../images/main/img_menu2.png" alt="">
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
							<li data-index="2" data-sub-index="0"><a href="/web/meet/subsidiary/list.do">계열사 소개</a></li>
						<li data-index="2" data-sub-index="1"><a href="/web/meet/detail_job/list.do">직무 소개</a></li>
						<li data-index="2" data-sub-index="2"><a href="/web/meet/employment_tip/list.do">한화 inside</a></li>
						</ul>
						<figure>
							<a href="/web/meet/detail_job/list.do"> <img
								src="../../images/main/img_menu3.png" alt="">
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
						<li data-index="3" data-sub-index="0"><a href="/web/apply/procedure/procedure.do">채용 절차 </a></li>
						<li data-index="3" data-sub-index="1"><a href="/web/apply/faq/list.do">FAQ</a></li>
						<li data-index="3" data-sub-index="2"><a href="/web/apply/notification/list.do">채용 공고</a></li>
						<li data-index="3" data-sub-index="3"><a href="/web/apply/notification/personDb.do">인재 DB</a></li>
						</ul>
						<figure>
							<a href="/web/apply/notification/list.do"> <img
								src="/Hanwha/images/main/img_menu4.png" alt="">
								<figcaption>
									<em>채용 공고</em>
									<p>
										현재 <strong id="menuRecruit">15건</strong>의 채용 공고가 있습니다.
									</p>
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
		var nl = document.createElement('script');
		nl.type = 'text/javascript';
		nl.src = ('https:' == document.location.protocol ? 'https://'
				: 'http://')
				+ 'www.hanwhain.com/web/js/wlo.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(nl, s);
		var done = false;
		nl.onload = nl.onreadystatechange = function() {
			if (!done
					&& (!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
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
<div id="fb-root" class=" fb_reset">
<div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
<div>
<iframe name="fb_xdm_frame_https" frameborder="0" allowtransparency="true" allowfullscreen="true" scrolling="no" id="fb_xdm_frame_https" aria-hidden="true" title="Facebook Cross Domain Communication Frame" tabindex="-1" src="https://staticxx.facebook.com/connect/xd_arbiter/r/iPrOY23SGAp.js?version=42#channel=f37a155b37fc1e4&amp;origin=https%3A%2F%2Fwww.hanwhain.com" style="border: none;"></iframe>
</div>
</div>
<div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
<div></div>
</div>
</div>
</body>
</html>
