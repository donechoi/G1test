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
function selectOpt() {
	mbr_email3_opt = $("#mbr_email3").val()
	mbr_email2 = $("#mbr_email2") // 주소 입력값
	
	if(mbr_email3_opt == "1"){ // 직접입력
		mbr_email2.val('') //초기화
		mbr_email2.attr("disabled",false)
	}else{
		mbr_email2.val(mbr_email3_opt)
		mbr_email2.attr("disabled",true)
	}
	//console.log(mbr_email2.val())
}


/* 입력값 저장 + 이메일 발송 코드 */
// config 메일전송 막음~!!@!!!!!!!!!!!!!!!!!!!
function gmailSend(){
	mail = $("#mbr_email").val() // 입력 이메일 아이디
	mail = mail + "@" + mbr_email2.val() //이메일 전체 입력값
	//console.log(mail)
	let inputCode = $("#inputCode") // 인증번호 입력란
	let codeCkBtn = $("#codeCkBtn") // 인증번호 버튼
	
	$.ajax({
		url : 'sendMail', type : 'post', dataType : 'json',
		data : {mail : mail},
		
		success : function(data){
			alert("메일 발송 완료!")
			inputCode.attr("disabled",false)
			codeCkBtn.attr("disabled",false)
			$("#mbr_email").val(mail) // DB저장위해 다시 저장
			//console.log($("#mbr_email").val())
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
		<!-- mbr_email값만 저장(js로 전체값 저장처리완료) -->
		<input id="mbr_email" name="mbr_email" type="text" placeholder="이메일"> @ 
		<input disabled="disabled" id="mbr_email2" name="mbr_email2" type="text">
		<select id="mbr_email3" onchange="selectOpt()">
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