<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var nickChecked = false;
	
	// 문자열 각 글자를 바이트로 환산해서 총 길이 리턴(한글은 2, 영문은 1로 처리)
	function getLength(str) {
		var ln = 0;	
		var ch = "";
		
		for(var i = 0 ; i < str.length ; i++){
			ch = str.charAt(i);
			if(escape(ch).length > 4){
				ln += 2;
			}else{
				ln += 1;
			}
		}
		return ln;
	} 

	function nickChk() {
		var chk = /^[a-zA-Zㄱ-힣]{2,12}$/;
		
		var nickname = $("#nickname").val();
		var ln = getLength(nickname);
		if(!chk.test(nickname) || ln < 4 || ln > 12){	// 닉네임 유효성 검사
			alert("닉네임 형식을 확인해주세요.");
			$("#nickname").focus();
			$("#nickChkMsg").css("color", "red");
			$("#nickChkMsg").text("중복확인을 해주세요");
			return;
		}else{	// 닉네임 중복검사
			$.ajax({
				url: "<c:url value='/nickCheck'/>",
				dataType: "json",
				data: {nickname:nickname},
				success: function(data) {
					if(data.find == true){
						$("#nickChkMsg").css("color", "red");
						$("#nickChkMsg").text("중복확인을 해주세요");
						alert("이미 존재하는 닉네임입니다");
						$("#nickname").val("");
						$("#nickname").focus();
						return;
					}else{
						$("#nickChkMsg").css("color", "green");
						$("#nickChkMsg").text("사용 가능한 닉네임입니다");
						nickChecked = true;
					}
				}
			});
		}
	}

	function isNickChecked() {
		if(nickChecked == true){
			$("#nickChkMsg").css("color", "red");
			$("#nickChkMsg").text("중복확인을 해주세요");
			nickChecked = false;
		}
	}

	function phoneChk() {
		var chk = /^\d{3}-?(\d{3,4})-?(\d{4})$/;
		
		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		if(chk.test(phone)){
			$("#phoneChkMsg").text("");
			$("#phone").val(phone);
			return true;
		}else{
			$("#phoneChkMsg").text("전화번호 형식을 확인해주세요");
			$("#phone").val("");
			return false;
		}
	}

	function validate() {				
		if(nickChecked == false){
			alert("닉네임 중복확인을 해주세요");
			$("#nickname").focus();
			return;
		}
		
		if(!phoneChk()){
			alert("전화번호를 확인해주세요");
			$("#phone2").focus();
			return;
		}
		
		$("#joinForm").submit();
	}
</script>

<section class="hami-blog-details-area pt-50">
       <div class="container">
           <div class="row justify-content-center">

			<div class="hami-contact-form mb-30">
				<div class = "row d-flex justify-content-between mb-30">
					<h2 class = "mt-15" style = "padding-left: 45px;"><img src = "<c:url value= '/resources/img/naver_logo.png'/>" style = "height: 50px;margin-right: 20px;">네이버 로그인</h2>
					<div class="mt-15" style = "padding-right: 45px;">회원 정보를 추가 입력해주세요.</div>	
				</div>
			    <!-- Form -->
			    <form id = "joinForm" method="post" action="<c:url value ='/naverJoin'/>">
				    <input type = "hidden" name = "${sessionScope.id }">
					<input type = "hidden" id = "phone" name = "phone">
			        <div class="row">
			            <!-- 닉네임 -->
			            <div class="col-12 col-lg-3 text-center">
			                <label for="nickname" class = "mt-15 bold">필명(닉네임)</label>
			            </div>
			            <div class="col-12 col-lg-5">
			                <input type="text" id="nickname" name = "nickname" onkeyup="javascript:isNickChecked()" class="form-control" aria-describedby="nicknameHelpBlock">
			                <small id="nicknameHelpBlock" class="form-text text-muted mb-30" style = "margin-left: 15px;">
							  영문 4자~12자,한글 2자~6자(띄어쓰기, 특수문자 불가)
							</small>
			            </div>
			            <div class="col-12 col-lg-2">
			                <a href = "javascript:nickChk()" class="btn hami-btn btn-2">중복확인</a>
			            </div>
			            <div class="col-12 col-lg-2">
			                <div id = "nickChkMsg" class = "joinChk mt-15">중복확인을 해주세요</div>
			            </div>
			        </div>
			        <div class = "d-flex justify-content-start">
			            <!-- 휴대폰 -->
			            <div class="col-12 col-lg-3 text-center">
			                <label for="name" class = "mt-15 bold">휴대폰 번호</label>
			            </div>
			        	<div style = "width:200px;margin-right: 15px;" >
			            	<select id="phone1" onchange="javascript:phoneChk()" class="form-control mb-30">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="070">070</option>
							</select> 
			            </div>
			        	<div class="text-center" style = "width: 60px;">
							<div class = "mt-15 ">-</div>
			            </div>
			             <div class="col-12 col-lg-2">
			            	<input type="text" id="phone2" onkeyup="javascript:phoneChk()"  class="form-control mb-30">
			            </div>
			            <div class="text-center" style = "width: 60px;">
							<div class = "mt-15 ">-</div>
			            </div>
			             <div class="col-12 col-lg-2">
			            	<input type="text" id="phone3" onkeyup="javascript:phoneChk()"  class="form-control mb-30">
			            </div>
			            <div style = "width: 250px;padding: 0 15px;">
							<div id = "phoneChkMsg" class = "joinChk mt-15"></div>
			            </div>
			        </div>
			        <!-- 버튼 -->
		            <div class = "d-flex justify-content-center">
			            <div class="col-12 col-lg-6">
			                <a href = "javascript:validate();" class="btn hami-btn btn-3 mt-15 w-100">로그인</a>
			            </div>
		            </div>
			    </form>
			</div>
		</div>
	</div>
</section>