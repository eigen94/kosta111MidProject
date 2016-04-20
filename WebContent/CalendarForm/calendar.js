(function($){
	var calendar = new controller();
	calendar.init();

	function controller(target) {

	     var that = this;  
	     var m_oMonth = new Date();
	     m_oMonth.setDate(1);

	     this.init = function() {
	          that.renderCalendar();
	          that.initEvent();
	          that.weekCalendar();
	     }

	    /* 달력 UI 생성 */
	     this.renderCalendar = function() {
	          var arrTable = [];

	          arrTable.push('<table><colgroup>');
	          for(var i=0; i<7; i++) {
	               arrTable.push('<col width="100">');
	          }         
	          arrTable.push('</colgroup><thead><tr>');

	          var arrWeek = "일월화수목금토".split("");

	          for(var i=0, len=arrWeek.length; i<len; i++) {
	               var sClass = '';
	               sClass += i % 7 == 0 ? 'sun' : '';
	               sClass += i % 7 == 6 ? 'sat' : '';
	               arrTable.push('<td class="'+sClass+'">' + arrWeek[i] + '</td>');
	          }
	          arrTable.push('</tr></thead>');
	          arrTable.push('<tbody>');

	          var oStartDt = new Date(m_oMonth.getTime());
	        // 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
	          oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());

	          for(var i=0; i<100; i++) {
	               if(i % 7 == 0) {
	                    arrTable.push('<tr>');
	               }

	               var sClass = 'date-cell '
	            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
	               sClass += i % 7 == 0 ? 'sun' : '';
	               sClass += i % 7 == 6 ? 'sat' : '';

	               arrTable.push('<td class="'+sClass+'">' + oStartDt.getDate() + '</td>');
	               oStartDt.setDate(oStartDt.getDate() + 1);

	               if(i % 7 == 6) {
	                    arrTable.push('</tr>');
	                    if(m_oMonth.getMonth() != oStartDt.getMonth()) {
	                         break;
	                    }
	               }
	          }
	          arrTable.push('</tbody></table>');

	          $('#calendar').html(arrTable.join(""));

	          that.changeMonth();
	          that.changeYear();
	     }
	     this.weekCalendar = function(){
	    	var weekTable = [];
	    	 var oStartDt = new Date();
	    	oStartDt.setDate(oStartDt.getDate());
	    	var thisMonth = oStartDt.getMonth();
	    	
	    	weekTable.push('<table><tr>');
	    	weekTable.push('<td>'+(thisMonth+1)+'월</td>');
	    	for(var i=0; i<60; i++){
	    		
	    		weekTable.push('<td>'+oStartDt.getDate()+'</td>');
	    		oStartDt.setDate(oStartDt.getDate()+1);
	    		
	    		if(thisMonth != oStartDt.getMonth()){
	    			thisMonth = oStartDt.getMonth();
	    			weekTable.push('<td>'+(thisMonth+1)+'월</td>');
	    			
		    		
	    		}
	    		
	    	
	    	}
	    		
	    	
	    	
	    	weekTable.push('</tr>');
	    	var WeekNext = 'WeekNext'; 
	    	weekTable.push('<button class='+WeekNext+'>'+">"+'</button>');
	    	weekTable.push('</table>');  
	    	
	    	 $('#weekCal').html(weekTable.join(""));    	
	     }
	     
	     

	    /* Next, Prev 버튼 이벤트 */
	     this.initEvent = function() {
	          $('#btnPrev').click(that.onPrevCalendar);
	          $('#btnNext').click(that.onNextCalendar);
	          $('#month').click(that.fn_month);
	          $('#week').click(that.fn_week);
	          $('.WeekNext').click(that.fn_weekNext);
	     }
	     
	     this.fn_weekNext = function(){
	    	 
	     }

	    /* 이전 달력 */
	     this.onPrevCalendar = function() {
	          m_oMonth.setMonth(m_oMonth.getMonth() - 1);
	          that.renderCalendar();
	     }

	    /* 다음 달력 */
	     this.onNextCalendar = function() {
	          m_oMonth.setMonth(m_oMonth.getMonth() + 1);
	          that.renderCalendar();
	     }

	    /* 달력 이동되면 상단에 현재 월 다시 표시 */
	     this.changeMonth = function() {
	          $('#currentMonth').text(that.getMonth(m_oMonth));
	     }
	     
	    /* 날짜 객체를 년 월 문자 형식으로 변환 */
	     this.getMonth = function(oDate) {
	    	 return oDate.getMonth() + 1;
	     }
	     
	     this.changeYear = function(){
	     	$('#currentYear').text(that.getYear(m_oMonth));
	     }
	     

	     /* 날짜 객체를 년 월 문자 형식으로 변환 */
	      this.getYear = function(oDate) {
	           return oDate.getFullYear();
	      }
	      
	      this.fn_month =function(){
	    		location.href="calendarMonth.jsp";
	    	}
	      this.fn_week = function(){
	    	  location.href="calendarWeek.jsp";
	      }
	      
	
	}
})(jQuery);
