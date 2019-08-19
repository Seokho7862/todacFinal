<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>병원 관계자 계정 신청</h1>

<form action="managerApply.do">
<table>

<tr><td>사업자 번호</td><td><input type="text" name="bisunessNumber"></td></tr>
<tr><td>병원 찾기 ajax</td><td><input type="text" name="hname" id="hid"><input type="button" value="검색" id="hospitalSearchButton"></td></tr>
<tr><td><div id="hospitalListDiv" style="overflow: auto; width: 800px; height: 400px;" >
<table>
<tr><th>병원명</th><th>주소</th></tr>

<c:forEach items="${hospitalList}" var="hospital" step="1">
<tr>
<td>${hostpital.hname }</td>
<td>${hostpital.hloc }</td>
</tr>
</c:forEach> 

</table>
</div></td></tr>
<tr><td>병원 주소 <input type="text" readonly="readonly" id="hloc"></td></tr>
<tr><td>사업자 등록증 사진</td><td><input type="file" name="afile"></td></tr>
<tr><td><input type="submit" value="확인"></td></tr>

</table>
</form>


</body>
</html>