<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

/* 이미지 업로드 */
function readURL(input) {
	var file = input.files[0] //파일에 대한 정보
	if (file != '') {
		var reader = new FileReader();
		reader.readAsDataURL(file); //파일 정보를 토대로 읽고
		reader.onload = function(e) { //로드한 값을 표현
			//e : 이벤트 안에 result값이 파일의 정보를 가지고 있다
			$("#preview").attr('src', e.target.result);
		}
	}
}

</script>

</head>
<body>
<form action="writeSave" method="post">
	<h4>이미지 업로드</h4>
		<input type="file" name="imageFileName" onchange="readURL(this);"/>
		<img id="preview" src="#" 
				width="100" height="100"
				alt="선택된 이미지가 없습니다">

</form>
</body>
</html>