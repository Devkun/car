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
<title>개인정보&lt;지원서 작성하기&lt;채용공고&lt;Apply&lt;한화인 채용사이트</title>



<link rel="stylesheet" href="/Hanwha_0106view/web/css/style.css">
<script src="/Hanwha_0106view/web/js/jquery-1.11.2.min.js"></script>
<script src="/Hanwha_0106view/web/js/jquery-d.js"></script>
<script src="/Hanwha_0106view/web/js/jquery-fakeform-0.5.js"></script>
<script src="/Hanwha_0106view/web/js/hanwhain.js"></script>
<script src="/Hanwha_0106view/web/js/common.js"></script>
<script src="/Hanwha_0106view/web/js/jquery.common.js"></script>
<script src="/Hanwha_0106view/web/js/bookmark.js"></script>
<script src="/Hanwha_0106view/web/js/facebook.js"></script>
<!--[if lt IE 9]>
<script src="/web/js/html5.js"></script>
<![endif]-->


<script src="/Hanwha_0106view/web/js/manager.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
					
					
        var personalTrblDisp = "";
        if( personalTrblDisp == "Y") {
            $("select[name='personal.trblCd']").fakeselect('show');
            $("#personalTrbl").show();
        }
        
        var armyUseYn = "Y";
        if(armyUseYn == "Y") {
            var armyEsntTp = "";
            if ( armyEsntTp != "1") {
                //군별
                $("select[name='army.byCd']").prop("disabled", true).fakeselect();
                //복무기간
                $("select[name='army.svcPrdStrtYm.year']").prop("disabled", true).fakeselect();
                $("select[name='army.svcPrdStrtYm.month']").prop("disabled", true).fakeselect();
                $("select[name='army.svcPrdEndYm.year']").prop("disabled", true).fakeselect();
                $("select[name='army.svcPrdEndYm.month']").prop("disabled", true).fakeselect();
                //계급
                $("select[name='army.grdCd']").prop("disabled", true).fakeselect();
                //병과
                $("input[name='army.brnch']").prop("disabled", true);
                
                if ( armyEsntTp == "3") {
                    $("#spanArmyExmptRsn").show();
                    $("input[name='army.exmptRsn']").prop("disabled", false);
                } else {
                    $("input[name='army.exmptRsn']").prop("disabled", true);
                }
            }
        }
        textTypeAll();
    });
    
    $(function() {
		setHopeWorkplaceSelect();
	
        /**
        지원회사 변경시
        */
        $("select[name='tempSeq']").change(function() {
			if ($(this).val() != "") {
                var seqArr = $(this).val().split(":");
				$("#rjSeq").val(seqArr[0]);
				$("#ruSeq").val(seqArr[1]);
				
							} else {
				$("#rjSeq").val("");
				$("#ruSeq").val("");
			}
		});
        
        /**
        장애여부 선택시
        */
        $("input:radio[name='personal.trblYn']").click(function() {
            var flag = ($(this).val() == "Y") ? false : true; //대상일경우 Y, 비대상일 경우 N
            //장애코드 선택박스
            if(flag){
                $("select[name='personal.trblCd']").fakeselect('hide');
                $("#personalTrbl").hide()
            }else{
                $("select[name='personal.trblCd']").fakeselect('show');
                $("#personalTrbl").show()
            }
            //장애등급
            $("select[name='personal.trblGrdCd']").prop("disabled", flag).fakeselect();
            //장애인정일
            $("select[name='personal.trblAcknYm.year']").prop("disabled", flag).fakeselect();
            $("select[name='personal.trblAcknYm.month']").prop("disabled", flag).fakeselect();
            
            
        });
        
        /**
        병역사항 군필여부 선택시
        */
        $("input:radio[name='army.esntTp']").click(function() {
            var flag = ($(this).val() == "1") ? false : true;
            
            //면제사유
            if ($(this).val() == 3) {
                $("#spanArmyExmptRsn").show();
                $("input[name='army.exmptRsn']").prop("disabled", false);
            } else {
                $("#spanArmyExmptRsn").hide();
                $("input[name='army.exmptRsn']").val("");
                $("input[name='army.exmptRsn']").prop("disabled", true);
            }
            
            //군별
            $("select[name='army.byCd']").prop("disabled", flag).fakeselect();
            //복무기간
            $("select[name='army.svcPrdStrtYm.year']").prop("disabled", flag).fakeselect();
            $("select[name='army.svcPrdStrtYm.month']").prop("disabled", flag).fakeselect();
            $("select[name='army.svcPrdEndYm.year']").prop("disabled", flag).fakeselect();
            $("select[name='army.svcPrdEndYm.month']").prop("disabled", flag).fakeselect();
            //계급
            $("select[name='army.grdCd']").prop("disabled", flag).fakeselect();
            //병과
            $("input[name='army.brnch']").prop("disabled", flag);
        });
    });
    
    function fnResumePhotoPopup() {
        openWin("/web/dext/imageUpload.do?uploadPath=resume/photo&callBack=fnCallbackPhoto&callBackParam=0&tp=2&rtSeq=1713", "photo", 470, 300, "no", "no");
    }
    
    function fnCallbackPhoto(blankParam, seq) {
        $("#photo").attr("src","/web/image/resume_temp_photo.do?seq="+seq+"&rtSeq=1713");
        $("#photoImgSeq").val(seq);
    }
    
    function fnPostPopup() {
        var url = "";
        openWin("/web/common/zipcode/popup_list.do", "zipcode", 670, 700, "no", "no");
    }
    
    // 선택한 국내주소 받기
    function getAddr(zipNo, roadAddrPart1, roadAddrPart2, addrDetail) {
        /*
        roadAddrPart2 = roadAddrPart2.replace("&#40;", "(");
        roadAddrPart2 = roadAddrPart2.replace("&#41;", ")");
        */
        $("#zipcd").val(zipNo);
        $("#addr").val(roadAddrPart1);
        $("#addrDtl").val(addrDetail + ' ' + roadAddrPart2);
    }
    
    // 선택한 해외주소 받기
    function getOvseaAddr(county, zipcode, state) {
        $("#zipcd").val(zipcode);
        $("#addr").val(county);
        $("#addrDtl").val(state);
    }
    
    function fnTempSave() {
        var f = document.mainForm;
        $("input[name='ntnty']").fakecheck('enable');
        $("input[name='sex']").fakecheck('enable');
        HANWHAIN.clearPlaceHolderValues();
        f.submit();
    }
    
    function fnMove(url, stepFlag) {
        var msg = "현재 입력정보를 저장하고\n다음단계로 넘어가겠습니까?";
        if (stepFlag == "P") {
            msg = "현재 입력정보를 저장하고\n이전단계로 넘어가겠습니까?";
        }
        if (confirm(msg)) {
            $("input[name='ntnty']").fakecheck('enable');
            $("input[name='sex']").fakecheck('enable');
            HANWHAIN.clearPlaceHolderValues();
            $("#targetUrl").val(url);
            $("#mainForm").prop("target", "_self");
            $("#mainForm").prop("action", "https://www.hanwhain.com/web/apply/resume/personal_info_save.do");
            $("#mainForm").submit();
        }
    }
    
    /**
    이력서 미리보기
    */
    function fnPreview() {
        openWin("/web/apply/resume/resume_preview.do?rtSeq=1713", "resume_preview", 1000, 1000, "yes", "yes");
    }
    
    function fnApply() {
        if (confirm("제출전 지원서에 빠진 내용이 없는지 다시 한번 확인해보세요.\n제출하시겠습니까?")) {
            var email = jQuery.trim($("input[name='email']").val());
			var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			if (email != "" && !emailReg.test(email)) {
				 alert("이메일 형식을 확인해주세요.");
				 return;
			}
            $("input[name='ntnty']").fakecheck('enable');
            $("input[name='sex']").fakecheck('enable');
            HANWHAIN.clearPlaceHolderValues();
            var formData = $("#mainForm").serialize();
            jQuery.ajax(
                { type: "POST"
                , url: "/web/apply/resume/resumeValidator_ajax.do"
                , data: formData
                , async : false
                , dataType : "json"
                , success: function(response) {
                    if (response.status == 'FAIL') {
                        $("input[name='ntnty']").fakecheck('disable');
                        $("input[name='sex']").fakecheck('disable');
                        for(var i=0; i<response.result.length; i++){
                            alert(response.result[i].defaultMessage);
                            if(response.result[i].field != "lstSchsTp"){
                                if(response.result[i].field == "photoImg"){
                                    $("#photoLink").focus();
                                }else{
                                    var objType = $("input[name='"+response.result[i].field+"']").attr("type");
                                    if(objType) { //radio, text
                                        if(objType == "radio") {
                                            $("input[name='"+response.result[i].field+"']").eq(0).focus();
                                        }else{
                                            $("input[name='"+response.result[i].field+"']").focus();
                                        }
                                    } else { //select
                                        $("#"+response.result[i].field).focus();
                                    }
                                }
                                
                            }
                            return;
                        }
                    }else{
                        $("#mainForm").prop("target", "_self");
                        $("#mainForm").prop("action", "./recruit_finish.do");
                        $("#mainForm").submit();
                    }
                }
                , error : function(jqXHR, textStatus, errorThrown) {
                    $("input[name='ntnty']").fakecheck('disable');
                    $("input[name='sex']").fakecheck('disable');
                    alert("작성되지 않은 항목이 있습니다. \n개인정보 및 학력정보(대학, 전공 등)를 확인하시기 바랍니다.");
                    return;
                }
            });
        }
    }
    
    /**
    Qna 작성
    */
    function fnQnaWritePopup() {
        var rtSeq = $("#rtSeq").val();
        openWin("/web/member/mypage/myqna_write_popup.do?tp=2&rtSeq="+rtSeq+"&sdSeq=327", "myqna_write", 690, 500, "no", "no");
    }
    
    /**
    채용공고상세
    */
    function fnTopRecruitView() {
        if(confirm("현재 페이지를 나가실 건가요?\n작성 중인 지원서를 저장하셨는지\n확인해주세요")){
            move("/web/apply/notification/view.do?rtSeq=1713");
        }
    }
    
    /**
    나의 지원현황 보기
    */
    function fnTopMypageView() {
        if(confirm("현재 페이지를 나가실 건가요?\n작성 중인 지원서를 저장하셨는지\n확인해주세요")){
            move("/web/member/mypage/mypage.do");
        }
    }
	
	/**
	 * 병력사항 기간 검증
	 */
	function checkArmyPrd(idx) {
		var strtYm = parseInt($("select[name='army.svcPrdStrtYm.year']").val() + $("select[name='army.svcPrdStrtYm.month']").val());
		var endYm = parseInt($("select[name='army.svcPrdEndYm.year']").val() + $("select[name='army.svcPrdEndYm.month']").val());
		
		if (strtYm >= endYm) {
			alert("병력사항 기간 시작년월이 종료년월 보다 이전의 년월이어야 합니다."); 
			$("select[name='army.svcPrdEndYm.year").val("").fakeselect();
			$("select[name='army.svcPrdEndYm.month']").val("").fakeselect();
		}
	}
	
	// 고용디딤돌 지원회사 상세보기
	function fnDedemdolCompany() {
		var coNm = $("select[name='tempSeq'] option:selected").text();

		$(".layer-dimmed").show();
		$(".steppingstoneClose").show();
		$(".steppingstonePopup").show();
		
		if (coNm.indexOf("㈜대아테크") >= 0) {
			$(".steppingstonePopup_01").show();
		} else if (coNm.indexOf("삼성정공㈜") >= 0) {
			$(".steppingstonePopup_02").show();
		} else if (coNm.indexOf("일신테크㈜") >= 0) {
			$(".steppingstonePopup_03").show();
		} else if (coNm.indexOf("넵코어스㈜") >= 0) {
			$(".steppingstonePopup_04").show();
		} else if (coNm.indexOf("㈜시그널텍") >= 0) {
			$(".steppingstonePopup_05").show();
		} else if (coNm.indexOf("에이피엠씨") >= 0) {
			$(".steppingstonePopup_06").show();
		} else if (coNm.indexOf("우림테크") >= 0) {
			$(".steppingstonePopup_07").show();
		} else if (coNm.indexOf("㈜덕성테크원") >= 0) {
			$(".steppingstonePopup_08").show();
		} else if (coNm.indexOf("이엔피테크") >= 0) {
			$(".steppingstonePopup_09").show();			
		} else if (coNm.indexOf("형진정밀") >= 0) {
			$(".steppingstonePopup_10").show();
		} else if (coNm.indexOf("화신정밀") >= 0) {
			$(".steppingstonePopup_11").show();
		} else if (coNm.indexOf("대건테크") >= 0) {
			$(".steppingstonePopup_12").show();
		} else if (coNm.indexOf("KAT") >= 0) {
			$(".steppingstonePopup_13").show();
		} else if (coNm.indexOf("㈜태현테크원") >= 0) {
			$(".steppingstonePopup_14").show();
		} else if (coNm.indexOf("㈜형일시스템") >= 0) {
			$(".steppingstonePopup_15").show();
		} else if (coNm.indexOf("㈜모던텍") >= 0) {
			$(".steppingstonePopup_16").show();
		} else if (coNm.indexOf("㈜이티에이") >= 0) {
			$(".steppingstonePopup_17").show();
		} else if (coNm.indexOf("㈜제노코") >= 0) {
			$(".steppingstonePopup_18").show();
		} else if (coNm.indexOf("㈜키프코전자항공") >= 0) {
			$(".steppingstonePopup_19").show();
		} else if (coNm.indexOf("대흥사") >= 0) {
			$(".steppingstonePopup_20").show();
		} else if (coNm.indexOf("정화엔지니어랑") >= 0) {
			$(".steppingstonePopup_21").show();
		} else {
			alert('회사를 선택하시기 바랍니다.');
			$(".layer-dimmed").hide();
			$(".steppingstoneClose").hide();
			$(".steppingstonePopup").hide();
		}
	}
	
	// 희망근무지 시도
	function getSidoOptions(selVal) {
		var html = '';
		html += '<option value="">선택해주세요</option>';
				html += '<option value="서울"';
		if ("서울" == selVal) {
			html += ' selected="selected"';
		}
		html += '>서울</option>';
				html += '<option value="부산"';
		if ("부산" == selVal) {
			html += ' selected="selected"';
		}
		html += '>부산</option>';
				html += '<option value="대구"';
		if ("대구" == selVal) {
			html += ' selected="selected"';
		}
		html += '>대구</option>';
				html += '<option value="인천"';
		if ("인천" == selVal) {
			html += ' selected="selected"';
		}
		html += '>인천</option>';
				html += '<option value="광주"';
		if ("광주" == selVal) {
			html += ' selected="selected"';
		}
		html += '>광주</option>';
				html += '<option value="대전"';
		if ("대전" == selVal) {
			html += ' selected="selected"';
		}
		html += '>대전</option>';
				html += '<option value="울산"';
		if ("울산" == selVal) {
			html += ' selected="selected"';
		}
		html += '>울산</option>';
				html += '<option value="세종"';
		if ("세종" == selVal) {
			html += ' selected="selected"';
		}
		html += '>세종</option>';
				html += '<option value="경기"';
		if ("경기" == selVal) {
			html += ' selected="selected"';
		}
		html += '>경기</option>';
				html += '<option value="강원"';
		if ("강원" == selVal) {
			html += ' selected="selected"';
		}
		html += '>강원</option>';
				html += '<option value="충북"';
		if ("충북" == selVal) {
			html += ' selected="selected"';
		}
		html += '>충북</option>';
				html += '<option value="충남"';
		if ("충남" == selVal) {
			html += ' selected="selected"';
		}
		html += '>충남</option>';
				html += '<option value="전북"';
		if ("전북" == selVal) {
			html += ' selected="selected"';
		}
		html += '>전북</option>';
				html += '<option value="전남"';
		if ("전남" == selVal) {
			html += ' selected="selected"';
		}
		html += '>전남</option>';
				html += '<option value="경북"';
		if ("경북" == selVal) {
			html += ' selected="selected"';
		}
		html += '>경북</option>';
				html += '<option value="경남"';
		if ("경남" == selVal) {
			html += ' selected="selected"';
		}
		html += '>경남</option>';
				html += '<option value="제주"';
		if ("제주" == selVal) {
			html += ' selected="selected"';
		}
		html += '>제주</option>';
				html += '<option value="해외"';
		if ("해외" == selVal) {
			html += ' selected="selected"';
		}
		html += '>해외</option>';
				return html;
	}
	
	// 희망근무지 공고기준
	function getRecruitHopeWorkplaceOptions(selVal) {
		var html = '';
				return html;
	}
	
	// 희망근무지 모집단위기준
	function getRecruitUnitHopeWorkplaceOptions(selVal, ruSeq) {
		var html = '';
				return html;
	}
	
	function setHopeWorkplaceSelect() {
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
        postLink("/web/apply/resume/personal_info.do", params, "_self");
    }
