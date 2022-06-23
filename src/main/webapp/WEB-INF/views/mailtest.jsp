<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
//mail인증하기 버튼 클릭 
$("#mailAuth").on("click",function(e){
    isMailAuthed=true;
    $.ajax({
        url : "<c:url value='sendmail' />" 
        ,data : {"mail" : $("input[name='memMail']").val()}
        ,success: function(data){
           alert(data);
        },error : function(req,status,err){
            console.log(req);
        }
    });//ajax
});//mailCheck
</script>
</head>
<body>
<form action="">
		<input type="text" name="memMail">
        <button onclick="return false;" type="button" id="mailAuth">mail인증하기</button>
 </form>
</body>
</html>