<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.correct{
	color : green;
	font-size: 14px
}
.incorrect{
	color : red;
	font-size: 14px
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

var code = ""; // 인증번호 저장 변수

/* 이메일 입력방법 */
function selectMailDo(ele){
	var $ele = $(ele)
	var inputMailDo = $('#inputMailDo').val()
}

/* 이메일 발송 코드 + 유효성 검사*/
function gmailSend(){
	let mail = $("#memberMail").val() // 입력 이메일
	let inputCode = $("#inputCode") // 인증번호 입력란
	let codeCkBtn = $("#codeCkBtn") // 인증번호 버튼
	// console.log(mail)
	
	//mail = mail +"@"+$("#mailDo option:selected").val();
	
	$.ajax({
		url : 'sendMail', type : 'post', dataType : 'json',
		data : {mail : mail},
		
		success : function(data){
			alert("메일 발송 완료!")
			inputCode.attr("disabled",false)
			codeCkBtn.attr("disabled",false)
			
			// console.log(data) // 인증코드 콘솔 확인
			code = data // 인증코드 변수에 저장 
		},error : function(request,status,error){
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error)
			alert("메일 발송 실패!")
		}
	})
}

/* 인증번호 확인 코드 */
function mailCodeCk(){
	var inputCode = $("#inputCode").val(); // 사용자 입력코드
	var checkMsg = $("#checkMsg") // 결과
	if(inputCode == code){// 일치
		checkMsg.html("인증번호 일치")
		checkMsg.attr("class","correct")
	}else{ //불일치
		checkMsg.html("인증번호 불일치")
		checkMsg.attr("class","incorrect")
	}
}

</script>
</head>
<body>
 <form action="#">
	<input type="text" placeholder="아이디"><br>
	
	<div class="email">
		<input id="memberMail" name="memberMail" type="text" placeholder="이메일"> @ 
		<input disabled="disabled" id="inputMailDo" name="inputMailDo" type="text" placeholder="직접입력" >
		<select id="mailDo" onchange="selectMailDo(this)">
			<option value="" selected>선택하기</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="1">직접입력</option>
		</select>
		<button id="sendCode" type="button" onclick="gmailSend()" >인증번호 전송</button><br>
	</div>
	<div class="emailAuth">	
		<input disabled="disabled" id="inputCode" type="text">
		<button disabled="disabled" id="codeCkBtn" type="button" onclick="mailCodeCk()">인증번호 확인</button><br>
		<span id="checkMsg"></span>
	</div>
	<hr>
	<input type="submit" value="가입하기"><br>
</form>       
        
</body>
</html>