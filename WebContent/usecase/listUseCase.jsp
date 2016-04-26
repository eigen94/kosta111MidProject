<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../javascriptFiles/jquery-2.2.3.min.js" type="text/javascript"></script>
<script src="../javascriptFiles/usecase.js" type="text/javascript"></script>
<link rel="stylesheet" href="../cssFiles/tmp.css" type="text/css" />
</head>
<body>
	<div class="div_table">
    	<div class="table_tr">
        	<div class="tbl_th">개요</div>
        	<div class="tbl_td">${jsonObj.outline }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">관련 액터</div>
        	<div class="tbl_td">${jsonObj.actor }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">선행 조건</div>
        	<div class="tbl_td">${jsonObj.conditionF }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">이벤트 흐름</div>
        	<div class="tbl_td">${jsonObj.event }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">후행조건</div>
        	<div class="tbl_td">${jsonObj.conditionB }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">기타 요구사항</div>
        	<div class="tbl_td">${jsonObj.claim }</div>
    	</div>
    	<div class="table_tr">
        	<div class="tbl_th">개발 담당자</div>
        	<div class="tbl_td">
			</div>
    	</div>
    </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>