$(function(){
	var that = this
	
	var usecase = new controller();
	usecase.init();
	
	
	
	this.UsecaseEvent = function(){
		$("#addUsecase").click(that.usecaseTable);
	
	}
	this.usecaseTable= function(){
		var select="select";
		var text="text";
		var name="내용";
		var value="내용을 입력하세요.";
		var num1 ="1";
		var num2 ="2";
		var num3 ="3";
		var renderUsecase =[];
		renderUsecase.push('<select name='+select+'>');
		renderUsecase.push('<option value='+num1+'>'+개요+'</option>');
		renderUsecase.push('<option value='+num2+'>'+관련액터+'</option>');
		renderUsecase.push('<option value='+num3+'>'+선행조건+'</option></select>');
		renderUsecase.push('<input type='+text +'name='+name + 'value='+value+'>');
		 $('#item').html(usecaseTable.join("")); 
	
	}
})(jQuery);