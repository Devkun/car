function checkLoginState() {
	
}

window.fbAsyncInit = function() {
	FB.init({
		appId : '1532549953678076',
		cookie : true, // enable cookies to allow the server to access
		// the session
		xfbml : true, // parse social plugins on this page
		version : 'v2.1' // use version 2.1
	});
};

// SDK를 비동기적으로 호출
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id))
		return;
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function goFBLogin() {
	FB.getLoginStatus(function(response) {
		console.log(response.status);
		if (response.status === 'connected') {
			// 페이스북을 통해서 로그인이 되어있다.
			goFacebookLogin();
		} else {
			// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다.
			FB.login(function(response) {
				console.log(response);
				if (response.status === 'connected') {
					// 페이스북과 앱에 같이 로그인되어 있다.
					goFacebookLogin();
				}
			}, {scope: 'public_profile,email'});
		}
	});
}

function goFacebookLogin() {
	FB.api('/me', function(response) {
		$("#facebookForm > input[name='id']").val(response.id);
		$("#facebookForm > input[name='email']").val(response.email);
		$("#facebookForm > input[name='firstName']").val(response.first_name);
		$("#facebookForm > input[name='lastName']").val(response.last_name);
		
		$("#facebookForm").submit();
	});
}

function joinFacebookMember(contextPath) {
	if (confirm("인증 회원만 이용 가능한 서비스입니다.\n본인인증 절차를 진행하시겠습니까?")) {
		location.href = contextPath + "/member/join/step2.do";
	}
}