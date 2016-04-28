
$(document).ready(function() {
    $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
    $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    
 var $lightbox = $('#lightbox');
    
    $('[data-target="#lightbox"]').on('click', function(event) {
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
    
    $('.delete').on('click',function(){
    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
    	var url = 'delete.img?check_id='+check_id;
    	$(location).attr('href',url);
    })
    
    $('.modify').on('click',function(){
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


	$(document).ready(function() {
	    var $lightbox = $('#lightbox');
	    
	    $('[data-target="#lightbox"]').on('click', function(event) {
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
	    
	    $('.delete').on('click',function(){
	    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
	    	var url = 'delete.img?check_id='+check_id;
	    	$(location).attr('href',url);
	    })
	    
	    $('.modify').on('click',function(){
	    	var check_id = $(this).parent().children().eq(0).children().eq(4).val()
	    	var imgSrc = $(this).parent().children().eq(0).children().eq(3).val()
	    	var content = $(this).parent().children().eq(0).children().eq(2).val()
	    
	    	var url = 'modify.img?check_id='+check_id+'&&content='+content+'&&imgSrc='+imgSrc;
	    
	    	$(location).attr('href',url);
	    })
	});
	
 
 
 
/*               */