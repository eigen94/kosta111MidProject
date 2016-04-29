$(function () {
    $('#datetimepicker1').datetimepicker({format: 'YYYY-MM-DD'});
    $('#datetimepicker2').datetimepicker({format: 'YYYY-MM-DD'});
    
    var projectCrew = [];
    var projectCrewM_id = [];
    var projectCrewString = "";
    var searchResult;
    
    $('#projectMemeber').keyup(function(){
    	var $registerEmailValue = $(this).val();
    	
    	if($registerEmailValue!=""){
	    	$.ajax({
	    		url : 'memberNameOrEmailSearch.do',
	    		data : {
	    			searchKey : $registerEmailValue
	    		},
	    		method : 'post',
	    		success : function(value){
	    			var regTmp = /\d/g;
	    			searchResult = regTmp.exec(value);
	    			if(value.length!=6){
	        	    	$('#inputIndicator').removeClass('has-error');
	        	    	$('#inputIndicator').addClass('has-success');
	    			} else {
	        	    	$('#inputIndicator').removeClass('has-success');
	        	    	$('#inputIndicator').addClass('has-error');
	    			}
	    		}
	    	});
    	} else {
    		$('#inputIndicator').removeClass('has-success');
    		$('#inputIndicator').removeClass('has-error');
    	}//end of if
    });//end of search member input feild keyup event
    $('#memberAddBtn').click(function(){
    	var indicatorValue = $('#inputIndicator').attr('class');
    	var checkValue = indicatorValue.indexOf('has-success');
    	if(checkValue!=-1){
    	console.log('can add!');
    		var addHtml = '<div class="addedMember">';
    		addHtml += '<label for="projectcrew" class="col-sm-3 control-label"></label>'
 			addHtml +=	'<div class="col-sm-7">';
   			addHtml +='<div class="input-group">';
   			addHtml +='<a href="#" class="form-control">'+$('#projectMemeber').val()+'</a>';
   			addHtml +='<span class="input-group-addon memberDelBtn">';
   			addHtml +='<span class="glyphicon glyphicon-minus-sign"></span>';
   			addHtml +='</span>';
   			addHtml +='</div>';
   			addHtml +='</div>';
   			addHtml +='</div>';
    		$("#memberAddPoint").append(addHtml);
    		$('#inputIndicator').removeClass('has-success');
    		projectCrew.push($('#projectMemeber').val());
    		projectCrewM_id.push(searchResult);
    		projectCrewString = projectCrewM_id.toString();
    		$('#projectCrew').val(projectCrewString);
    		$('#projectMemeber').val('');
    	}
    });//member addBtn event
    
    
    
    //맴버 삭제버튼 이벤트
    $(document).on('click','.memberDelBtn',function(){
    	var tmp = $(this).parent().find('a').html();
    	var indexOfTarget = jQuery.inArray(tmp, projectCrew);
    	projectCrew.splice($.inArray(tmp, projectCrew),1);
    	projectCrewM_id.splice(indexOfTarget, 1);
    	projectCrewString = projectCrewM_id.toString();
   		$('#projectCrew').val(projectCrewString);
    	$(this).parent().parent().parent().remove();
    	
    });
    
});
function setInputFormDate(){//set modal default dateValue
	var dateObj = new Date; 
	var modalDefaultYear = dateObj.getFullYear();
	var modalDefaultMonth = dateObj.getMonth()+1;
	if(modalDefaultMonth<10){
		modalDefaultMonth = '0'+modalDefaultMonth;
	}
	var modalDefaultDay = dateObj.getDate();
	var modalDefaultValue = modalDefaultYear+"-"+modalDefaultMonth+"-"+modalDefaultDay;
	$('#projectStartDate').val(modalDefaultValue);
	$('#projectEndDate').val(modalDefaultValue);
}//end of set input form date
setInputFormDate();

