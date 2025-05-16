<%@ page contentType="text/html; charset=UTF-8" %>




<!DOCTYPE html>
<html>
<head>










<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세 페이지</title>
</head>
<body>

<h1>상세 공지사항</h1>
		
		<form action="#">
			<label>제목</label>
			<input type="text" name="title" value="${board.NOTICE_TITLE}" readonly/></br>
			
			
			<label>내용</label></br>
			<textarea rows="30" cols="100" readonly>${board.NOTICE_CONTENT}</textarea><br/>
		
		    <label>작성일</label>
		    <input type="text" value="${board.NOTICE_DATE}" readonly/><br/>
		
	</form>
		

		
		
</body>
</html>