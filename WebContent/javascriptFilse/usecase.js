$(function() {
/*
	Map = function() {
		this.map = new Object();
	};
	Map.prototype = {
		put : function(key, value) {
			this.map[key] = value;
		},
		get : function(key) {
			return this.map[key];
		},
		containsKey : function(key) {
			return key in this.map;
		},
		containsValue : function(value) {
			for ( var prop in this.map) {
				if (this.map[prop] == value)
					return true;
			}
			return false;
		},
		isEmpty : function(key) {
			return (this.size() == 0);
		},
		clear : function() {
			for ( var prop in this.map) {
				delete this.map[prop];
			}
		},
		remove : function(key) {
			delete this.map[key];
		},
		keys : function() {
			var keys = new Array();
			for ( var prop in this.map) {
				keys.push(prop);
			}
			return keys;
		},
		values : function() {
			var values = new Array();
			for ( var prop in this.map) {
				values.push(this.map[prop]);
			}
			return values;
		},
		size : function() {
			var count = 0;
			for ( var prop in this.map) {
				count++;
			}
			return count;
		}
	};*/

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

	// 저장
	function save() {
		var $itemSelect = $('.mid_position #item').find('select').val();
		var $itemInput = $('.mid_position #item').find('input').val();
		var $selector = $('.mid_position #field').find('div');
		var $select = $selector.find('select').val();
		var $input = $selector.find('input').val();
		var json = '{ " ' + $itemSelect + '" : "' + $itemInput + '"';
		
		json += ', "' + $select + '" : "' + $input +'"'; 
		
		json += '}';
		
		/*$select.each(function(i, e) { 
			 var select = $(this).val(); 
			 json += ',"' + select; 
		 }); 
		 $input.each(function(i, e) { 
			 var input = $(this).val(); 
			 json += '", "' + input +'"'; 
		 });*/
		
		var json1 = new Object();
		json1.select1=$itemSelect;
		json1.input1=$itemInput;
		json1.select=$select;
		json1.input=$input;
		
		var json_obj = JSON.stringify(json1);
		
		alert(json_obj);
		
		location.href='json.do';
		
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
	        url:'suggest.html',
	        type:'POST',
	        data: 'q=' + str,
	        dataType: 'json',
	        success: function( json ) {
	            $('#myselect').append(json);

	        }
	    });
	};

	$( '.suggest' ).keyup( function() {
	   getResults( $( this ).val() );
	} );
/*
 * //step 1
 * 
 * $(function(){ $('#switcher-large').bind('click', function(){
 * $('body').addClass('large'); }); });
 * 
 * //step1-1
 * 
 * $(function(){ $('#switcher-large').on('click', function(){
 * $('body').addClass('large'); });
 * 
 * $('#switcher-narrow').on('click', function(){ $('body').addClass('narrow');
 * });
 * 
 * $('#switcher-default').on('click', function(){ $('body').removeClass('narrow
 * large'); }); });
 * 
 * //step2
 * 
 * $(function(){ $('#switcher-large').on('click', function(){
 * $('body').addClass('large'); });
 * 
 * $('#switcher-narrow').on('click', function(){ $('body').addClass('narrow');
 * });
 * 
 * $('#switcher-default').on('click', function(){ $('body').removeClass('narrow
 * large'); }); });
 * 
 * //step3
 * 
 * $(function(){ $('#switcher-large').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').addClass('large'); });
 * 
 * $('#switcher-narrow').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').addClass('narrow'); });
 * 
 * $('#switcher-default').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass('narrow large'); }); });
 * 
 * //step4
 * 
 * $(function(){ $('#switcher-large').on('click', function(){
 * $('body').addClass('large'); });
 * 
 * $('#switcher-narrow').on('click', function(){ $('body').addClass('narrow');
 * });
 * 
 * $('#switcher-default').on('click', function(){ $('body').removeClass('narrow
 * large'); });
 * 
 * $('#switcher .button').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected'); });
 * 
 * 
 * });
 * 
 * //step5
 * 
 * $(function(){ $('#switcher .button').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass(); }); $('#switcher-large').on('click', function(){
 * $('body').addClass('large'); }); $('#switcher-narrow').on('click',
 * function(){ $('body').addClass('narrow'); }); });
 * 
 * //step 6
 * 
 * $(function(){ $('#switcher .button').on('click', function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass();
 * 
 * if(this.id == 'switcher-large') { $('body').addClass('large'); }else
 * if('switcher-narrow'){ $('body').addClass('narrow'); } }); });
 * 
 * //step 7
 * 
 * $(function(){ $('#switcher .button').click(function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass();
 * 
 * if(this.id == 'switcher-large') { $('body').addClass('large'); }else
 * if('switcher-narrow'){ $('body').addClass('narrow'); } }); });
 * 
 * //step 8
 * 
 * $(function() { $('#switcher .button').hover(function() {
 * $(this).addClass('hover'); }, function() { $(this).removeClass('hover'); }) })
 *  // step 9
 * 
 * $(function() { $('#switcher h3').click(function() { $('#switcher
 * .button').toggleClass('hidden'); });
 * 
 * $('#switcher .button').click(function(){ $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass();
 * 
 * if(this.id == 'switcher-large') { $('body').addClass('large'); }else
 * if('switcher-narrow'){ $('body').addClass('narrow'); } }); });
 *  // step 10
 * 
 * $(function() { $('#switcher').click(function() { $('#switcher
 * .button').toggleClass('hidden'); });
 * 
 * $('#switcher .button').click(function(event) { $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass();
 * 
 * if (this.id == 'switcher-large') { $('body').addClass('large'); } else if
 * ('switcher-narrow') { $('body').addClass('narrow'); }
 * 
 * event.stopPropagation(); }); });
 
// step 10

 * $(function() { $('#switcher').on('click.kosta', function() { $('#switcher
 * .button').toggleClass('hidden'); });
 * 
 * $('#switcher .button').click(function(event) { $('#switcher
 * .button').removeClass('selected'); $(this).addClass('selected');
 * $('body').removeClass();
 * 
 * if (this.id == 'switcher-large') { $('body').addClass('large'); } else if
 * ('switcher-narrow') { $('body').addClass('narrow'); }
 * 
 * event.stopPropagation();
 * 
 * $('#switcher-large, switcher-narrow').click(function() {
 * $('#switcher').off('click.kosta'); })
 * 
 * $('#switcher').trigger('click.kosta'); }); });
 * 
 
*/
