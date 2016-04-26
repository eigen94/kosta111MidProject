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
<link rel="stylesheet" href="../cssFiles/tmp.css" type="text/css" />
<script src="../javascriptFiles/usecase.js" type="text/javascript"></script>
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
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" >
			생성	  
		</button>

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			<div class="modal-dialog">
	    		<div class="modal-content">
	    	  		<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
						<span class="sr-only">Close</span></button>
						<h4 class="modal-title" id="myModalLabel">유스 케이스</h4>
	     	 		</div>
	     	 		<div class="modal-body">
						<div class="top_position">
							<div class="advice">
								<a href="#" class="tip"><button>?</button><span>유스케이스를 통해 고객이나 사용자의 요구사항에 대해 정의하는 일련의 행위를 유스케이스 모델링이라고 한다. 유스케이스 모델링을 통해서, 요구사항을 정형화하고 효율적으로 관리할 수 있는 토대를 마련할 수 있고, 이는 프로젝트 전반에 걸쳐 요구사항에 대한 이해도를 높이는 데 크게 공헌한다.</span></a>
								<a href="#" class="tip">야호호 <span>도움말 표시</span></a>
							</div>
								프로잭트 이름 /// /// /// /// 일정 이름
						</div>
						<div class="mid_position">
							<h3>기능명세 - Use_case</h3>
							<div id="selector">
								<select name="select">
    								<option value="">선택하세요</option>
    								<option value="outline">개요</option>
    								<option value="actor">관련엑터</option>
    								<option value="conditionF">선행조건</option>
    								<option value="event">이벤트</option>
    								<option value="eventDetail">이벤트 상세내역</option>
    								<option value="conditionB">후행조건</option>
    								<option value="claim">요구사항</option>
								</select>
								<input type="text" name="내용" value=""><button>ㅡ</button>
								<a href="#" class="tip"><button>?</button><span>도움말</span></a>
							</div>
							<div id="newField"></div>
							<div id="plus_btn">
								<button>+</button>
							</div>
		      			</div>
	      			</div>
	      			<div class="modal-footer">
<!-- ////////////////////////////////////////////////////////////// -->
	      				<div class="package">
							<input type="text" name="check_id">  
						</div>
<!-- ////////////////////////////////////////////////////////////// -->
	      	
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      				<span class="save">
							<button type="button" class="btn btn-primary">Save changes</button>
	      				</span>
	      			</div>
	    		</div>
	  		</div>
		</div>
	</div>
	
<!-- 	<div id="sequence">
<button id="addSequence" type="button">
<div class="ripple_water">
<span class="ink animate" style="height: 225px; width: 225px; top: -80px; left: 21.5px;"></span>
</div>
<span class="glyphicon glyphicon-plus"></span>
페이지 추가
</button>
<ol id="seqList" class="ui-sortable">
<li class="item ui-sortable-handle" title="우클릭하여 메뉴 표시">
<span class="number_placeholder"> </span>
<span class="glyphicon glyphicon-asterisk ico_modified"></span>
<div class="sequence_thumbnail load_sequence" style="background-color: rgb(255, 255, 255); width: 163px; height: 83.3333px;">
<img width="163" height="83.33333333333333" src="">
</div>
<div class="seq_name_wrapper">
<span class="seq_name">
<span class="ellipsis"> Untitled </span>
</span>
<form class="form_rename" style="display: none;">
<input class="seq_name_input" type="text" maxlength="64">
</form>
</div>
</li>
<li class="item selected" title="우클릭하여 메뉴 표시">
<span class="number_placeholder"> </span>
<span class="glyphicon glyphicon-asterisk ico_modified"></span>
<div class="sequence_thumbnail load_sequence" style="background-color: rgb(255, 255, 255); width: 163px; height: 83.3333px;">
<img width="163" height="83.33333333333333" src="">
</div>
<div class="seq_name_wrapper">
<span class="seq_name">
<span class="ellipsis"> Untitled 2 </span>
</span>
<form class="form_rename" style="display: none;">
<input class="seq_name_input" type="text" maxlength="64">
</form>
</div>
</li>
</ol>
</div> -->
	
<!-- <div id="editor" class="ui-droppable">
<div class="canvas_wrapper ui-selectable">
<div class="canvas_resizer ui-resizable ui-resizable-autohide" style="width: 1200px; height: 528px;">
<div id="canvas" class="canvas" title="우클릭하여 메뉴 표시" data-show-memo="true" data-show-grid="false" data-canvas="true" style="width: 1200px; background-color: rgb(255, 255, 255); height: 528px;"></div>
<span class="canvas_line up"></span>
<span class="canvas_line left"></span>
<span class="canvas_line right"></span>
<div class="ui-resizable-handle ui-resizable-s" style="z-index: 90; display: none;" data-height="528px"></div>
</div>


<span class="canvas_line up"></span>
<span class="canvas_line left"></span>
<span class="canvas_line right"></span>
<div class="ui-resizable-handle ui-resizable-s"></div>
</div>
</div>
<div class="saved_time">
</div>
</div>	 -->
	
	
	
<!-- <div id="object">
	<div class="object_tab ui-sortable">
		<a class="on ui-sortable-handle" href="javascript:;" title="드래그하여 순서를 변경할 수 있습니다">
			<span class="glyphicon glyphicon-th-large"></span>
			요소
		</a>
		<a class="ui-sortable-handle" href="javascript:;" title="드래그하여 순서를 변경할 수 있습니다">
			<span class="glyphicon glyphicon-star"></span>
			아이콘
		</a>
		<a class="ui-sortable-handle" href="javascript:;" title="드래그하여 순서를 변경할 수 있습니다">
			<span class="glyphicon glyphicon-picture"></span>
			이미지
		</a>
		<a class="ui-sortable-handle" href="javascript:;" title="드래그하여 순서를 변경할 수 있습니다">
			<span class="glyphicon glyphicon glyphicon-inbox"></span>
			보관함
		</a>
	</div>
		
	<div class="object_body">
		<img class="loading_components" alt="loading sequence" src="https://t1.daumcdn.net/oven/web/542CF1934B0A320021">
		<div class="object_list" style="display: block;" data-object-type="element">
			<div class="head">
				<div class="search">
					<a class="toggle toggle_expand" title="오브젝트메뉴 확대/축소" href="javascript:;"></a>
				</div>
				<div class="list ui-selectable">
				</div>
			</div>
		</div>
	</div>
</div>
	 -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
