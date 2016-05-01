$(function(){
	var check_projectid = $('#check_projectid').val();
	var check_id = $('#check_id').val();
	console.log(check_id);
	
	function fn_makeImageListHtml(fname,fcontent,i){
		
		var regFname = /\w+/;
		var regPattern = /\.\w+/;
		var head = regFname.exec(fname);
		var pattern = regPattern.exec(fname);
		
		var outHtml = '<div class="item  col-xs-4 col-lg-4">';
			outHtml += '<a href="#" class="thumbnail" data-toggle="modal"data-target="#lightbox'+i+'">';
			outHtml += '<img src="/kosta111MidProject/imgUpload/'+head+'_small'+pattern+'" alt="..."></a>';
			outHtml += '<div id="lightbox'+i+'" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">';
			outHtml += '<div class="modal-dialog">';
			outHtml += '<button type="button" class="close hidden" data-dismiss="modal" aria-hidden="true">×</button>';
			outHtml += '<div class="modal-content">';
			outHtml += '<div class="modal-body">';
			outHtml += '<img src="/kosta111MidProject/imgUpload/'+head+'_small'+pattern+'" alt="" />';
			outHtml += '<hr>';
			outHtml += '<textarea cols="70" class="check_content">'+fcontent+'</textarea>';
			outHtml += '<input type="hidden" class="src" value="'+fname+'">';
			outHtml += '<input type="hidden" class="check_id" value="'+check_id+'">';
			outHtml += '</div>';
			outHtml += '<hr>';
			outHtml += '<button type="button" class="modify">수정</button>';
			outHtml += '<button type="button" class="delete">삭제</button>';
			outHtml += '<hr></div></div></div></div>';
			
			return outHtml;
	}
	
	function fn_getImageListAjax(){
		$.ajax({
			url : 'imgListBoard.img',
			data : {
				check_id : check_id
			},
			dataType : 'json',
			method : 'post',
			success : function(data){
				console.log("imageList : "+data);
				for(var i=0; i<data.length; i++){
					console.log(data[i].fname);
					var fname = data[i].fname;
					var fcontent = data[i].ftext;
					var imageListHtml = fn_makeImageListHtml(fname,fcontent,i);
					$('#products').append(imageListHtml);
				}
			}
		});
	}
	fn_getImageListAjax();

    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    
 var $lightbox = $('#lightbox');
    
    $('[data-target="#lightbox"]').on('click', function(event) {
    	console.log('hi');
        var $img = $(this).find('img'), 
            src = $img.attr('src'),
            alt = $img.attr('alt'),
            css = {
                'maxWidth': $(window).width() - 100,
                'maxHeight': $(window).height() - 100
            };
    
        $lightbox.find('.close').addClass('hidden');
        $lightbox.find('img').attr('src', src);
        $lightbox.find('img').attr('alt', alt);
        $lightbox.find('img').css(css);
    });
    
    $lightbox.on('shown.bs.modal', function (e) {
        var $img = $lightbox.find('img');
            
        $lightbox.find('.modal-dialog').css({'width': $img.width()});
        $lightbox.find('.close').removeClass('hidden');
    });
    
    $('#products').on('click','.delete',function(){
    	var check_id = $(this).parent().children().eq(0).children().eq(4).val();
    	var fname = $(this).parent().children().eq(0).children().eq(3).val();
    	var url = 'delete.img?check_id='+check_id;
    	$.ajax({
    		url : 'delete.img',
    		data : {
    			check_id : check_id,
    			fname : fname
    		},
    		method : 'post',
    		success : function(){
    			$('#products .item').remove();
    			fn_getImageListAjax();
    		}
    	});
    	//$(location).attr('href',url);
    })
    
    $('#products').on('click','.modify',function(){
    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
    	var imgSrc = $(this).parent().children().eq(0).children().eq(3).val()
    	var content = $(this).parent().children().eq(0).children().eq(2).val()
    	var url = 'modify.img?check_id='+check_id+'&&content='+content+'&&imgSrc='+imgSrc;
    	$(location).attr('href',url);
    })
});

/*               */
  
 	$(document).on('click', '#close-preview', function(){ 
	    $('.image-preview').popover('hide');
	    // Hover befor close the preview
	    $('.image-preview').hover(
	        function () {
	           $('.image-preview').popover('show');
	        }, 
	         function () {
	           $('.image-preview').popover('hide');
	        }
	    );    
	});

	$(function() {
	    // Create the close button
	    var closebtn = $('<button/>', {
	        type:"button",
	        text: 'x',
	        id: 'close-preview',
	        style: 'font-size: initial;',
	    });
	    closebtn.attr("class","close pull-right");
	    // Set the popover default content
	    $('.image-preview').popover({
	        trigger:'manual',
	        html:true,
	        title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
	        content: "There's no image",
	        placement:'bottom'
	    });
	    // Clear event
	    $('.image-preview-clear').click(function(){
	        $('.image-preview').attr("data-content","").popover('hide');
	        $('.image-preview-filename').val("");
	        $('.image-preview-clear').hide();
	        $('.image-preview-input input:file').val("");
	        $(".image-preview-input-title").text("Browse"); 
	    }); 
	    // Create the preview image
	    $(".image-preview-input input:file").change(function (){     
	        var img = $('<img/>', {
	            id: 'dynamic',
	            width:250,
	            height:200
	        });      
	        var file = this.files[0];
	        var reader = new FileReader();
	        // Set preview image into the popover data-content
	        reader.onload = function (e) {
	            $(".image-preview-input-title").text("Change");
	            $(".image-preview-clear").show();
	            $(".image-preview-filename").val(file.name);            
	            img.attr('src', e.target.result);
	            $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
	        }        
	        reader.readAsDataURL(file);
	    });  
	});

//
//	$(document).ready(function() {
//	    var $lightbox = $('#lightbox');
//	    
//	    $('[data-target="#lightbox"]').on('click', function(event) {
//	        var $img = $(this).find('img'), 
//	            src = $img.attr('src'),
//	            alt = $img.attr('alt'),
//	            css = {
//	                'maxWidth': $(window).width() - 100,
//	                'maxHeight': $(window).height() - 100
//	            };
//	    
//	        $lightbox.find('.close').addClass('hidden');
//	        $lightbox.find('img').attr('src', src);
//	        $lightbox.find('img').attr('alt', alt);
//	        $lightbox.find('img').css(css);
//	    });
//	    
//	    $lightbox.on('shown.bs.modal', function (e) {
//	        var $img = $lightbox.find('img');
//	            
//	        $lightbox.find('.modal-dialog').css({'width': $img.width()});
//	        $lightbox.find('.close').removeClass('hidden');
//	    });
//	    
//	    $('.delete').on('click',function(){
//	    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
//	    	var url = 'delete.img?check_id='+check_id;
//	    	$(location).attr('href',url);
//	    });
//	    
//	    $('.modify').on('click',function(){
//	    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
//	    	var imgSrc = $(this).parent().children().eq(0).children().eq(3).val()
//	    	var content = $(this).parent().children().eq(0).children().eq(2).val()
//	    
//	    	var url = 'modify.img?check_id='+check_id+'&&content='+content+'&&imgSrc='+imgSrc;
//	    
//	    	$(location).attr('href',url);
//	    })
//	});
//	
// 
 
 
/*               */