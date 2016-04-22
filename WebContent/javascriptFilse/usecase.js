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

	// 저장
	function save() {
		var $itemSelect = $('.mid_position #item').find('select').val();
		var $itemInput = $('.mid_position #item').find('input').val();
		var $selector = $('.mid_position #field').find('div');
		var $select = $selector.find('select').val();
		var $input = $selector.find('input').val();
		var json = '{ " ' + $itemSelect + '" : "' + $itemInput + '"';

		json += ', "' + $select + '" : "' + $input + '"';

		json += '}';

		/*
		 * $select.each(function(i, e) { var select = $(this).val(); json +=
		 * ',"' + select; }); $input.each(function(i, e) { var input =
		 * $(this).val(); json += '", "' + input +'"'; });
		 */

		var json1 = new Object();
		json1.select1 = $itemSelect;
		json1.input1 = $itemInput;
		json1.select = $select;
		json1.input = $input;

		var json_obj = JSON.stringify(json1);

		alert(json_obj);

		post_to_url('projectDetail.do', json_obj);

		/*
		 * $selector.each(function(i, e) { json += ', "' + $select + '" : "' +
		 * $input +'"'; });
		 */

		// json += ',"' + select + '", "' + input +'"'; alert(json);
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




















