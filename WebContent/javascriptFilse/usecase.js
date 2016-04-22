$(function() {
	/*
	 * Map = function() { this.map = new Object(); }; Map.prototype = { put :
	 * function(key, value) { this.map[key] = value; }, get : function(key) {
	 * return this.map[key]; }, containsKey : function(key) { return key in
	 * this.map; }, containsValue : function(value) { for ( var prop in
	 * this.map) { if (this.map[prop] == value) return true; } return false; },
	 * isEmpty : function(key) { return (this.size() == 0); }, clear :
	 * function() { for ( var prop in this.map) { delete this.map[prop]; } },
	 * remove : function(key) { delete this.map[key]; }, keys : function() { var
	 * keys = new Array(); for ( var prop in this.map) { keys.push(prop); }
	 * return keys; }, values : function() { var values = new Array(); for ( var
	 * prop in this.map) { values.push(this.map[prop]); } return values; }, size :
	 * function() { var count = 0; for ( var prop in this.map) { count++; }
	 * return count; } };
	 */

	// 콜릭하면 내용을 지운다.
	$('input').on('click', function() {
		$(this).val('');
	});

	// select창 1줄 추가
	function addRow() {
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('item').innerHTML;
		document.getElementById('field').appendChild(div);
	}

	// 삭제
	function deleteRow(obj) {
		document.getElementById('field').removeChild(obj.parentNode);
	}

	// 전송
	function post_to_url(path, params, method) {
		alert(params);
		method = method || "post";
		var form = document.createElement("form");
		form.setAttribute("method", method);
		form.setAttribute("action", path);
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", 'check_content');
		hiddenField.setAttribute("value", params);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		form.submit();
	}

	//////////////////////////////////////////////////
	$(function(){
		
		
	});
	///////////////////////////////////////////////////
	
	
	// 저장
	function save() {
var jsonArray = new Array();
		alert("fff");

		var jsonObj = new Object();
		if($('#item select').val() == 'outline'){
			jsonObj.outline = $('#item select').parent().find('input').val();
		}
			
			
			////////
			
			//////
			
			
			
		jsonArray.push(jsonObj);
		
		var finalJsonObj = JSON.stringify(jsonObj);
		
		alert(finalJsonObj);
		
		$.ajax({
			type:"post",
			url:"usecase.do",
			data:{
				json:finalJsonObj
			},
			dataType: "text",
			success: function(data){
				alert("성공");
			},error: function(data){
				alert("실패");
			}
		})
		
	}

	// +버튼->addRow()
	$(document).on('click', '#plus_btn button', function() {
		addRow();
	});
	// -버튼 -> deleteRow()
	$(document).on('click', '#field button', function() {
		deleteRow(this);
	});

	// 저장->save()
	$('.save button').on('click', function() {
		save();
	});

});
// ///////////////////////////////////////////////////////////
function getResults(str) {
	$.ajax({
		url : 'suggest.html',
		type : 'POST',
		data : 'q=' + str,
		dataType : 'json',
		success : function(json) {
			$('#myselect').append(json);

		}
	});
};

$('.suggest').keyup(function() {
	getResults($(this).val());
});




















