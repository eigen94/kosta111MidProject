<%@page import="kosta.model.ProjectBoard"%>
<%@page import="java.util.List"%>
<%@page import="kosta.service.Service"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Service pService = Service.getInstance();
List<ProjectBoard> list = pService.projectListService();
request.setAttribute("list", list);
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
    <link href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<style type="text/css">
	
#scrollable-dropdown-menu .tt-dropdown-menu {
  max-height: 150px;
  overflow-y: auto;
}
	</style>

    <!-- Custom styles for this template -->
    <link href="cssFiles/main.css" rel="stylesheet">

  </head>
  <body>
  
  <!-- navBar -->
	<jsp:include page="pageModule/navBar.jsp"></jsp:include>
   <!-- Carousel
   ================================================== -->
    <div id="bodyContent">
    <div class="container-fluid">

    <!-- main bar -->
    <div class="row">
    
      <div class="col-sm-8 col-md-10 main">
        <h1 class="page-header">프로젝트 관리</h1>
      </div>
      
      <div class="col-sm-3 col-md-2 main">
	<div class="btn-group" data-toggle="buttons">
		<label class="btn btn-default change_viewtype ">
		<input id="view_type_media" type="radio" value="media" name="view_type">
		<span class="glyphicon glyphicon-list"></span>
		</label>
		<label class="btn btn-default change_viewtype active">
		<input id="view_type_card" type="radio" value="card" name="view_type">
		<span class="glyphicon glyphicon-th-large"></span>
		</label>
	</div>
      </div>
      
    </div><!-- end row -->
    
	<button class="btn btn-default" data-toggle="modal" data-target="#projectCreateModal">프로젝트생성</button>
	<br>
    
    <!-- projectList -->
	
      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-10">
          
          <div class="row">
          <c:choose>
          <c:when test="${list!=null }">
	          <c:forEach var="project" items="${list }">
	            <div class="col-xs-6 col-lg-4">
	              <h2>${project.p_name }</h2>
	              <p>${project.p_memo } </p>
	              <p><a class="btn btn-default" href="projectDetail.do?p_id=${project.p_id }" role="button">프로젝트 시작하기 &raquo;</a></p>
	              <p><a class="btn btn-default" href="delete.do?p_id=${project.p_id }" role="button">프로젝트 삭제하기 &raquo;</a></p>
	            </div><!--/.col-xs-6.col-lg-4-->
	          </c:forEach>
          </c:when>
          <c:when test="${list==null }">
          <h2>프로젝트가 없습니다!</h2>
          <p>프로젝트를 생성하세요.</p>
          </c:when>
          </c:choose>
          
          
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->

      </div><!--/row-->
    
    <!-- end of projectList -->
      
      
    </div><!-- end container -->
    </div><!-- end of body content -->
    
    
    <!-- end of bodycontent -->


	<!-- Modal -->

	<!-- registerFormMoadl -->
	<div id="projectCreateModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      
	        <form action="insert.do" method="post" class="form-horizontal">
		        <div class="form-group">
	       			<label for="inputName" class="col-sm-3 control-label">프로젝트 이름</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="inputName" type="text" name="p_name" size="20" placeholder="프로젝트 이름을 입력하세요"><br>
					</div>
					
	       			<label for="inputStartDate" class="col-sm-3 control-label">시작일</label>
	   				<div class="col-sm-7">
		                <div class='input-group date' id='datetimepicker1'>
		                    <input type='text' id="projectStartDate" class="form-control" name="p_start"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
					
	       			<label for="inputEndDate" class="col-sm-3 control-label">종료일</label>
	   				<div class="col-sm-7">
		                <div class='input-group date' id='datetimepicker2'>
		                    <input type='text' id="projectEndDate" class="form-control" name="p_end"/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		                </div>
					</div>
	       			<label for="inputPwdCheck" class="col-sm-3 control-label">메모</label>
	   				<div class="col-sm-7">
						<input class="form-control" id="projectMemo" type="text" name="p_memo" size="20" placeholder="메모를 입력하세요"><br>
					</div>
	       			<label for="projectMemeber" class="col-sm-3 control-label">맴버추가</label>
	   				<div class="col-sm-7">
		                <div id="inputIndicator" class='input-group'>
							<input class="form-control" id="projectMemeber" type="text" name="p_member" size="20" placeholder="추가할 맴버 이름이나 이메일을 입력하세요"><br>
		                    <span id="memberAddBtn" class="input-group-addon">
		                        <span class="glyphicon glyphicon-plus-sign"></span>
		                    </span>
	                    </div>
					</div>
					<div id="memberAddPoint">
					</div>
					<!-- 맴버 전송을 위한 히든폼 -->
					<input type="hidden" id="projectCrew" name="p_crew">
					<input type="hidden" id="projectCrew" name="p_pmid" value="${m_id }">
		        </div>
			  	<div class="form-group">
			    	<div class="col-sm-offset-3 col-sm-9">
			      		<button type="submit" class="btn btn-default">프로젝트 생성</button>
			    	</div>
			  	</div>
			</form>
	      
	      </div>
	    </div>
	
	  </div>
	</div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/kosta111MidProject/javascriptFiles/jquery/1.11.2/jquery.min.js"></script>
    <script src="/kosta111MidProject/bootstrap/js/bootstrap.min.js"></script>
    <!-- for dateTimePicker -->
    <script src="/kosta111MidProject/javascriptFiles/moment/moment-with-locales.js"></script>
	<script src="/kosta111MidProject/javascriptFiles/dateTimePicker/bootstrap-datetimepicker.js"></script>
    <script src="/kosta111MidProject/javascriptFiles/forPageScript/main.js"></script>
</body>
</html>