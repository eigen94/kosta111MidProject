<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>코스타 중간프로젝트</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="cssFiles/carousel.css" rel="stylesheet">

  </head>
  <body>
<!-- NAVBAR
================================================== -->
  <jsp:include page="pageModule/navBar.jsp"></jsp:include>
  
    <!-- Carousel
    ================================================== -->
    <div id="bodyContent">
    
	    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	      <!-- Indicators -->
	      <ol class="carousel-indicators">
	        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	        <li data-target="#myCarousel" data-slide-to="1"></li>
	        <li data-target="#myCarousel" data-slide-to="2"></li>
	      </ol>
	      <div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>코스타111 중간 프로젝트</h1>
	              <p>저희 서비스는 프로젝트 진행과정중인 개발자들에게 여러가지 편의를 제공합니다. <!-- <code>file://</code> --> 더이상 문서작성으로 스트레스 받지 마세요!</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">더 알아보기</a></p>
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>여러기능을 제공합니다!</h1>
	              <p>프로젝트별 관리, 일정 생성 및 관리, 체크리스트 제공과 같은 프로젝트 진행관리는 물론이고, 설계단계에서 필요한 여러 명세서, 다이어그램 작성을 도와줍니다. 물론, 쉽게 결과물을 뽑을 수 있지요!</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">더 알아보기</a></p>
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
	          <div class="container">
	            <div class="carousel-caption">
	              <h1>지금 가입하세요!</h1>
	              <p>최소한의 개인정보로 이 많은 서비스를 누리세요!</p>
	              <p><a class="btn btn-lg btn-primary" href="#" role="button">회원가입</a></p>
	            </div>
	          </div>
	        </div>
	      </div>
	      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	        <span class="sr-only">Previous</span>
	      </a>
	      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	        <span class="sr-only">Next</span>
	      </a>
	    </div><!-- /.carousel -->
	
	
	    <!-- Marketing messaging and featurettes
	    ================================================== -->
	    <!-- Wrap the rest of the page in another container to center all the content. -->
	
	    <div class="container marketing">
	
	      <!-- Three columns of text below the carousel -->
	      
	      <div class="row">
	        <div class="col-lg-4">
	          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	          <h2>Heading</h2>
	          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
	          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	        </div><!-- /.col-lg-4 -->
	        <div class="col-lg-4">
	          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	          <h2>Heading</h2>
	          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
	          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	        </div><!-- /.col-lg-4 -->
	        <div class="col-lg-4">
	          <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	          <h2>Heading</h2>
	          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
	          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	        </div><!-- /.col-lg-4 -->
	      </div><!-- /.row -->
	
	
	      <!-- START THE FEATURETTES -->
	
	      <hr class="featurette-divider">
	
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading">체계적인 프로젝트 관리! <span class="text-muted">진행 사항을 한눈에 확인하세요!</span></h2>
	          <p class="lead">진행중인 프로젝트를 해야할 일정별, 월간, 일간 계획으로 조회할 수 있습니다. 내가 해야 할 일도 한눈에 확인 가능하죠!</p>
	        </div>
	        <div class="col-md-5">
	          <img class="featurette-image img-responsive center-block" src="images/index/calendar.png" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
	        </div>
	      </div>
	
	      <hr class="featurette-divider">
	
	      <div class="row featurette">
	        <div class="col-md-7 col-md-push-5">
	          <h2 class="featurette-heading">웹기반 메신저!<span class="text-muted">일과 사생활을 분리하세요!</span></h2>
	          <p class="lead">업무내용만을 담을 수 있게 프로젝트를 생성하면 해당 맴버와의 메신저를 제공합니다!</p>
	        </div>
	        <div class="col-md-5 col-md-pull-7">
	          <img class="featurette-image img-responsive center-block" src="images/index/messenger.png" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
	        </div>
	      </div>
	
	      <hr class="featurette-divider">
	
	      <div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading">다양한 툴! <span class="text-muted">문서작성은 이제 개발의 일부입니다! </span></h2>
	          <p class="lead">더이상 한글로 문서를 작성하지 않아도 됩니다! 자연스럽게 설계를 하다보면 문서작성이 따라오는 경험을 누리세요!</p>
	        </div>
	        <div class="col-md-5">
	          <img class="featurette-image img-responsive center-block" src="images/index/checklist.png" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
	        </div>
	      </div>
	
	      <hr class="featurette-divider">
	
	      <!-- /END THE FEATURETTES -->
    
    </div>
    
    <!-- end of bodycontent -->



	<!-- Modal -->

	<!-- registerFormMoadl -->
	<div id="registerFormModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-body">
	      
	        <div class="tabbable"> <!-- Only required for left/right tabs -->
		        <ul class="nav nav-tabs">
			        <li class="active"><a href="#tab1" data-toggle="tab">로그인</a></li>
			        <li><a href="#tab2" data-toggle="tab">회원가입</a></li>
		        </ul>
		        
			    <!-- Modal tab content -->
		        <div class="tab-content">
		        <!-- Modal tab1 -->
			        <div class="tab-pane active" id="tab1">
			        <br><br>
		       			<form action="loginOk.do" method="post" class="form-horizontal">
			       			<div class="form-group">
				       			<label for="inputEmail" class="col-sm-2 control-label">Email</label>
				   				<div class="col-sm-10">
									<input class="form-control" id="inputEmail" type="text" name="m_email" size="20" placeholder="이메일을 입력하세요"><br>
								</div>
							</div>
			       			<div class="form-group">
				       			<label for="inputPassword" class="col-sm-2 control-label">Password</label>
				   				<div class="col-sm-10">
									<input class="form-control" id="inputPassword" type="password" name="m_pwd" size="20" placeholder="비밀번호를 입력하세요"><br>
								</div>
							</div>
						  	<div class="form-group">
						    	<div class="col-sm-offset-2 col-sm-10">
						      		<button type="submit" class="btn btn-default">로그인</button>
						    	</div>
						  	</div>
						</form><!-- end of login form -->
			        </div><!-- end of Modal tab1 -->
		        
			        <!-- Modal tab2 -->
			        <div class="tab-pane" id="tab2">
			        <br><br>
				        <form action="registerOk.do" method="post" class="form-horizontal" id="registerForm">
					        <div class="form-group">
				       			<label for="registerName" class="col-sm-3 control-label">이름</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerName" type="text" name="m_name" size="20" placeholder="이름을 입력하세요"><br>
								</div>
				       			<label for="registerEmail" class="col-sm-3 control-label">이메일</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerEmail" type="email" name="m_email" size="20" placeholder="이메일을 입력하세요"><br>
								</div>
				       			<label for="registerPassword" class="col-sm-3 control-label">비밀번호</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerPassword" type="password" name="m_pwd" size="20" placeholder="비밀번호를 입력하세요"><br>
								</div>
				       			<label for="registerPwdCheck" class="col-sm-3 control-label">비밀번호 확인</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerPwdCheck" type="password" size="20" placeholder="비밀번호를 다시 입력하세요"><br>
								</div>
				       			<label for="registerPhone" class="col-sm-3 control-label">연락처</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerPhone" type="text" name="m_phone" size="20" placeholder="연락처를 입력하세요"><br>
								</div>
								<label for="registerquestion" class="col-sm-3 control-label">Select list:</label>
								<div class="col-sm-7">
								<select class="form-control" id="registerquestion" name="m_question">
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								    <option value="6">6</option>
								    <option value="7">7</option>
								</select>
								<br>
								</div>
								<br><br>
				       			<label for="registerAnswer" class="col-sm-3 control-label">비밀번호 찾기 답</label>
				   				<div class="col-sm-7">
									<input class="form-control" id="registerAnswer" type="text" name="m_answer" size="20" placeholder="비밀번호 찾기 답을 입력하세요"><br>
								</div>
					        </div><!-- end of form-grop -->
					        
		   				  	<div class="form-group">
						    	<div class="col-sm-offset-3 col-sm-9">
						      		<button type="submit" class="btn btn-default">회원가입</button>
						    	</div>
						  	</div>
						  	
				  </form><!-- end of register form -->
			    </div><!-- end of Modal tab2 -->
		      </div><!-- end of Modal tab content -->
	        </div><!-- end of Modal tabbable -->
	      </div><!-- end of ModalBody -->
	    </div><!-- end of ModalBody Content -->
	  </div><!-- end of modal dialog -->
	</div><!-- end of modal  -->

      <!-- FOOTER -->
     <div class="container">
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer><!--end of FOOTER -->
     
     </div>

    </div><!-- /.container -->
<div id="dialog" title="기본 대화상자">
  <p>이것은 기본 대화상자 입니다. 이동하거나 닫을 수 있습니다.</p>
</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
    <script type="text/javascript">
    $(function(){
	    $('#registerEmail').keyup(function(){
	    	var $registerEmailValue = $(this).val();
	    	
	    	if($registerEmailValue!=""){
		    	$.ajax({
		    		url : 'memberNameOrEmailSearch.do',
		    		data : {
		    			searchKey : $registerEmailValue
		    		},
		    		method : 'post',
		    		success : function(value){
		    			console.log('return '+value);
		    		}
		    	});
	    	}//end of if
	    	
	    	//console.log($(this).val());
	    });
    	
    });
    </script>
    
  </body>
</html>
