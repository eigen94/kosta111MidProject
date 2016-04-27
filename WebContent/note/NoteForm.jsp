<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	if(request.getParameter("re")!=null){
		String str = request.getParameter("re");
		request.setAttribute("str", str);
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>note</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script  src="note.js"></script>
</head>
<body>
	<div class="noteForm">
		<div class="hidden_text">
			<input type="text" name="n_sender" value="1"> <- 보낸놈 
		</div>
		<div class="input_text">
			<form action="" method="post" name="frmNewUser">
				<div class="title">제목: <input type="text" name="n_title"></div>
			</form>
			<div class="receive">
				받는사람: <span id="n_receive"></span>
				<button class="searchOpen"> 이메일 검색 </button>
			</div>
			<div class="content">내용 : <textarea name="n_content"></textarea></div>
		</div>
	</div>
	<div class="box">
		<button>쪽지함</button>
	</div>
	
	
	<%-- <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
       			<h4 class="modal-title" id="myModalLabel">E-Mail 검색</h4>
     	 	</div>
      		<div class="modal-body">
				<form class="form-horizontal" role="form">
					<div class="form-group">
    					<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    					<div class="col-sm-10">
    						<input type="text" value="" name="EMAIL" class="required email form-control" id="emailSearch"/>
    					</div>
    				</div>
					<div id="mce-responses" class="clear">
    					<div class="response" id="mce-error-response" style="display:none"></div>
        				<div class="response" id="mce-success-response" style="display:none"></div>
    				</div>    
    				<div style="position: absolute; left: -5000px;">
    					<input type="text" name="aaaaa">
    				</div>
    				<div class="form-group remove-bottom">
    					<div class="col-sm-offset-2 col-sm-10">
    						<c:forEach var="list" items="${list }">
								<a href="#">${list }</a><br>
								<hr>
							</c:forEach>
    					</div>
  					</div>
				</form>
				<!--End mc_embed_signup-->
	      	</div>
	      	<div class="modal-footer remove-top">
        		<div class="search">
        			<button>검색</button>
      			</div>
	      		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div> --%>



</body>
</html>