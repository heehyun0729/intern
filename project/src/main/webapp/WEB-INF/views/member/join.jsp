<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function idChk() {
		var chk = /^[a-zA-Z0-9]{4,12}$/;
		
		var id = $("#id").val();
		if(!chk.test(id)){	// id 유효성 검사
			alert("아이디 형식을 확인해주세요");
			$("#checkedId").val("");
			$("#id").focus();
			return;
		}else{	// id 중복검사
			$.ajax({
				url: "<c:url value='/idCheck'/>",
				dataType: "json",
				data: {id:id},
				success: function(data) {
					if(data.find == true){
						$("#idChkMsg").css("color", "red");
						$("#idChkMsg").text("중복확인을 해주세요");
						alert("이미 존재하는 아이디입니다");
						$("#id").val("");
						$("#id").focus();
						return;
					}else{
						$("#idChkMsg").css("color", "green");
						$("#idChkMsg").text("사용 가능한 아이디입니다");
						$("#checkedId").val(id);
					}
				}
			});
		}
	}
	
	function pwdChk() {
		var chk1 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/;   //영문,숫자
		var chk2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{6,12}$/;  //영문,특수문자
		var chk3 = /^(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{6,12}$/;  //특수문자, 숫자
		
		var pwd = $("#pwd").val();
		if(chk1.test(pwd) || chk2.test(pwd) || chk3.test(pwd)){
			$("#pwdChkMsg").css("color", "green");
			$("#pwdChkMsg").text("사용 가능한 비밀번호입니다");
			$("#checkedPwd").val(pwd);
		}else{
			$("#pwdChkMsg").css("color", "red");
			$("#pwdChkMsg").text("비밀번호 형식을 확인해주세요");
			$("#checkedPwd").val("");
		}
	}
	
	function pwdSameChk() {
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if(pwd == pwd2){
			$("#pwdSameChkMsg").text("");
			$("#checkedPwd2").val(pwd2);
		}else{
			$("#pwdSameChkMsg").text("비밀번호가 일치하지 않습니다");
			$("#checkedPwd2").val("");
		}
	}
	
	function nameChk() {
		var chk = /^[ㄱ-힣]{2,6}$/;
		
		var name = $("#name").val();
		if(chk.test(name)){
			$("#nameChkMsg").text("");
			$("#checkedName").val(name);
		}else{
			$("#nameChkMsg").text("이름 형식을 확인해주세요");
			$("#checkedName").val("");
		}
	}
	
	// 문자열 각 글자를 바이트로 환산해서 총 길이 리턴
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
		var chk = /^[0-9a-zA-Zㄱ-힣]{2,12}$/;
		
		var nickname = $("#nickname").val();
		var ln = getLength(nickname);
		if(!chk.test(nickname) || ln < 4 || ln > 12){	// 닉네임 유효성 검사
			alert("닉네임 형식을 확인해주세요.");
			$("#checkedNick").val("");
			$("#nickname").focus();
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
						$("#checkedNick").val(nickname);
					}
				}
			});
		}
	}
	
	function phoneChk() {
		var chk = /^\d{3}-?([0-9]{3,4})-?([0-9]{4})$/;
		
		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		if(chk.test(phone)){
			$("#phoneChkMsg").text("");
			$("#checkedPhone").val(phone);
		}else{
			$("#phoneChkMsg").text("전화번호 형식을 확인해주세요");
			$("#checkedPhone").val("");
		}
	}
	
	function validate() {
		var id = $("#id").val();
		var checkedId = $("#checkedId").val();
		var checkedPwd = $("#checkedPwd").val();
		var checkedPwd2 = $("#checkedPwd2").val();
		var checkedName = $("#checkedName").val();
		var checkedNick = $("#checkedNick").val();
		var nickname = $("#nickname").val();
		var checkedPhone = $("#checkedPhone").val();
		
		if((checkedId != id) 
				|| id == ""
				|| checkedId == ""){
			alert("아이디를 확인해주세요");
			$("#id").focus();
			return;
		}
		
		if((checkedPwd != checkedPwd2)
				|| checkedPwd == ""
				|| checkedPwd2 == ""){
			alert("비밀번호를 확인해주세요");
			$("#pwd").focus();
			return;
		}
		
		if(checkedName == ""){
			alert("이름을 확인해주세요");
			$("#name").focus();
			return;
		}
		
		if((checkedNick != nickname)
				|| checkedNick == ""
				|| nickname == ""){
			alert("닉네임을 확인해주세요");
			$("#nickname").focus();
			return;
		}
		
		if(checkedPhone == ""){
			alert("전화번호를 확인해주세요");
			$("#phone2").focus();
			return;
		}
		
		$("#joinForm").submit();
	}
