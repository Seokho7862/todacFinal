<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todac</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div style="margin-left: 300px">
<form action="" enctype="multipart/form-data" method="post" onsubmit="return pwcheck()">
	
	<h2 >병원정보</h2>
	
	<div >
    <div>
      병원이름 <input type="text" value="${hoslist.DUTYNAME}" >
    </div>
	</div>
	
	<div>
    <div>
      대표 <input type="text" value="${hoslist.NAME }">
    </div>
	
	<div>
	
    <div>
   	월 <input type="text" value="${hoslist.DUTYTIME1S}">~<input type="text" value="${hoslit.DUTYTIME1C }">
     <c:choose>
     <c:when test="${hoslist.DUTYTIME1S!=null}">
     <input type="text" value="${hoslist.DUTYTIME1S}">~<input type="text" value="${hoslist.DUTYTIME1C}">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME2S!=null}">
  	화<input type="text" value="${hoslist.DUTYTIME2S}">~<input type="text" value="${hoslit.DUTYTIME2C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME3S!=null}">
        수<input type="text" value="${hoslist.DUTYTIME3S}">~<input type="text" value="${hoslit.DUTYTIME3C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME4S!=null}">
 	 목<input type="text" value="${hoslist.DUTYTIME4S}">~<input type="text" value="${hoslit.DUTYTIME4C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME5S!=null}">
  	금<input type="text" value="${hoslist.DUTYTIME5S}">~<input type="text" value="${hoslit.DUTYTIME5C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME6S!=null}">
 	 토<input type="text" value="${hoslist.DUTYTIME6S}">~<input type="text" value="${hoslit.DUTYTIME6C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME7S!=null}">
       일<input type="text" value="${hoslist.DUTYTIME7S}">~<input type="text" value="${hoslit.DUTYTIME7C }">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     <c:choose>
     <c:when test="${hoslist.DUTYTIME8S!=null}">
     공휴일<input type="text" value="${hoslist.DUTYTIME8S}">~<input type="text" value="${hoslist.DUTYTIME8S}">
     </c:when>
     <c:otherwise>
     <input type="text" value="" placeholder="시간을 설정해주세요">~<input type="text" value="" placeholder="시간을 설정해주세요">
     </c:otherwise>
     </c:choose>
     
     
    </div>
	</div>
	
	<div>
      번호 <input type="text" value="${hoslist.DUTYTEL1 }" >
    </div>
	
	<div>
       <div class="w3-rest">
     주소 <input type="text" value="${hoslist.DUTYADDR}" >
	</div>
	
      <div>
     병원사진 <input type="text" value="" placeholder="병원사진을 추가해주세요">
    </div>
		
     <div>
      병원 설명<input type="text" placeholder="병원을 소개해주세요">
    </div>
	
     <div>
      <input type="file" name="ufile">
    </div>
			
<input type="submit" value="수정">
	
	

</form>
</div>
</body>
</html>