$(function() {
	count = 1;
	// 콜릭하면 내용을 지운다.
	$('input').on('click', function() {
		$(this).val('');
	});

	// select창 1줄 추가
	function addRow() {
		var span = document.createElement('span');
		span.innerHTML = document.getElementById('item').innerHTML;
		document.getElementById('field').appendChild(span);
		count++;
	}

	// 삭제
	function deleteRow(obj) {
		document.getElementById('field').removeChild(obj.parentNode);
		count--;
	}
	
	// 저장
	function save() {
		var jsonArray = new Array();
		var jsonObj = new Object();
		var tmp1=[];
		var tmp2 =[];
		
		//반복문 시작
		for(var i=0;i<count;i++){
			if($('select').eq(i).val() == 'act'){
			
					tmp1.push($('input').eq(i).val());
					
			}else if($('select').eq(i).val() == 'even'){
					tmp2.push($('input').eq(i).val());
			}
			
		}		//반복문 종료
		jsonObj.act = tmp1;
		jsonObj.even = tmp2;
		
		jsonArray.push(jsonObj);
		
		var finalJsonObj = JSON.stringify(jsonObj);
		console.log(finalJsonObj);
		
		$.ajax({
			type:"post",
			url:"usecaseDiagram.do",
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




















