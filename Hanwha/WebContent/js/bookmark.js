function fnNeedLogin(context, msg, orgUrl, targetUrl) {
	if(confirm(msg+"로그인이 필요합니다.\n로그인 하시겠습니까?")){
		/*
		var keys = ['loginRedirect'],
	    values = [orgUrl],
	    
	    params = keys.reduce(function (previous, key, index) {
	        previous[key] = values[index];
	        return previous
	    }, {})
	    */
	    params = {'loginRedirect': orgUrl};
        postLink(context+"/member/login.do", params, "_self");
	}
}