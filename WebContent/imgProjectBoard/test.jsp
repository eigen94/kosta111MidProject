
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="originalTest.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="WebContent/bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="originalTest.js"></script>

</head>
<body>

	<div class="container">
		<div class="well well-sm">
			
			<strong>Category Title</strong>
			<div class="btn-group">
				<a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"> </span> List</a> 
				<a href="#" id="grid" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>Grid</a>
			</div>
			
			<nav class="navbar Pull-right">
				<div class="btn-group">
					<!-- 생성버튼 시작 -->
					<form action="insertFile.img" method="post"
						enctype="multipart/form-data">
						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-sm"
							data-toggle="modal" data-target="#myModal">이미지 생성하기</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">이미지 생성</h4>
									</div>
									<div>
										<!-- image-preview-filename input [CUT FROM HERE]-->
										<div class="input-group image-preview">
											<input type="text"
												class="form-control image-preview-filename"
												disabled="disabled">
											<!-- don't give a name === doesn't send on POST/GET -->
											<span class="input-group-btn"> <!-- image-preview-clear button -->
												<button type="button"
													class="btn btn-default image-preview-clear"
													style="display: none;">
													<span class="glyphicon glyphicon-remove"></span> Clear
												</button> <!-- image-preview-input -->
												<div class="btn btn-default image-preview-input">
													<span class="glyphicon glyphicon-folder-open"></span> <span
														class="image-preview-input-title">Browse</span> <input
														type="file" accept="image/png, image/jpeg, image/gif"
														name="check_urlId" />
													<!-- rename it -->
												</div>
											</span>
										</div>
										<!-- /input-group image-preview [TO HERE]-->
									</div>
									<div class="modal-body">
										<p>
											<textarea rows="10" cols="70" name="check_textArea"
												class="check_textArea"></textarea>
										</p>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-default" id="submit">생성</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									</div>
								</div>

							</div>
						</div>
					</form>
					<!-- 생성버튼 끝 -->
			</nav>
		</div>
	</div>
	<div class="container">
		<div id="products" class="row list-group">
			<c:forEach var="a" varStatus="v" items="${list}">
				<c:if test="${fn:split(a,',')[0] != null }">
					<c:set var="head"
						value="${fn:substring(fn:split(a,',')[0],0,fn:length(fn:split(a,',')[0])-4) }"></c:set>
					<c:set var="pattern"
						value="${fn:substringAfter(fn:split(a,',')[0], head) }"></c:set>
					<div class="item  col-xs-4 col-lg-4">
						<a href="#" class="thumbnail" data-toggle="modal"
							data-target="#lightbox${v.count }"> <img
							src="../imgUpload/${head }_small${pattern}" alt="..."></a>
						<div id="lightbox${v.count }" class="modal fade" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<button type="button" class="close hidden" data-dismiss="modal"
									aria-hidden="true">×</button>
								<div class="modal-content">
									<div class="modal-body">
										<img src="../imgUpload/${head }_small${pattern}" alt="" />
										<hr>
										<textarea cols="70" class="check_content">${fn:split(a,',')[1]}</textarea>
										<input type="hidden" class="src" value="${head }${pattern}">
										<input type="hidden" class="check_id" value="${idList[v.count-1] }">
									</div>
									<hr>
									<button type="button" class="modify">수정</button>
									<button type="button" class="delete">삭제</button>
									<hr>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

</body>
</html>

