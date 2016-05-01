<%@page import="kosta.model.ProjectDetail"%>
<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Service service = Service.getInstance();
	String reqCheck_id = request.getParameter("check_id");
    String tmp = request.getParameter("check_projectid");
	int check_id=0;
	int check_projectid = 0;
	if(reqCheck_id!=null){
		check_id = Integer.parseInt(reqCheck_id);
		check_projectid = Integer.parseInt(tmp);
	}
	ProjectDetail check = service.selectDetail(check_id);
	int check_type = check.getCheck_type();
	request.setAttribute("check_id", check_id);
	request.setAttribute("check_type", check_type);
	request.setAttribute("check_projectid", check_projectid);
	%>  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>코스타 중간프로젝트</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.css' rel='stylesheet' />
	<link href='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="cssFiles/main.css" rel="stylesheet">
	<link rel="stylesheet" href="/kosta111MidProject/cssFiles/tmp.css" type="text/css" />


  </head>
<!-- NAVBAR
================================================== -->
	<body>
	<jsp:include page="pageModule/navBar.jsp"></jsp:include>
	<input id="check_id" type="hidden" value="${check_id }">
	<input id="check_projectid" type="hidden" value="${check_projectid }">

    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">
      <div class="row">
      <c:choose>
      <c:when test="${check_type==1 }"><!-- usecase  -->
      <%-- 
      <jsp:include page="usecase/insertUseCase.jsp"></jsp:include>
       --%>
      	<div class="container">
		<!-- 버튼 -->
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insert" >생성</button>
		<!-- 모달 팝업 -->
		<div class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >		
			<div class="modal-dialog">
	    		<div class="modal-content">
	    	  		<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
						<span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">유스 케이스</h4>
	    	 		</div>
	     	 		<div class="modal-body">
						<div class="title_position">
							프로잭트 이름 /// /// /// /// 일정 이름
							<div class="advice">
								<a href="#" class="tip"><button>?</button><span>유스케이스를 통해 고객이나 사용자의 요구사항에 대해 정의하는 일련의 행위를 유스케이스 모델링이라고 한다. 유스케이스 모델링을 통해서, 요구사항을 정형화하고 효율적으로 관리할 수 있는 토대를 마련할 수 있고, 이는 프로젝트 전반에 걸쳐 요구사항에 대한 이해도를 높이는 데 크게 공헌한다.</span></a>
							</div>
						</div>
						<div class="top_position">
							<h3>기능명세 - Use_case</h3>
							<div class="div_table">
  							  	<div class="table_tr">
        							<div class="tbl_th">개요</div>
        							<div class="tbl_td"><textarea></textarea></div>
    							</div>
    							<div class="table_tr">
        							<div class="tbl_th">관련 액터</div>
        							<div class="tbl_td"><textarea></textarea></div>
    							</div>
    						</div>
    					</div>			

   						<div class="mid_position">
    						<div class="div_table">
    							<div id="selector">
    								<button id="minus_btn">ㅡ</button>
    								<div class="table_tr">
    								<a href="#" class="tip"><button>?</button><span>도움말</span></a>
    									<div class="tbl_th">
        									<select name="select">
    											<option value="">선택하세요</option>
    											<!-- <option value="outline">개요</option>
    											<option value="actor">관련엑터</option> -->
    											<option value="conditionF">선행조건</option>
    											<option value="event">이벤트 흐름</option>
    											<!-- <option value="eventDetail">이벤트 상세내역</option> -->
    											<option value="conditionB">후행조건</option>
    											<option value="claim">요구사항</option>
											</select>
											<div id="plus_btn"><button>+</button></div>
        								</div>
        								<div class="tbl_td"><textarea></textarea></div>
    								</div>
								</div>
								<div id="newField"></div>
    						</div>
    					</div>	
    					<div class="bot_position">
    						<div class="div_table">
    							<div class="table_tr">
        							<div class="tbl_th">개발 담당자</div>
        							<div class="tbl_td"><textarea></textarea></div>
    							</div>
    						</div>
    					</div>
	    			</div>
	      			
	      			
	      			<div class="modal-footer">
<!-- ////////////////////////////////////////////////////////////// -->
	      				<!-- <div class="package">
							<input type="text" name="check_id">  
						</div> -->
<!-- ////////////////////////////////////////////////////////////// -->
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      				<span class="save">
							<button type="button" class="btn btn-primary">Save changes</button>
	      				</span>
	      				
	      				<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="modal" href="#caseview">미리보기</a>
							</li>		
						</ul>
	      			</div>
	 	 		</div>
			</div>
		</div>
		
		<!-- 미리보기단 -->
		<div class="modal fade" id="caseview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >		<div class="modal-dialog">
	    	<div class="modal-content">
	    	  	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
					<span class="sr-only">Close</span></button>
					<h2 class="modal-title" id="myModalLabel">미리보기</h2>
	    	 	</div>
	     	 	<div class="modal-body">
   					<div class="mid_position">
   						<div class="div_table">
    						<div class="table_tr">
    					    	<div class="tbl_th">개요</div>
    		    				<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    					    	<div class="tbl_th">관련 액터</div>
    					    	<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    					    	<div class="tbl_th">선행 조건</div>
    					    	<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    					    	<div class="tbl_th">이벤트 흐름</div>
    				    		<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    					    	<div class="tbl_th">후행조건</div>
    		    				<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    	    					<div class="tbl_th">기타 요구사항</div>
    			    			<div class="tbl_td"><b></b></div>
    						</div>
    						<div class="table_tr">
    		    				<div class="tbl_th">개발 담당자</div>
    			    			<div class="tbl_td"><b></b></div>
    					</div>
    				</div>
    			</div>	
	    	</div>
   			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>					
</div>
</div>	
      </c:when>
      <c:when test="${check_type==2 }"><!-- usecase Diagram -->
      <jsp:include page="usecaseDiagram/usecaseDiagram.jsp"></jsp:include>
      </c:when>
      <c:when test="${check_type==3 }"><!-- uml -->
      <%-- <jsp:include page="umlProcess/umlMain.jsp"></jsp:include> --%>
      <jsp:forward page="umlProcess/umlMain.jsp?check_id=${check_id }"></jsp:forward>
      </c:when>
      <c:when test="${check_type==4 }"><!-- erd -->
<%--       <jsp:include page="projectBoard/data.jsp?check_id=${check_id }"></jsp:include><!-- 수정필요 --> --%> 
      <%-- <jsp:forward page="projectBoard/checkDetail.do?check_id=${check_id }"></jsp:forward> --%>
      <%
      response.sendRedirect("projectBoard/checkDetail.do?check_id="+check_id);
      %>
      </c:when>
      <c:when test="${check_type==5 }"><!-- 이미지게시판 -->
      <jsp:include page="imgProjectBoard/test.jsp"></jsp:include>
      </c:when>
      </c:choose>
      </div><!-- end row -->
      
    <br>
    
    </div><!-- end container -->
    
    
    
    <!-- end of bodycontent -->

    </div><!-- /.container -->
	
 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <!-- for fullcalendar -->
    <script src='http://fullcalendar.io/js/fullcalendar-2.6.1/lib/moment.min.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- for fullcalendar -->
	<script src='http://fullcalendar.io/js/fullcalendar-2.6.1/fullcalendar.min.js'></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- for dateTimePicker -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
	<script src="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/src/js/bootstrap-datetimepicker.js"></script>
	<script src="/kosta111MidProject/javascriptFiles/usecase.js" type="text/javascript"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  </body>
</html>
