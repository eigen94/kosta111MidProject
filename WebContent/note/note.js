//noteForm
$(function() {
	$('.searchOpen').on('click', function() {
		/*$('#myModal').modal('show');*/
		var popUrl = "search.jsp";    //팝업창에 출력될 페이지 URL
	    var popOption = "width=370, height=360, resizable=no, scrollbars=no, " +
	    		"status=no; scrollbars = no; resizable = no";    //팝업창 옵션(optoin)
	    window.open(popUrl,"",popOption);
	})
	
	function inputPassword(password) {
		alert("떠라!")
		alert(password);
	}
	
});




//search
$(function() {
	
	//검색 ㄱㄱ
	$('.search button').on('click', function () {
		/*var search = $('#emailSearch').val();*/
		var search = $('.search input').val();
		location.href="searchId.do?search="+ search;
	})
	
	//검색된 아이디 클릭
	$('.list a').on('click', function() {
		/*window.opener.document.getElementById("title").innerHTML = $(this).html();*/
		window.opener.document.getElementById("n_receive").innerHTML = $(this).html();
		self.close();
	})
	
});