</script>
</head>
<body  data-nav-current='4-3-1'   class='depth3' >
<div id="wrap">
	<!-- Header -->
	<header>
		<script src="/Hanwha_0106view/web/js/grayscale.js"></script>
<script src="/Hanwha_0106view/web/js/hanwhain.js"></script>

<span id="skipNav">
    <a href="#contents">본문바로가기</a>
    <a href="#gnb">대메뉴바로가기</a>
</span>

<h1><a href="/web/"><img src="/Hanwha_0106view/web/images/common/hanwha.png" alt="Hanwha in"></a></h1>

<span class="blind">주메뉴</span>
<section id="gnb">
    <ul class="nav">
        <li>
            <a href="/web/hanwha/business/business.do">Hanwha</a>
            <div class="lay-sub">
                <section class="sectionNew">
                    <p>한화가<br>
                    궁금하신가요?</p>
                    <ul>
                        <li><a href="/web/hanwha/business/business.do">한화의 사업</a></li>
                        <li><a href="/web/hanwha/history/history.do">한화가 걸어온 길</a></li>
                        <li><a href="/web/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
                        <li><a href="/web/hanwha/personal_system/personal.do">한화의 제도</a></li>
                    </ul>
			<!-- 2015-05-18 수정 [s] -->
											<aside>
						<h3 style="position:absolute;top:-20px;left:23px;z-index:20">한화 역사 웹툰</h3>
						<figure>
														<img src="/Hanwha_0106view/web/images/common/webtoon_04.gif" alt="웹툰 이미지 4화" />
							<figcaption>
							불꽃처럼 <br />한화처럼<br />
							<a href="/web/hanwha/history/history.do?webToonNo=1" title="페이지 이동" >웹툰 보기</a>
							</figcaption>
						</figure>
					</aside>

								<!-- 2015-05-18 수정 [e] -->
                </section>
            </div>
        </li>
        <li>
            <a href="/web/dream/dream_tune/dream_tune.do">Dream</a>
            <div class="lay-sub">
                <section>
                    <p>한화에서<br>
                    당신의 꿈을<br>
                    찾아 드립니다.</p>
                    <ul>
                        <li><a href="/web/dream/dream_tune/dream_tune.do">Dream Tunes</a></li>
                        <li><a href="/web/dream/membership_program/list.do">멤버십 프로그램</a></li>
                    </ul>
                </section>
            </div>
        </li>
        <li>
            <a href="/web/meet/subsidiary/list.do">Meet</a>
            <div class="lay-sub">
                <section>
                    <p>한화의 계열사와<br>
                    한화인들을<br>
                    만나보세요.</p>
                    <ul>
                        <li><a href="/web/meet/subsidiary/list.do">계열사 소개</a></li>
                        <li><a href="/web/meet/detail_job/list.do">직무 소개</a></li>
                        <li><a href="/web/meet/employment_tip/list.do">한화 inside</a></li>
						<li class="kHide"><a href="/web/meet/meet_hanwhain/list.do">Meet 한화인</a></li>
                    </ul>
										<aside>
                        <h3>Meet 한화인</h3>
                        <figure>
                            <img src="/Hanwha_0106view/web/upfile/others/contents/jobInterview/142563346545608666.jpg" alt="한화인 박수경 사진" />
                            <figcaption>
                                <strong>박수경</strong><br>
                                (주)한화/방산 / 인사<br>
                                <a href="/web/meet/meet_hanwhain/list.do" title="meet한화인 페이지 이동">인터뷰 보기</a>
                            </figcaption>
                        </figure>
                    </aside>
					                </section>
            </div>
        </li>
        <li>
            <a href="/web/apply/procedure/procedure.do">Apply</a>
            <div class="lay-sub">
                <section>
                    <p>한화와 함께<br>
                    꿈을 실현하세요.</p>
                    <ul>
                        <li><a href="/web/apply/procedure/procedure.do">채용 절차</a></li>
                        <li><a href="/web/apply/faq/list.do">FAQ</a></li>
                        <li><a href="/web/apply/notification/list.do">채용 공고</a></li>
                        <li><a href="/web/apply/notification/personDb.do">인재 DB</a></li>
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
        obj.src='/Hanwha_0106view/web/images/common/img_blank.png';
        return;
    }
    </script>
    <!-- 로그인 후 -->
        <a href="#lay-alim" class="photo" title="레이어열림">
        <b class="blind">알림메세지 :</b> <em>2</em>        <img src="/Hanwha_0106view/web/images/common/edge.png" alt="" class="edge">
				<img src="/web/image/member_photo.do" alt="" onError="fnErrorMemeberImg(this);">
		    </a>
    <a href="#lay-alim" class="name" title="레이어열림">허혜빈</a>
    <!-- 알림 레이어 -->
    <div id="lay-alim" class="lay-alim" style="display:none">
        <img src="/Hanwha_0106view/web/images/common/arrow.png" alt="" class="arrow">
        <p>
            수요일,</br>
            1월 4일
            <span>2:43 <small>pm</small></span>
        </p>
        <ul>
            <li class="on">
                <a href="#" title="현재페이지">미제출 지원서 <span>2</span></a>
                <ul class="alim">
                                        <li>
                                                <a href="javascript:fnIndexViewApplyDetail(1713);">
                            <strong>
                                                                D-11
                                                                | [한화테크윈] [시큐리티부문] CMS 개발...
                            </strong>
                            <small>작성일 2016.12.30</small>
                        </a>
                                            </li>
                                        <li>
                                                <a href="javascript:fnIndexViewApplyDetail(1711);">
                            <strong>
                                                                D-2
                                                                | [한화큐셀] 2016년 한화큐셀(주) ...
                            </strong>
                            <small>작성일 2016.12.30</small>
                        </a>
                                            </li>
                                    </ul>
            </li>
            <li>
				                <a href="#">관심 컨텐츠 <span>3</span></a>
                <ul class="bookmark" style="display:none">
                    																	<li><a href="/web/meet/detail_job/view.do?sdSeq=264&djSeq=88" onclick="HANWHAIN.layer.open(this, 742);return false;">직무 소개 / &#40;주&#41;한화/화...</a></li>
						                    												<li><a href="/web/meet/detail_job/view.do?sdSeq=215&djSeq=56" onclick="HANWHAIN.layer.open(this, 742);return false;">직무 소개 / 한화S&C / IT 설계/...</a></li>
						                    												<li><a href="/web/hanwha/business/business.do">한화의 사업</a></li>
						                                    </ul>
            </li>
        </ul>
        <span class="btn">
            <a href="/web/member/mypage/mypage.do" class="mypage">마이페이지</a>
            <a href="/web/static/j_spring_security_logout.sec" class="logout">로그아웃</a>
			<a href="#lay-alim" class="name" title="레이어열림">허혜빈</a>
        </span>
    </div>
    <!-- // 알림 레이어 -->
    </li>
