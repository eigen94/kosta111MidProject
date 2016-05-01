<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유스케이스</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/kosta111MidProject/cssFiles/tmp.css" type="text/css" />
<script src="/kosta111MidProject/javascriptFiles/usecase.js" type="text/javascript"></script>
</head>
<body>
<!-- 	<div class="">
		<h4>유스케이스를 통해 고객이나 사용자의 요구사항에 대해 정의하는 일련의 행위를 유스케이스 모델링이라고 한다.
		유스케이스 모델링을 통해서, 요구사항을 정형화하고 효율적으로 관리할 수 있는 토대를 마련할 수 있고, 이는 프로젝트 전반에 걸쳐 요구사항에 대한 이해도를 높이는 데 크게 공헌한다.</h4>
		
		유스케이스 모델은 요구사항을 기록하는 UML의 가장 대표적인 모델이다.
액터와 시스템 사이의 관계를 시각적으로 표현하는 유스케이스 다이어그램과 유스케이스 각각의 내용을 상세히 기술하는 유스케이스 정의서로 이루어진다. 
유스케이스는 무엇을 개발해야 하며, 어디서부터 개발을 시작해야 하는지알리는 역할을 한다.
사용자와 개발자, 설계자와 개발자 사이에 올바른 대화를 진행할 수 있도록, 프로젝트 구성원 모두가 잘 이해할 수 있는 시각적인 모델을 제공한다. 
		
	 -->

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
	
	
	
	
	
</body>
</html>
