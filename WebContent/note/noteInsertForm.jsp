<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>note</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script  src="note.js"></script>
<script type="text/javascript">
function receive(email) {
	$('.receive input').val(email);
}
</script>
</head>
<body>
<%
request.setAttribute("m_id", session.getAttribute("m_id"));
%>
<div class="container">
<form action="noteInsert.do" id="formTag" method="post">
<!-- 	<div class="input-group">
	  <span class="input-group-addon" id="basic-addon1">@</span>
	  <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
	</div> -->
	<div class="form-group noteForm">
		<div class="hidden_text">
		 <input type="hidden" name="n_sender" value="${m_id }"> <!-- <- 보낸놈(임시) -->
		</div>
		<div class="input_text">
			<div class="title">
			<label for="inputName" class="col-xs-2 control-label">제목</label> 
			<div class="col-xs-10">
				<input class="form-control" type="text" name="n_title">
			</div>
			</div>
			<div class="receive">
			<label for="inputName" class="col-xs-2 control-label">받는사람</label>
			<div class="col-xs-8">
			<input class="form-control" type="text" name="n_receive" >
			</div>
			<div class="col-xs-2">
				<button class="searchOpen btn btn-default"> 검색 </button>
    		 <!--    <div class="input-group">
      <input type="text" class="form-control" name="n_receive" placeholder="이메일을 적으세요">
      <span class="input-group-btn">
        <button class="btn btn-default searchOpen" type="button">검색</button>
      </span>
    </div>/input-group -->
			</div>
			</div>
			<div class="col-xs-12">
			<div class="content">
			<label for="inputName" class="col-xs-2 control-label">내용</label>
			<div class="col-xs-10">
			<textarea class="form-control" name="n_content"></textarea></div>
			</div>
			</div>
		</div>
	</div>
	<br>
	<div class="bottom">
		<div class="box">
			<button class="btn btn-default">쪽지함</button>
		</div>
		<div class="send">
			<input class="btn btn-default" type="submit" value="전송">
		</div>
	</div>
</form>	
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