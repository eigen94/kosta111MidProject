<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="http://jointjs.com/cms/downloads/joint.css" rel="stylesheet">
<link href="/kosta111MidProject/cssFiles/uml/umlMain.css" rel="stylesheet">
<!-- <link href="/kosta111MidProject/cssFiles/uml/uml.css" rel="stylesheet"> -->

<script src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script src="/kosta111MidProject/javascriptFiles/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/js/vendor/lodash/lodash.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/js/vendor/backbone/backbone-min.js"></script>
<script type="text/javascript" src="http://jointjs.com/cms/downloads/joint.js"></script>

<script type="text/javascript" src="/kosta111MidProject/javascriptFiles/uml/umlMain.js"></script>

</head>
<script>
	SVGElement.prototype.getTransformToElement = SVGElement.prototype.getTransformToElement
			|| function(toElement) {
				return toElement.getScreenCTM().inverse().multiply(
						this.getScreenCTM());
			};
</script>
<body>
	<section class="container">
		<article>
			<h2>Unified Modeling Language</h2>
			<h3>The Class Diagram</h3>
			<label>선택된 대상 : </label><input type="text" id="selectedClass">
			<button id="disselect">선택해제</button>
		</article>

		<div class="umlProcess">
			<div id="paper" class="paper"></div>
		</div>
		<div class="inspector-container">
			<div class="inspector">
				<div class="umlType">
					<label>Class</label><input type="radio" name="classType" value="Class">
					<label>Interface</label><input type="radio" name="classType" value="Interface">
					<label>Abstract</label><input type="radio" name="classType" value="Abstract">
				</div>
				<div class="group closed" data-name="name">
					<h3 class="group-label">Class name</h3>
					<div class="field" data-field="name">
						<label>Class name</label> <input class="text" type="text" data-type="text" data-attribute="name" size="38">
					</div>					
				</div><!-- end name -->
				
				<div class="group closed" data-name="attributes">
					<h3 class="group-label">Attributes</h3>
					<div class="field" data-field="attributes">
						<label>Attributes</label>
						<div class="list" data-type="list" data-attribute="attributes">
							<button class="btn-list-add">+</button>
							<div class="list-items">
								<div class="list-item" data-index="0">
									<button class="btn-list-del">-</button>
									<div class="field" data-field="attributes/0">
										<label>attributes/0</label>
										<input class="text" type="text" data-type="text" data-attribute="attributes/0" size="38">
									</div>
								</div>								
							</div><!-- end list-item -->
						</div><!-- end attributes list -->
					</div>
				</div><!-- end attributes group -->
				
				<div class="group closed" data-name="methods">
					<h3 class="group-label">Methods</h3>
					<div class="field" data-field="methods">
						<label>Methods</label>	
						<div class="list" data-type="list" data-attribute="methods">
							<button class="btn-list-add">+</button>
							<div class="list-items">
								<div class="list-item" data-index="0">
									<button class="btn-list-del">-</button>
									<div class="field" data-field="methods/0">
										<label>methods/0</label>
										<input class="text" type="text" data-type="text" data-attribute="methods/0" size="38">
									</div><!--  -->
								</div><!-- end list-item -->
							</div><!--  -->
						</div><!-- end list -->
					</div><!-- end field -->					
				</div><!-- end method group -->
				<button id="ok">완료</button>				
			</div><!-- end inspector -->
		</div><!-- end inspector-container -->
		
		

	<link href="http://jointjs.com/css/jointjs/v0.9.5/joint.min.css" rel="stylesheet">
	<!-- <script type="text/javascript" src="http://jointjs.com/js/jointjs/v0.9.5/joint.min.js"></script> -->
	<!-- <script src="/kosta111MidProject/javascriptFiles/uml/uml.js"></script> -->
	
	</section>
	<br><br>
	<div class="relation-container">
			<label>시작 :</label>
			<input type="text" id="start">&nbsp;&nbsp;
			<label>끝 :</label>
			<input type="text" id="end">&nbsp;&nbsp;
			<select id="relationType">
				<option value="DirectAssociation">DirectAssociation</option>
				<option value="Aggregation">Aggregation</option>
				<option value="Composition">Composition</option>
				<option value="Generalization">Generalization</option>				
				<option value="Realization">Realization</option>
			</select>&nbsp;&nbsp;&nbsp;
			<button id="connect">연결</button>
			
		</div>
		<button id="submit">전송</button>&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;<button id="load">불러오기</button>
</body>
</html>