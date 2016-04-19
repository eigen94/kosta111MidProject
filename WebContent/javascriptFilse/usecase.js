$(function(){
	var seq = 1;
	function addRow(){
		seq++;
		var html = '<div class="tuple'+seq+'">' +
		'<select name="select"><option value="">선택</option><option value="개요">개요</option><option value="관련엑터">관련엑터</option><option value="선행조건">선행조건</option></select>'+
		'<input type="text" name="내용" value="내용을 입력하세요."><a href="usecaseDelete.do"><button>ㅡ</button></a></div>'+
		'<div id="plus_btn"><button>+</button></div>';
		
		$('.mid_position').append(html);
	}
	
	
	
	
	$(document).on('click', '.mid_position #plus_btn',function() {
		//부모 div id
		var p_btnNum = $(this).closest('div').attr('id');
		$(this).hide();
		addRow();
	});
	
	
	$('input').on('click', function() {
		$(this).val('');
	});
	
	
	
	
	
	$('#letter-b a').click(function(){
		$.getJSON('b.json', function(data) {
			$('#dictionary').empty();
			$.each(data, function(index, entry) {
				var html='<div class="entry">';
				html += '<h3 class="term">' + entry.term + '</h3>';
				html += '<div class="part">' + entry.part + '</div>';
				html += '<div class="definition">' + entry.definition + '</div>';
				html += '</div>';
				
				$('#dictionary').append(html);
			})
		})
		return false;
	});
	
	
});






/*
//step 1

$(function(){
   $('#switcher-large').bind('click', function(){
      $('body').addClass('large');
   });
});

//step1-1

$(function(){
   $('#switcher-large').on('click', function(){
      $('body').addClass('large');
   });

   $('#switcher-narrow').on('click', function(){
      $('body').addClass('narrow');
   });

   $('#switcher-default').on('click', function(){
      $('body').removeClass('narrow large');
   });
});

//step2

$(function(){
   $('#switcher-large').on('click', function(){
      $('body').addClass('large');
   });
   
   $('#switcher-narrow').on('click', function(){
      $('body').addClass('narrow');
   });
   
   $('#switcher-default').on('click', function(){
      $('body').removeClass('narrow large');
   });
});

//step3

$(function(){
   $('#switcher-large').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').addClass('large');
   });
   
   $('#switcher-narrow').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').addClass('narrow');
   });
   
   $('#switcher-default').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').removeClass('narrow large');
   });
});

//step4

$(function(){
   $('#switcher-large').on('click', function(){
      $('body').addClass('large');
   });
   
   $('#switcher-narrow').on('click', function(){
      $('body').addClass('narrow');
   });
   
   $('#switcher-default').on('click', function(){
      $('body').removeClass('narrow large');
   });
   
   $('#switcher .button').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
   });
   
   
});

//step5

$(function(){
   $('#switcher .button').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').removeClass();
   });
   $('#switcher-large').on('click', function(){
      $('body').addClass('large');
   });
   $('#switcher-narrow').on('click', function(){
      $('body').addClass('narrow');
   });
});

//step 6

$(function(){
   $('#switcher .button').on('click', function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').removeClass();
      
      if(this.id == 'switcher-large') {
    	  $('body').addClass('large');
      }else if('switcher-narrow'){
    	  $('body').addClass('narrow');
      }
   });
});

//step 7

$(function(){
   $('#switcher .button').click(function(){
      $('#switcher .button').removeClass('selected');
      $(this).addClass('selected');
      $('body').removeClass();
      
      if(this.id == 'switcher-large') {
    	  $('body').addClass('large');
      }else if('switcher-narrow'){
    	  $('body').addClass('narrow');
      }
   });
});

//step 8

$(function() {
	$('#switcher .button').hover(function() {
		$(this).addClass('hover');
	}, function() {
		$(this).removeClass('hover');
	})
})

// step 9

 $(function() {
 $('#switcher h3').click(function() {
 $('#switcher .button').toggleClass('hidden');
 });

 $('#switcher .button').click(function(){
 $('#switcher .button').removeClass('selected');
 $(this).addClass('selected');
 $('body').removeClass();
      
 if(this.id == 'switcher-large') {
 $('body').addClass('large');
 }else if('switcher-narrow'){
 $('body').addClass('narrow');
 }
 });
 });

// step 10

$(function() {
	$('#switcher').click(function() {
		$('#switcher .button').toggleClass('hidden');
	});

	$('#switcher .button').click(function(event) {
		$('#switcher .button').removeClass('selected');
		$(this).addClass('selected');
		$('body').removeClass();

		if (this.id == 'switcher-large') {
			$('body').addClass('large');
		} else if ('switcher-narrow') {
			$('body').addClass('narrow');
		}
		
		event.stopPropagation();
	});
});
*/
// step 10
/*
$(function() {
	$('#switcher').on('click.kosta', function() {
		$('#switcher .button').toggleClass('hidden');
	});
	
	$('#switcher .button').click(function(event) {
		$('#switcher .button').removeClass('selected');
		$(this).addClass('selected');
		$('body').removeClass();
		
		if (this.id == 'switcher-large') {
			$('body').addClass('large');
		} else if ('switcher-narrow') {
			$('body').addClass('narrow');
		}
		
		event.stopPropagation();
		
		$('#switcher-large, switcher-narrow').click(function() {
			$('#switcher').off('click.kosta');
		})
		
		$('#switcher').trigger('click.kosta');
	}); 
});

*/

































