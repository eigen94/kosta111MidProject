<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link href="http://jointjs.com/cms/downloads/joint.css" rel="stylesheet">

<script src="/kosta111MidProject/javascriptFiles/jquery-2.2.3.min.js"></script>
<script src="/kosta111MidProject/javascriptFiles/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/js/vendor/lodash/lodash.min.js"></script>
<script type="text/javascript" src="http://jointjs.com/js/vendor/backbone/backbone-min.js"></script>
<script type="text/javascript" src="http://jointjs.com/cms/downloads/joint.js"></script>

<script type="text/javascript" src="/kosta111MidProject/javascriptFilse/diagram.js"></script>
<style type="text/css">
.inspector-container
{
	margin-left: 1600px;
	
}

.usecaseDiagramProcess
{
	float : left;
	border: 1px solid black;
	
}

.create, .group, .list-item
{
	border : 1px solid black;
}


.group
{
	padding: 10px;
}

.relation-container
{
	
	border : 1px solid black;
	padding:10px;
}

.field > label
{
	display : none;
}

.relation-container
{
	clear : both;
	
}

</style>


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
			<h3>The use case Diagram</h3>
		</article>
		
		<div class="usecaseDiagramProcess">
			<div id="paper" class="paper"></div>
		</div><!-- end usecaseDiagramProcess -->
		
		<div class ="inspector-container">
		
			<div class="group closed" data-name="actors">
				<h3 class="group-label">actors</h3>
				<div class="field" data-field ="actors">
				<label>actor</label>
				<div class="list" data-type="list" data-attribute="actors">
					<button class="btn-list-add">+</button>
					<div class="list-items">
						<div class="list-item" data-index="0">
						<button class="btn-list-del">-</button>
						<div class="field" data-field="actors/0">
							<label>actors/0</label>
							<input class="text" type="text" data-type="text" data-attribute="actors/0" size="38">
						</div>
						</div>
					</div><!-- end list-items -->
				</div><!-- end list -->
				</div>
			</div><!-- goup closed - actor -->
			
			    <div class="group closed" data-name="events">
					<h3 class="group-label">events</h3>
					<div class="field" data-field ="events">
						<label>events</label>
						<div class="list" data-type="list" data-attribute="events">
							<button class="btn-list-add">+</button>
							<div class="list-items">
								<div class="list-item" data-index="0">
									<button class="btn-list-del">-</button>
									<div class="field" data-field="events/0">
										<label>events/0</label>
										<input class="text" type="text" data-type="text" data-attribute="events/0" size="38">
								</div>
							</div>
						</div><!-- end list-items -->
					</div><!-- end list -->
				</div>
			</div><!-- goup closed - event -->
			<button id="ok">완료</button>
		</div><!-- end inspector-container  -->
		
	<link href="http://jointjs.com/css/jointjs/v0.9.5/joint.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://jointjs.com/js/jointjs/v0.9.5/joint.min.js"></script>
 	<script src="/kosta111MidProject/javascriptFilse/usecaseDiagram.js"></script>
	</section>
	
	<br><br>
	<div class="relation-container">
		<label>시작: </label>
		<input type="text" id="start">&nbsp;&nbsp;
		<label>끝: </label>
		<input type="text" id="end">&nbsp;&nbsp;
		<select id="relationType">
			<option value="Association">Association</option>
			<option value="Include">Include</option>
			<option value="Extend">Extend</option>
		</select>&nbsp;&nbsp;&nbsp;
		<button id="connect">연결</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button id="submit">전송</button>
	</div> <!--end relation-container -->


</body>
</html>