</script>


	<h1>회원가입</h1>
	<div>
		<div>모든 정보는 필수항목입니다.</div>
		<form id = "joinForm" method="post" action="<c:url value ='/join'/>">
			<input type = "hidden" id = "checkedId" name = "id">
			<input type = "hidden" id = "checkedPwd" name = "pwd">
			<input type = "hidden" id = "checkedPwd2">
			<input type = "hidden" id = "checkedName" name = "name">
			<input type = "hidden" id = "checkedNick" name = "nickname">
			<input type = "hidden" id = "checkedPhone" name = "phone">
			<table>
				<tr>
					<th><label for="id">아이디</label></th>
					<td>
						<input type="text" id="id">
						<a href = "javascript:idChk()">중복확인</a>
						<span>4자 이상 12자 이하 영문, 숫자(띄어쓰기, 특수문자 불가)</span>
						<span id = "idChkMsg" class = "joinChk">중복확인을 해주세요</span>
					</td>
				</tr>
				<tr>
					<th><label for="pwd">비밀번호</label></th>
					<td>
						<input type="password" id="pwd" onkeyup="javascript:pwdChk()">
						<span>영어 대/소문자, 숫자, 특수문자 중 2가지 이상 조합 6자~12자(띄어쓰기 불가)</span>
						<span id = "pwdChkMsg" class = "joinChk"></span>
					</td>
				</tr>
				<tr>
					<th><label for="pwd2">비밀번호 확인</label></th>
					<td>
						<input type="password" id="pwd2" onkeyup="javascript:pwdSameChk()">
						<span id = "pwdSameChkMsg" class = "joinChk"></span>
					</td>
				</tr>
				<tr>
					<th><label for="name">성명</label></th>
					<td>
						<input type="text" id="name" onkeyup="javascript:nameChk()">
						<span>한글 2자~6자(띄어쓰기 불가)</span>
						<span id = "nameChkMsg" class = "joinChk"></span>
					</td>
				</tr>
				<tr>
					<th><label for="nickname">필명(닉네임)</label></th>
					<td>
						<input type="text" id="nickname">
						<a href = "javascript:nickChk()">중복확인</a>
						<span>영문 4자~12자,한글 2자~6자(띄어쓰기, 특수문자 불가)</span>
						<span id = "nickChkMsg" class = "joinChk">중복확인을 해주세요</span>
					</td>
				</tr>
				<tr>
					<th><label for="phone1">휴대폰번호</label></th>
					<td>
						<select id="phone1" onchange="javascript:phoneChk()">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="070">070</option>
						</select>
						<span>-</span> 
						<input type="text" id="phone2" onkeyup="javascript:phoneChk()">
						<span>-</span> 
						<input type="text" id="phone3" onkeyup="javascript:phoneChk()">
						<span id = "phoneChkMsg" class = "joinChk"></span>
					</td>
				</tr>
			</table>
			<div>
				<a href = "<c:url value = '/'/>">취소</a>
				<a href = "javascript:validate();">회원가입</a>
			</div>
		</form>
	</div>