<script type="text/javascript">
    $(document).ready(function() {
        var recruitCnt = "8";
        $("#menuRecruit").text(recruitCnt+"건");
    });
    
    function topBookmarkReload() {
        jQuery.getJSON("/web/common/bookmark/top_list.do", function(data) {
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
	<!-- // Header -->
	
	<!-- Container -->
	<div id="container" class="wide">
		
		<section id="contents">
			<span class="blind">본문</span>
            <!-- Contents -->
                
<!-- 채용 공고 상세 -->
<div class="tit-area">
    <h2>채용 공고 상세 <strong>지원서 작성하기</strong></h2>
    <a href="javascript:fnTopRecruitView();" class="back">이전페이지로 가기</a>
    <a href="javascript:fnTopMypageView();" class="my" title="나의 지원현황 보기">나의 지원현황 보기</a>
</div>
<!-- // 채용 공고 상세 -->
<!-- Contents -->
<div class="visual apply">
    <img src="/Hanwha_0106view/web/images/apply/top_apply.jpg" alt="">
    <h3>[시큐리티부문] CMS 개발 경력사원 채용</h3>
</div>


		
		
		
<ul class="tab-type">
    <li class="on"><a href="#" title="현재페이지">개인정보</a></li>
    <li><a href="javascript:fnMove('scholarship_info.do','N')">학력정보</a></li>
        <li><a href="javascript:fnMove('talent.do','N')">외국어/자격증/수상경력</a></li>
            <li><a href="javascript:fnMove('international_activity.do','N')">대외활동</a></li>
            <li><a href="javascript:fnMove('career.do','N')">경력사항</a></li>
            <li><a href="javascript:fnMove('introduce.do','N')">자기소개서</a></li>
        
</ul>
<form id="mainForm" name="mainForm" method="post" action="https://www.hanwhain.com/web/apply/resume/personal_info_save.do">
                    <input type="hidden" id="rtSeq" name="rtSeq" value="1713"  >                     <input type="hidden" id="seq" name="seq" value="397232"  >                     <input type="hidden" id="sbmsYn" name="sbmsYn" value="N"  >                     <input type="hidden" id="lstSchsTp" name="lstSchsTp" value="3"  >                     <input type="hidden" id="lstSchsGrdtYy" name="lstSchsGrdtYy" value=""  >     <input type="hidden" name="tabInfo" id="tabInfo" value="1"/>
    <input type="hidden" name="targetUrl" id="targetUrl"/>
<section class="apply">
    <h4 class="apply" data-tip-id="tip-content-area">지원 희망 분야 <small>필수 입력 항목 입니다.</small></h4>
    <p class="blind"><!-- 관련 팁 내용을 넣어주세요. --></p>
    <table class="tbl-type">
    <caption>지원회사,희망직무,희망연봉,희망직급,희망 근무지1,희망 근무지2로 구성된 지원희망분야 등록테이블입니다.</caption>
    <colgroup>
        <col style="width:116px">
        <col style="width:140px">
        <col style="width:125px">
        <col style="width:140px">
        <col style="width:125px">
        <col style="width:140px">
    </colgroup>
		        <tr>
            <th scope="row">지원회사</th>
            <td colspan="5">                <input type="text" id="subsidiary.nm" name="subsidiary.nm" value="한화테크윈" title='지원회사 입력' class='readonly' readonly> </td>
        </tr>
        <tr>
            <th scope="row" id="apply1-1">희망직무</th>
            <td headers="apply1-1" >
                                <select id="tempSeq" name="tempSeq" title='희망직무 선택' hname='희망직무'>
                    <option value="" >선택해주세요</option>
                            <option value="161:2945"
            >
            CMS 개발</option>
            </select>
                                <input type="hidden" id="rjSeq" name="rjSeq" value=""  >                                 <input type="hidden" id="ruSeq" name="ruSeq" value=""  >             </td>
                        <th scope="row" id="apply1-2">희망연봉</th>
            <td headers="apply1-2">
                                <select id="hopeSalCd" name="hopeSalCd" title='희망연봉 선택' hname='희망연봉'>
                    <option value="" >선택해주세요</option>
                            <option value="AAAAAA"
            >
            1억 이상</option>
                    <option value="AAAAAB"
            >
            9,000~1억</option>
                    <option value="AAAAAC"
            >
            8,000~9,000</option>
                    <option value="AAAAAD"
            >
            7,000~8,000</option>
                    <option value="AAAAAE"
            >
            6,000~7,000</option>
                    <option value="AAAAAF"
            >
            5,000~6,000</option>
                    <option value="AAAAAG"
            >
            4,000~5,000</option>
                    <option value="AAAAAH"
            >
            3,000~4,000</option>
                    <option value="AAAAAI"
            >
            2,000~3,000</option>
            </select>
            </td>
            <th scope="row" id="apply1-3">희망직급</th>
            <td headers="apply1-3">
                                <select id="hopeJbpsCd" name="hopeJbpsCd" title='희망직급 선택' hname='희망직급'>
                    <option value="" >선택해주세요</option>
                            <option value="ABAAAC"
            >
            사원</option>
                    <option value="ABAAAD"
            >
            대리</option>
                    <option value="ABAAAE"
            >
            과장</option>
                    <option value="ABAAAF"
            >
            차장</option>
                    <option value="ABAAAG"
            >
            부장</option>
            </select>
            </td>
                    </tr>
		
			        <tr id="apply_loc">
            <th scope="row" id="apply1-4">희망 근무지1</th>
            <td headers="apply1-4">
                                <select id="hopeWorkpl1" name="hopeWorkpl1" title='희망 근무지1 선택' hname='희망 근무지1'>
                    <option value="" >선택해주세요</option>
                            <option value="서울"
            >
            서울</option>
                    <option value="부산"
            >
            부산</option>
                    <option value="대구"
            >
            대구</option>
                    <option value="인천"
            >
            인천</option>
                    <option value="광주"
            >
            광주</option>
                    <option value="대전"
            >
            대전</option>
                    <option value="울산"
            >
            울산</option>
                    <option value="세종"
            >
            세종</option>
                    <option value="경기"
            >
            경기</option>
                    <option value="강원"
            >
            강원</option>
                    <option value="충북"
            >
            충북</option>
                    <option value="충남"
            >
            충남</option>
                    <option value="전북"
            >
            전북</option>
                    <option value="전남"
            >
            전남</option>
                    <option value="경북"
            >
            경북</option>
                    <option value="경남"
            >
            경남</option>
                    <option value="제주"
            >
            제주</option>
                    <option value="해외"
            >
            해외</option>
            </select>
            </td>
            <th scope="row" id="apply1-5">희망 근무지2</th>
            <td headers="apply1-5" colspan="3">
                                <select id="hopeWorkpl2" name="hopeWorkpl2" title='희망 근무지2 선택' hname='희망 근무지2'>
                    <option value="" >선택해주세요</option>
                            <option value="서울"
            >
            서울</option>
                    <option value="부산"
            >
            부산</option>
                    <option value="대구"
            >
            대구</option>
                    <option value="인천"
            >
            인천</option>
                    <option value="광주"
            >
            광주</option>
                    <option value="대전"
            >
            대전</option>
                    <option value="울산"
            >
            울산</option>
                    <option value="세종"
            >
            세종</option>
                    <option value="경기"
            >
            경기</option>
                    <option value="강원"
            >
            강원</option>
                    <option value="충북"
            >
            충북</option>
                    <option value="충남"
            >
            충남</option>
                    <option value="전북"
            >
            전북</option>
                    <option value="전남"
            >
            전남</option>
                    <option value="경북"
            >
            경북</option>
                    <option value="경남"
            >
            경남</option>
                    <option value="제주"
            >
            제주</option>
                    <option value="해외"
            >
            해외</option>
            </select>
            </td>
        </tr>
					    </table>
    
    <h4 class="pers" data-tip-id="tip-content-identity">인적사항 <small>필수 입력 항목 입니다. ( ※생년월일은 <strong>'마이페이지 > 개인정보수정'</strong>에서 변경할 수 있습니다. )</small></h4>
    <p class="blind"><!-- 관련 팁 내용을 넣어주세요. --></p>
    <div class="column-2 resume">
        <figure>
            <a href="javascript:fnResumePhotoPopup();" title="팝업띄움" id="photoLink">
                                    <img src="/Hanwha_0106view/web/images/apply/resume.gif" height="120" width="100" alt="이력서사진" id="photo" tabindex="0" >
                            </a>
                            <input type="hidden" id="photoImg" name="photoImg" value="" hname='이력서사진'>                             <input type="hidden" id="photoImgPath" name="photoImgPath" value="" hname='이력서사진'>                             <input type="hidden" id="photoImgSeq" name="photoImgSeq" value=""  >             <figcaption>사진 크기는 100px 120px로<br>
            업로드 해주시기 바랍니다.<br>
            가능파일 jpg, gif, png</figcaption>
        </figure>
        <table class="tbl-type">
        <caption>이름(한글),이름(한문),이름(영문),국적,생년월일,주소(으)로 구성된 인적사항 등록테이블입니다.</caption>
        <colgroup>
            <col style="width:105px">
            <col style="width:140px">
            <col style="width:120px">
            <col style="width:140px">
        </colgroup>
            <tr>
                <th scope="row" id="apply2-1">이름(한글)</th>
                <td headers="apply2-1">
                                    <input type="text" id="nm" name="nm" value="허혜빈" title='이름(한글) 입력' hname='이름(한글)' class='readonly' readonly maxlength='30'>                 </td>
                <th scope="row" id="apply2-2">이름(한문)</th>
                <td headers="apply2-2">
                                    <input type="text" id="hanNm" name="hanNm" value="" placeholder='한문이름을 입력하세요.' title='이름(한문) 입력' hname='이름(한문)' maxlength='150'>                 </td>
            </tr>
            <tr>
                <th scope="row" id="apply2-3">이름(영문)</th>
                <td headers="apply2-3" colspan="3">
                                    <input type="text" id="engNm" name="engNm" value="" placeholder='영문이름을 입력하세요. 예) KIL DONG HONG' title='이름(영문) 입력' hname='이름(영문)' style='width:100%' maxlength='150'>                 </td>
            </tr>
            <tr>
                <th scope="row" id="apply2-4">국적</th>
                <td headers="apply2-4" colspan="3">
                                            <label for="ntnty_0"><input type="radio" name="ntnty" value="1" id="ntnty_0"
         checked="checked"         title='국적 선택' hname='국적'
        >         내국인 </label>  
            <label for="ntnty_1"><input type="radio" name="ntnty" value="2" id="ntnty_1"
                title='국적 선택' hname='국적'
        >         외국인 </label>  
                    </td>
            </tr>
            <tr>
                <th scope="row" id="apply2-5">성별</th>
                <td headers="apply2-5" colspan="3">
                                            <label for="sex_0"><input type="radio" name="sex" value="1" id="sex_0"
                title='성별 선택' hname='성별'
        >         남자 </label>  
            <label for="sex_1"><input type="radio" name="sex" value="2" id="sex_1"
         checked="checked"         title='성별 선택' hname='성별'
        >         여자 </label>  
                    </td>
                
            </tr>
            <tr>
                <th scope="row" id="apply2-6">생년월일</th>
                <td headers="apply2-6" colspan="3">
                    <input type="text" name="showBrtd" title='생년월일 입력' hname='생년월일' class='readonly' value="1991.08.27" readonly />
                                    <input type="hidden" id="brtd" name="brtd" value="19910827" title='생년월일 입력' hname='생년월일' class='readonly' readonly>                 </td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td colspan="3">
                    <fieldset class="address">
                    <legend>주소</legend>
                        <ul>
                            <li>
                                                <input type="text" id="zipcd" name="zipcd" value="" title='우편번호 입력' hname='우편번호' class='code' readonly onclick='fnPostPopup();'>                             <a href="javascript:fnPostPopup();" class="btn small zipcode" title="팝업띄움">우편번호 검색</a></li>
                            <li>
                                                <input type="text" id="addr" name="addr" value="" title='기본주소 입력' hname='기본주소' class='readonly' maxlength='500' readonly onclick='fnPostPopup();'>                             </li>
                            <li>
                                                <input type="text" id="addrDtl" name="addrDtl" value="" title='상세주소 입력' hname='상세주소' maxlength='500'>                             </li>
                        </ul>
                    </fieldset>
                </td>
            </tr>
        </table>
    </div>
    
    <table class="tbl-type">
    <caption>핸드폰,집전화,이메일로 구성된 인적사항 등록테이블입니다.</caption>
    <colgroup>
        <col style="width:111px">
        <col style="width:282px">
        <col style="width:123px">
        <col>
    </colgroup>
        <tr>
            <th scope="row" id="apply3-1">핸드폰</th>
            <td headers="apply3-1">
                <fieldset class="phone">
                <legend>핸드폰번호 입력</legend>
                                    <select id="cph.no1" name="cph.no1" title='핸드폰 앞자리 선택' hname='핸드폰 앞자리'>
                            <option value="010"
            >
            010</option>
                    <option value="011"
            >
            011</option>
                    <option value="016"
            >
            016</option>
                    <option value="017"
            >
            017</option>
                    <option value="018"
            >
            018</option>
                    <option value="019"
            >
            019</option>
            </select>
                                    <input type="text" id="cph.no2" name="cph.no2" value="" title='핸드폰 중간자리 입력' hname='핸드폰 중간자리' maxlength='4' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>                                     <input type="text" id="cph.no3" name="cph.no3" value="" title='핸드폰 뒷자리 입력' hname='핸드폰 뒷자리' maxlength='4' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>                 </fieldset>
            </td>
            <th scope="row" id="apply3-2">집전화</th>
            <td headers="apply3-2">
                <fieldset class="phone">
                <legend>집전화번호 입력</legend>
                                    <select id="tel.no1" name="tel.no1" title='집전화 앞자리 선택' hname='집전화 앞자리'>
                            <option value="02"
            >
            02</option>
                    <option value="031"
            >
            031</option>
                    <option value="032"
            >
            032</option>
                    <option value="033"
            >
            033</option>
                    <option value="041"
            >
            041</option>
                    <option value="042"
            >
            042</option>
                    <option value="043"
            >
            043</option>
                    <option value="051"
            >
            051</option>
                    <option value="052"
            >
            052</option>
                    <option value="053"
            >
            053</option>
                    <option value="054"
            >
            054</option>
                    <option value="055"
            >
            055</option>
                    <option value="061"
            >
            061</option>
                    <option value="062"
            >
            062</option>
                    <option value="063"
            >
            063</option>
                    <option value="064"
            >
            064</option>
                    <option value="070"
            >
            070</option>
                    <option value="080"
            >
            080</option>
            </select>
                                    <input type="text" id="tel.no2" name="tel.no2" value="" title='집전화 중간자리 입력' hname='집전화 중간자리' maxlength='4' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>                                     <input type="text" id="tel.no3" name="tel.no3" value="" title='집전화 뒷자리 입력' hname='집전화 뒷자리' maxlength='4' onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'>                 </fieldset>
            </td>
        </tr>
        <tr>
            <th scope="row">이메일</th>
            <td colspan="3">
                                <input type="text" id="email" name="email" value="hyebin1902@gmail.com" title='이메일 입력' hname='이메일' style='width:248px' maxlength='250'>             </td>
        </tr>
    </table>
    
        <h4 class="etc" data-tip-id="tip-content-profile">개인신상 <small>필수 입력 항목 입니다.</small></h4>
    <p class="blind"><!-- 관련 팁 내용을 넣어주세요. --></p>
    <table class="tbl-type">
    <caption>취미,특기,보훈대상여부,기초생활수급자,장애여부,장애등급,장애인정일로 구성된 개인신상 등록테이블입니다.</caption>
    <colgroup>
        <col style="width:116px">
        <col style="width:160px">
        <col style="width:145px">
        <col>
    </colgroup>
                <tr>
            <th scope="row" id="apply4-3">보훈대상여부</th>
            <td headers="apply4-3">
                                         <label for="personal.vtrnYn_0"><input type="radio" name="personal.vtrnYn" value="N" id="personal.vtrnYn_0"
                ${attributes}
        >         비대상 </label>  
            <label for="personal.vtrnYn_1"><input type="radio" name="personal.vtrnYn" value="Y" id="personal.vtrnYn_1"
                ${attributes}
        >         대상 </label>  
                </td>
            <th scope="row" id="apply4-4">기초생활수급자</th>
            <td headers="apply4-4">
                                        <label for="personal.grwrkLfYn_0"><input type="radio" name="personal.grwrkLfYn" value="N" id="personal.grwrkLfYn_0"
                ${attributes}
        >         비대상 </label>  
            <label for="personal.grwrkLfYn_1"><input type="radio" name="personal.grwrkLfYn" value="Y" id="personal.grwrkLfYn_1"
                ${attributes}
        >         대상 </label>  
                </td>
        </tr>
        <tr>
            <th scope="row">장애여부</th>
            <td colspan="3">
                                        <label for="personal.trblYn_0"><input type="radio" name="personal.trblYn" value="N" id="personal.trblYn_0"
                ${attributes}
        >         비대상 </label>  
            <label for="personal.trblYn_1"><input type="radio" name="personal.trblYn" value="Y" id="personal.trblYn_1"
                ${attributes}
        >         대상 </label>  
                                    <select id="personal.trblCd" name="personal.trblCd" title='장애여부 선택' hname='장애여부' style='display:none;'>
                    <option value="" >선택하세요</option>
                            <option value="ACAAAA"
            >
            지체장애</option>
                    <option value="ACAAAB"
            >
            뇌병변장애</option>
                    <option value="ACAAAC"
            >
            시각장애</option>
                    <option value="ACAAAD"
            >
            청각장애</option>
                    <option value="ACAAAE"
            >
            언어장애</option>
                    <option value="ACAAAF"
            >
            지적장애</option>
                    <option value="ACAAAG"
            >
            정신장애</option>
                    <option value="ACAAAH"
            >
            자폐성장애</option>
                    <option value="ACAAAI"
            >
            신장장애</option>
                    <option value="ACAAAJ"
            >
            호흡기장애</option>
                    <option value="ACAAAK"
            >
            간장애</option>
                    <option value="ACAAAL"
            >
            안면장애</option>
                    <option value="ACAAAM"
            >
            장루/요루장애</option>
                    <option value="ACAAAO"
            >
            간질장애</option>
                    <option value="ACAAAP"
            >
            중증환자&#40;지병&#41;</option>
                    <option value="ACAAAQ"
            >
            국가유공자</option>
                    <option value="ACAAAR"
            >
            기타장애</option>
            </select>
            </td>
        </tr>
        <tr id="personalTrbl" style="display:none;">
            <th scope="row" id="apply4-5">장애등급</th>
            <td headers="apply4-5">
                                <select id="personal.trblGrdCd" name="personal.trblGrdCd" title='장애등급 선택' hname='장애등급'>
                    <option value="" >선택하세요</option>
                            <option value="ADAAAA"
            >
            1급</option>
                    <option value="ADAAAB"
            >
            2급</option>
                    <option value="ADAAAC"
            >
            3급</option>
                    <option value="ADAAAD"
            >
            4급</option>
                    <option value="ADAAAE"
            >
            5급</option>
                    <option value="ADAAAF"
            >
            6급</option>
                    <option value="ADAAAG"
            >
            7급</option>
            </select>
            </td>
            <th scope="row" id="apply4-6">장애인정일</th>
            <td headers="apply4-6">
                <fieldset class="date">
                <legend>장애인정일</legend>
                                    <select id="personal.trblAcknYm.year" name="personal.trblAcknYm.year" title='장애인정일(년도) 선택' hname='장애인정일(년도)'>
                    <option value="" >년</option>
                            <option value="2020"
            >
            2020</option>
                    <option value="2019"
            >
            2019</option>
                    <option value="2018"
            >
            2018</option>
                    <option value="2017"
            >
            2017</option>
                    <option value="2016"
            >
            2016</option>
                    <option value="2015"
            >
            2015</option>
                    <option value="2014"
            >
            2014</option>
                    <option value="2013"
            >
            2013</option>
                    <option value="2012"
            >
            2012</option>
                    <option value="2011"
            >
            2011</option>
                    <option value="2010"
            >
            2010</option>
                    <option value="2009"
            >
            2009</option>
                    <option value="2008"
            >
            2008</option>
                    <option value="2007"
            >
            2007</option>
                    <option value="2006"
            >
            2006</option>
                    <option value="2005"
            >
            2005</option>
                    <option value="2004"
            >
            2004</option>
                    <option value="2003"
            >
            2003</option>
                    <option value="2002"
            >
            2002</option>
                    <option value="2001"
            >
            2001</option>
                    <option value="2000"
            >
            2000</option>
                    <option value="1999"
            >
            1999</option>
                    <option value="1998"
            >
            1998</option>
                    <option value="1997"
            >
            1997</option>
                    <option value="1996"
            >
            1996</option>
                    <option value="1995"
            >
            1995</option>
                    <option value="1994"
            >
            1994</option>
                    <option value="1993"
            >
            1993</option>
                    <option value="1992"
            >
            1992</option>
                    <option value="1991"
            >
            1991</option>
                    <option value="1990"
            >
            1990</option>
                    <option value="1989"
            >
            1989</option>
                    <option value="1988"
            >
            1988</option>
                    <option value="1987"
            >
            1987</option>
                    <option value="1986"
            >
            1986</option>
                    <option value="1985"
            >
            1985</option>
                    <option value="1984"
            >
            1984</option>
                    <option value="1983"
            >
            1983</option>
                    <option value="1982"
            >
            1982</option>
                    <option value="1981"
            >
            1981</option>
                    <option value="1980"
            >
            1980</option>
                    <option value="1979"
            >
            1979</option>
                    <option value="1978"
            >
            1978</option>
                    <option value="1977"
            >
            1977</option>
                    <option value="1976"
            >
            1976</option>
                    <option value="1975"
            >
            1975</option>
                    <option value="1974"
            >
            1974</option>
                    <option value="1973"
            >
            1973</option>
                    <option value="1972"
            >
            1972</option>
                    <option value="1971"
            >
            1971</option>
                    <option value="1970"
            >
            1970</option>
                    <option value="1969"
            >
            1969</option>
                    <option value="1968"
            >
            1968</option>
                    <option value="1967"
            >
            1967</option>
                    <option value="1966"
            >
            1966</option>
                    <option value="1965"
            >
            1965</option>
                    <option value="1964"
            >
            1964</option>
                    <option value="1963"
            >
            1963</option>
                    <option value="1962"
            >
            1962</option>
                    <option value="1961"
            >
            1961</option>
                    <option value="1960"
            >
            1960</option>
                    <option value="1959"
            >
            1959</option>
                    <option value="1958"
            >
            1958</option>
                    <option value="1957"
            >
            1957</option>
                    <option value="1956"
            >
            1956</option>
                    <option value="1955"
            >
            1955</option>
                    <option value="1954"
            >
            1954</option>
                    <option value="1953"
            >
            1953</option>
                    <option value="1952"
            >
            1952</option>
                    <option value="1951"
            >
            1951</option>
                    <option value="1950"
            >
            1950</option>
                    <option value="1949"
            >
            1949</option>
                    <option value="1948"
            >
            1948</option>
                    <option value="1947"
            >
            1947</option>
                    <option value="1946"
            >
            1946</option>
                    <option value="1945"
            >
            1945</option>
                    <option value="1944"
            >
            1944</option>
                    <option value="1943"
            >
            1943</option>
                    <option value="1942"
            >
            1942</option>
                    <option value="1941"
            >
            1941</option>
                    <option value="1940"
            >
            1940</option>
                    <option value="1939"
            >
            1939</option>
                    <option value="1938"
            >
            1938</option>
                    <option value="1937"
            >
            1937</option>
                    <option value="1936"
            >
            1936</option>
                    <option value="1935"
            >
            1935</option>
                    <option value="1934"
            >
            1934</option>
                    <option value="1933"
            >
            1933</option>
                    <option value="1932"
            >
            1932</option>
                    <option value="1931"
            >
            1931</option>
                    <option value="1930"
            >
            1930</option>
            </select>
                                    <select id="personal.trblAcknYm.month" name="personal.trblAcknYm.month" title='장애인정일(월) 선택' hname='장애인정일(월)'>
                    <option value="" >월</option>
                            <option value="01"
            >
            01</option>
                    <option value="02"
            >
            02</option>
                    <option value="03"
            >
            03</option>
                    <option value="04"
            >
            04</option>
                    <option value="05"
            >
            05</option>
                    <option value="06"
            >
            06</option>
                    <option value="07"
            >
            07</option>
                    <option value="08"
            >
            08</option>
                    <option value="09"
            >
            09</option>
                    <option value="10"
            >
            10</option>
                    <option value="11"
            >
            11</option>
                    <option value="12"
            >
            12</option>
            </select>
                </fieldset>
            </td>
        </tr>
    </table>
            <h4 class="military" data-tip-id="tip-content-military">병역사항</h4>
    <p class="blind"><!-- 관련 팁 내용을 넣어주세요. --></p>
    <table class="tbl-type">
        <caption>군필여부,군별,복무기간,계급,병과로 구성된 병역사항 등록테이블입니다.</caption>
        <colgroup>
            <col style="width:116px">
            <col style="width:140px">
            <col style="width:145px">
            <col>
        </colgroup>
        <tr>
            <th scope="row">군필여부</th>
            <td colspan="3">
                                        <label for="army.esntTp_0"><input type="radio" name="army.esntTp" value="1" id="army.esntTp_0"
                ${attributes}
        >         필 </label>  
            <label for="army.esntTp_1"><input type="radio" name="army.esntTp" value="2" id="army.esntTp_1"
                ${attributes}
        >         미필 </label>  
            <label for="army.esntTp_2"><input type="radio" name="army.esntTp" value="3" id="army.esntTp_2"
                ${attributes}
        >         면제 </label>  
            <label for="army.esntTp_3"><input type="radio" name="army.esntTp" value="4" id="army.esntTp_3"
                ${attributes}
        >         비대상(여성, 외국인) </label>  
                </td>
        </tr>
        <tr id="spanArmyExmptRsn" style="display:none;">
            <th scope="row">면제사유</th>
            <td colspan="3">
                                 <input type="text" id="army.exmptRsn" name="army.exmptRsn" value="" title='면제사유 입력(200자 이내)' hname='면제사유' maxlength='200' style='width:100%'>             </td>
        </tr>
        <tr>
            <th scope="row">군별</th>
            <td colspan="3">
                                 <select id="army.byCd" name="army.byCd" title='군별 선택' hname='군별'>
                    <option value="" >선택하세요</option>
                            <option value="AEAAAA"
            >
            육군</option>
                    <option value="AEAAAB"
            >
            해군</option>
                    <option value="AEAAAC"
            >
            공군</option>
                    <option value="AEAAAD"
            >
            해병대</option>
                    <option value="AEAAAE"
            >
            공익요원</option>
                    <option value="AEAAAF"
            >
            의경</option>
                    <option value="AEAAAG"
            >
            병역특례</option>
            </select>
            </td>
        </tr>
        <tr>
            <th scope="row">복무기간</th>
            <td colspan="3">
                <fieldset class="date">
                <legend>복무기간</legend>
                                    <select id="army.svcPrdStrtYm.year" name="army.svcPrdStrtYm.year" title='복무기간 시작년도 선택' hname='복무기간 시작년도'>
                    <option value="" >년</option>
                            <option value="2020"
            >
            2020</option>
                    <option value="2019"
            >
            2019</option>
                    <option value="2018"
            >
            2018</option>
                    <option value="2017"
            >
            2017</option>
                    <option value="2016"
            >
            2016</option>
                    <option value="2015"
            >
            2015</option>
                    <option value="2014"
            >
            2014</option>
                    <option value="2013"
            >
            2013</option>
                    <option value="2012"
            >
            2012</option>
                    <option value="2011"
            >
            2011</option>
                    <option value="2010"
            >
            2010</option>
                    <option value="2009"
            >
            2009</option>
                    <option value="2008"
            >
            2008</option>
                    <option value="2007"
            >
            2007</option>
                    <option value="2006"
            >
            2006</option>
                    <option value="2005"
            >
            2005</option>
                    <option value="2004"
            >
            2004</option>
                    <option value="2003"
            >
            2003</option>
                    <option value="2002"
            >
            2002</option>
                    <option value="2001"
            >
            2001</option>
                    <option value="2000"
            >
            2000</option>
                    <option value="1999"
            >
            1999</option>
                    <option value="1998"
            >
            1998</option>
                    <option value="1997"
            >
            1997</option>
                    <option value="1996"
            >
            1996</option>
                    <option value="1995"
            >
            1995</option>
                    <option value="1994"
            >
            1994</option>
                    <option value="1993"
            >
            1993</option>
                    <option value="1992"
            >
            1992</option>
                    <option value="1991"
            >
            1991</option>
                    <option value="1990"
            >
            1990</option>
                    <option value="1989"
            >
            1989</option>
                    <option value="1988"
            >
            1988</option>
                    <option value="1987"
            >
            1987</option>
                    <option value="1986"
            >
            1986</option>
                    <option value="1985"
            >
            1985</option>
                    <option value="1984"
            >
            1984</option>
                    <option value="1983"
            >
            1983</option>
                    <option value="1982"
            >
            1982</option>
                    <option value="1981"
            >
            1981</option>
                    <option value="1980"
            >
            1980</option>
                    <option value="1979"
            >
            1979</option>
                    <option value="1978"
            >
            1978</option>
                    <option value="1977"
            >
            1977</option>
                    <option value="1976"
            >
            1976</option>
                    <option value="1975"
            >
            1975</option>
                    <option value="1974"
            >
            1974</option>
                    <option value="1973"
            >
            1973</option>
                    <option value="1972"
            >
            1972</option>
                    <option value="1971"
            >
            1971</option>
                    <option value="1970"
            >
            1970</option>
                    <option value="1969"
            >
            1969</option>
                    <option value="1968"
            >
            1968</option>
                    <option value="1967"
            >
            1967</option>
                    <option value="1966"
            >
            1966</option>
                    <option value="1965"
            >
            1965</option>
                    <option value="1964"
            >
            1964</option>
                    <option value="1963"
            >
            1963</option>
                    <option value="1962"
            >
            1962</option>
                    <option value="1961"
            >
            1961</option>
                    <option value="1960"
            >
            1960</option>
                    <option value="1959"
            >
            1959</option>
                    <option value="1958"
            >
            1958</option>
                    <option value="1957"
            >
            1957</option>
                    <option value="1956"
            >
            1956</option>
                    <option value="1955"
            >
            1955</option>
                    <option value="1954"
            >
            1954</option>
                    <option value="1953"
            >
            1953</option>
                    <option value="1952"
            >
            1952</option>
                    <option value="1951"
            >
            1951</option>
                    <option value="1950"
            >
            1950</option>
                    <option value="1949"
            >
            1949</option>
                    <option value="1948"
            >
            1948</option>
                    <option value="1947"
            >
            1947</option>
                    <option value="1946"
            >
            1946</option>
                    <option value="1945"
            >
            1945</option>
                    <option value="1944"
            >
            1944</option>
                    <option value="1943"
            >
            1943</option>
                    <option value="1942"
            >
            1942</option>
                    <option value="1941"
            >
            1941</option>
                    <option value="1940"
            >
            1940</option>
                    <option value="1939"
            >
            1939</option>
                    <option value="1938"
            >
            1938</option>
                    <option value="1937"
            >
            1937</option>
                    <option value="1936"
            >
            1936</option>
                    <option value="1935"
            >
            1935</option>
                    <option value="1934"
            >
            1934</option>
                    <option value="1933"
            >
            1933</option>
                    <option value="1932"
            >
            1932</option>
                    <option value="1931"
            >
            1931</option>
                    <option value="1930"
            >
            1930</option>
            </select>
                                    <select id="army.svcPrdStrtYm.month" name="army.svcPrdStrtYm.month" title='복무기간 시작월 선택' hname='복무기간 시작월'>
                    <option value="" >월</option>
                            <option value="01"
            >
            01</option>
                    <option value="02"
            >
            02</option>
                    <option value="03"
            >
            03</option>
                    <option value="04"
            >
            04</option>
                    <option value="05"
            >
            05</option>
                    <option value="06"
            >
            06</option>
                    <option value="07"
            >
            07</option>
                    <option value="08"
            >
            08</option>
                    <option value="09"
            >
            09</option>
                    <option value="10"
            >
            10</option>
                    <option value="11"
            >
            11</option>
                    <option value="12"
            >
            12</option>
            </select>
                    <em>~</em>
                                    <select id="army.svcPrdEndYm.year" name="army.svcPrdEndYm.year" title='복무기간 종료년도 선택' hname='복무기간 종료년도'>
                    <option value="" >년</option>
                            <option value="2020"
            >
            2020</option>
                    <option value="2019"
            >
            2019</option>
                    <option value="2018"
            >
            2018</option>
                    <option value="2017"
            >
            2017</option>
                    <option value="2016"
            >
            2016</option>
                    <option value="2015"
            >
            2015</option>
                    <option value="2014"
            >
            2014</option>
                    <option value="2013"
            >
            2013</option>
                    <option value="2012"
            >
            2012</option>
                    <option value="2011"
            >
            2011</option>
                    <option value="2010"
            >
            2010</option>
                    <option value="2009"
            >
            2009</option>
                    <option value="2008"
            >
            2008</option>
                    <option value="2007"
            >
            2007</option>
                    <option value="2006"
            >
            2006</option>
                    <option value="2005"
            >
            2005</option>
                    <option value="2004"
            >
            2004</option>
                    <option value="2003"
            >
            2003</option>
                    <option value="2002"
            >
            2002</option>
                    <option value="2001"
            >
            2001</option>
                    <option value="2000"
            >
            2000</option>
                    <option value="1999"
            >
            1999</option>
                    <option value="1998"
            >
            1998</option>
                    <option value="1997"
            >
            1997</option>
                    <option value="1996"
            >
            1996</option>
                    <option value="1995"
            >
            1995</option>
                    <option value="1994"
            >
            1994</option>
                    <option value="1993"
            >
            1993</option>
                    <option value="1992"
            >
            1992</option>
                    <option value="1991"
            >
            1991</option>
                    <option value="1990"
            >
            1990</option>
                    <option value="1989"
            >
            1989</option>
                    <option value="1988"
            >
            1988</option>
                    <option value="1987"
            >
            1987</option>
                    <option value="1986"
            >
            1986</option>
                    <option value="1985"
            >
            1985</option>
                    <option value="1984"
            >
            1984</option>
                    <option value="1983"
            >
            1983</option>
                    <option value="1982"
            >
            1982</option>
                    <option value="1981"
            >
            1981</option>
                    <option value="1980"
            >
            1980</option>
                    <option value="1979"
            >
            1979</option>
                    <option value="1978"
            >
            1978</option>
                    <option value="1977"
            >
            1977</option>
                    <option value="1976"
            >
            1976</option>
                    <option value="1975"
            >
            1975</option>
                    <option value="1974"
            >
            1974</option>
                    <option value="1973"
            >
            1973</option>
                    <option value="1972"
            >
            1972</option>
                    <option value="1971"
            >
            1971</option>
                    <option value="1970"
            >
            1970</option>
                    <option value="1969"
            >
            1969</option>
                    <option value="1968"
            >
            1968</option>
                    <option value="1967"
            >
            1967</option>
                    <option value="1966"
            >
            1966</option>
                    <option value="1965"
            >
            1965</option>
                    <option value="1964"
            >
            1964</option>
                    <option value="1963"
            >
            1963</option>
                    <option value="1962"
            >
            1962</option>
                    <option value="1961"
            >
            1961</option>
                    <option value="1960"
            >
            1960</option>
                    <option value="1959"
            >
            1959</option>
                    <option value="1958"
            >
            1958</option>
                    <option value="1957"
            >
            1957</option>
                    <option value="1956"
            >
            1956</option>
                    <option value="1955"
            >
            1955</option>
                    <option value="1954"
            >
            1954</option>
                    <option value="1953"
            >
            1953</option>
                    <option value="1952"
            >
            1952</option>
                    <option value="1951"
            >
            1951</option>
                    <option value="1950"
            >
            1950</option>
                    <option value="1949"
            >
            1949</option>
                    <option value="1948"
            >
            1948</option>
                    <option value="1947"
            >
            1947</option>
                    <option value="1946"
            >
            1946</option>
                    <option value="1945"
            >
            1945</option>
                    <option value="1944"
            >
            1944</option>
                    <option value="1943"
            >
            1943</option>
                    <option value="1942"
            >
            1942</option>
                    <option value="1941"
            >
            1941</option>
                    <option value="1940"
            >
            1940</option>
                    <option value="1939"
            >
            1939</option>
                    <option value="1938"
            >
            1938</option>
                    <option value="1937"
            >
            1937</option>
                    <option value="1936"
            >
            1936</option>
                    <option value="1935"
            >
            1935</option>
                    <option value="1934"
            >
            1934</option>
                    <option value="1933"
            >
            1933</option>
                    <option value="1932"
            >
            1932</option>
                    <option value="1931"
            >
            1931</option>
                    <option value="1930"
            >
            1930</option>
            </select>
                                    <select id="army.svcPrdEndYm.month" name="army.svcPrdEndYm.month" title='복무기간 종료월 선택' hname='복무기간 종료월' onchange='checkArmyPrd(0);'>
                    <option value="" >월</option>
                            <option value="01"
            >
            01</option>
                    <option value="02"
            >
            02</option>
                    <option value="03"
            >
            03</option>
                    <option value="04"
            >
            04</option>
                    <option value="05"
            >
            05</option>
                    <option value="06"
            >
            06</option>
                    <option value="07"
            >
            07</option>
                    <option value="08"
            >
            08</option>
                    <option value="09"
            >
            09</option>
                    <option value="10"
            >
            10</option>
                    <option value="11"
            >
            11</option>
                    <option value="12"
            >
            12</option>
            </select>
                </fieldset>
            </td>
        </tr>
        <tr>
            <th scope="row" id="apply5-3">계급</th>
            <td headers="apply5-3">
                                <select id="army.grdCd" name="army.grdCd" title='계급 선택' hname='계급'>
                    <option value="" >해당없음</option>
                            <option value="AFAAAA"
            >
            이병</option>
                    <option value="AFAAAB"
            >
            일병</option>
                    <option value="AFAAAC"
            >
            상병</option>
                    <option value="AFAAAD"
            >
            병장</option>
                    <option value="AFAAAE"
            >
            하사</option>
                    <option value="AFAAAF"
            >
            중사</option>
                    <option value="AFAAAG"
            >
            상사</option>
                    <option value="AFAAAH"
            >
            원사</option>
                    <option value="AFAAAI"
            >
            준위</option>
                    <option value="AFAAAJ"
            >
            소위</option>
                    <option value="AFAAAK"
            >
            중위</option>
                    <option value="AFAAAL"
            >
            대위</option>
                    <option value="AFAAAM"
            >
            소령</option>
                    <option value="AFAAAN"
            >
            중령</option>
                    <option value="AFAAAO"
            >
            대령이상</option>
            </select>
            </td>
            <th scope="row" id="apply5-4">병과</th>
            <td headers="apply5-4">
                                <input type="text" id="army.brnch" name="army.brnch" value="" title='병과 입력(4자이내)' hname='병과' maxlength='5'>             </td>
        </tr>
    </table>
        <p class="bottom">
                지원서 작성 후 임시저장 버튼을 꼭 눌러주세요. 지원서 제출 후에도 수정 가능하오니 미리 제출하고 수정하는 것을 권장합니다.
            </p>
    <div class="btn-area line">
        <a href="javascript:fnTempSave();" class="btn temporary">
                        임시저장
                    </a>
        <a href="javascript:fnPreview();" class="btn preview" title="팝업띄움">미리보기</a>
        <span class="next">
            <em>다음단계</em>
            <a href="javascript:fnMove('scholarship_info.do','N');">학력정보</a>
        </span>
    </div>
    
    <div class="tip-area">
        <a href="#lay-tip" id="lay-tip-btn" class="tip">TIP</a>
        <div id="lay-tip" class="lay-tip">
            <div class="floating">
                
                <dl id="tip-content-area"><!-- 지원 희망 분야 -->
                    <dt>지원 희망 분야 입력 안내</dt>
                    <dd><p>본인의 근무 희망 지역을 리스트에서 선택합니다. 리스트에 나오는 근무지역과 지원하시는 회사 및 직무의 사업장 소재지가 일치하지 않을 수 있으니, 사업장의 위치정보를 확인하시기 바랍니다.
(본인이 선택한 희망근무지는 참고 사항이며, 실제 배치 근무지는 다를 수 있습니다.)</p></dd>
                </dl>
                
                <dl id="tip-content-identity"><!-- 인적사항 -->
                    <dt>인적사항 입력 안내</dt>
                    <dd><p>입사지원서에 첨부되는 사진 파일은 JPG, GIF, PNG 파일의 형식이어야 합니다.
사진크기는 100 X 120픽셀(5*6)을 준수해 주십시오.
한자이름은 한자키를 누르고 맞는 한자를 찾아서 입력합니다.
이름 중 표준한자 4800자 이외의 한자를 사용할 경우에는 해당 글자만 한글로 입력하십시오. 표준한자 이외의 한자는 &#39;?&#39; 또는 &#39;ㅁ&#39;과 같이 표시됩니다. 한글이름인 경우에는 한글로 입력하시면 됩니다.</p></dd>
                </dl>
                                <dl id="tip-content-profile">
                    <dt>개인신상 입력 안내</dt>
                    <dd><p>보훈, 장애, 기초생활수급자에 해당하시면 &#39;대상&#39;을, 해당하지 않으시면 &#39;비대상&#39;을 선택합니다.
장애 대상인 경우, 장애종류 및 등급, 장애인정일을 입력해 주시기 바랍니다.</p></dd>
                </dl>
                                                <dl id="tip-content-military"><!-- 병역사항 -->
                    <dt>병역사항 입력 안내</dt>
                    <dd><p>군필인 경우, 군별/복무기간/계급/병과를 입력해 주시기 바랍니다.
면제인 경우, 면제사유를 20자 이내로 입력해 주시기 바랍니다.</p></dd>
                </dl>
                                <ul>
                    <li>
                        궁금하신 사항이 있으신가요?<br>
                        1:1 문의를 해주시면 최대한 빨리 답변해드립니다.<br>
                        <a href="javascript:fnQnaWritePopup();" class="btn small qna">1:1 문의하기</a>
                    </li>
                </ul>
                <a href="#lay-tip-btn" class="close">팁 레이어 닫기</a>
            </div>
        </div>
    </div>
</section>
<div class="btn-area wide">
    <a href="javascript:fnApply();" class="btn2 apply">지원서 제출하기</a>
</div>
</form>
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
						<li><a href="/web/hanwha/business/business.do">한화의 사업</a></li>
						<li><a href="/web/hanwha/history/history.do">한화가 걸어온 길</a></li>
						<li><a href="/web/hanwha/main_value/main_value.do">한화인의 핵심가치</a></li>
						<li><a href="/web/hanwha/personal_system/personal.do">한화의 제도</a></li>
					</ul>
					<figure>
						<a href="/web/hanwha/history/history.do">
							<img src="/web/images/main/img_menu.png" alt="">
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
						<li><a href="/web/dream/dream_tune/dream_tune.do">DREAM TUNES</a></li>
						<li><a href="/web/dream/membership_program/list.do">멤버십 프로그램</a></li>
					</ul>
					<figure>
						<a href="/web/dream/dream_tune/dream_tune.do">
    						<img src="/web/images/main/img_menu2.png" alt="">
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
						<li><a href="/web/meet/subsidiary/list.do">계열사 소개</a></li>
						<li><a href="/web/meet/detail_job/list.do">직무 소개</a></li>
						<li><a href="/web/meet/employment_tip/list.do">한화 inside</a></li>
					</ul>
					<figure>
						<a href="/web/meet/detail_job/list.do">
    						<img src="/web/images/main/img_menu3.png" alt="">
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
						<li><a href="/web/apply/procedure/procedure.do">채용 절차 </a></li>
						<li><a href="/web/apply/faq/list.do">FAQ</a></li>
						<li><a href="/web/apply/notification/list.do">채용 공고</a></li>
						<li><a href="/web/apply/notification/personDb.do">인재 DB</a></li>
					</ul>
					<figure>
						<a href="/web/apply/notification/list.do">
    						<img src="/Hanwha_0106view/web/images/main/img_menu4.png" alt="">
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
nl.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'www.hanwhain.com/web/js/wlo.js';
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
