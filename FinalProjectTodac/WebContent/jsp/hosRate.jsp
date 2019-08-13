<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<script type="text/javascript">

$(function(){
	
		var sub ="";
			
	$('#injectBtn').click(function(){
	sub = $('#injectBtn').val();
		}); 

		
	$('#antiBtn').click(function(){
	sub = $('#injectBtn').val();
		});
	$('#opBtn').click(function(){
	sub = $('#antiBtn').val();
		});
	$('#costBtn').click(function(){
	sub = $('#costBtn').val();
		});
		
		
	$('#search').on('click',function(){
	var list = [];
	var index = 0;
	$('input[name="check"]:checked').each(function(){
		var test = $(this).val();
		list[index] = test;
		index++;
	});
		alert(list);
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url :'rateinfo.do',
			data : {
				subject : sub,
				hname:$('#hname').val(),
				code1:$('#sel1').val(),
				code2:$('#sel2').val(),
				check : list
				},
			
			type:"post",
			success : function(data){
			 	/* $('#rateinfo tr.gt(0)').remove(); */
			 	alert("성공");
			 	var input="";
				for(var i in data){
					//alert(data[i].yadmNm);
					
				  	input += "<tr>";
				  	input += "<td>" + i + "</td>";
				  	input += "<td>" + data[i].yadmNm + "</td>";
				  	input += "<td> 주사제 처방률 </td>";
				  	input += "<td>" + data[i].injection_rate + "</td>";
				  	input += "<td>" + data[i].addr + "</td>";
				  	input += "</tr>";
				} 
			/* 	var input ="";
				 input +="<tr>"; 
				 input +="<td>그만</td>"; 
				 input +="</tr>";  */
				$('#ratebody').prepend(input);
				
				
			},
			error : function(){
				alert("다시 시도해주세요");
			}
			
			
			
		});
		
	});
	
	
	
	
	
		
	
	});

</script>





</head>
<body>
<h1>병원평가정보</h1>
<hr>
    <div class="container">
<div class="row">
<div class="col-md-4"></div>
</div>

<div class="row">
	  <div class="col-md-4">
  	</div>
    	<div class="col-md-4" style="background-color:lavender;">
    
					<label>
						<input type="checkbox" name="check" value="0" checked> <span class="label-text">전체</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="1"> <span class="label-text">1등급</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="2"> <span class="label-text">2등급</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="3"> <span class="label-text">3등급</span>
					</label>
					<label>
						<input type="checkbox" name="check" value="4"> <span class="label-text">4등급</span>
					</label>
	    </div>
  		<div class="col-md-4"></div>
    	<div class="col-md-4"></div>
    	<div class="col-md-4" style="background-color:lavenderblush;"></div>
</div>
  <div class="row">
		<div class="col-md-2">
      <select class="form-control" id="sel1">
        <option value="" disabled="disabled" selected="selected">시/도</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
      </select>
 	 </div>
	<div class="col-md-2">
      <select class="form-control" id="sel2">
        <option value="" disabled="disabled" selected="selected">시/군/구</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
      </select>
	<input id="hname" type="text">
  <button id="search" class="btn btn-default">검색</button>
	</div>
  </div>
  <hr>
  <div class="container">
  <button id="injectBtn" class="btn btn-default" value="1">주사제처방률</button>
  <button id="antiBtn" class="btn btn-default" value="2">항생제처방률</button>
  <button id="opBtn" class="btn btn-default" value="3">수술의 예방적 항생제</button>
  <button id="costBtn" class="btn btn-default" value="4">처방약품비</button>
  </div>
  <hr>
  <div class="row">
  
  
  <table class="table table-striped" id="rateinfo">
    <thead>
      <tr>
        <th>NO.</th>
        <th>병원이름</th>
        <th>평가항목</th>
        <th>평가등급<a>▲</a><a>▼</a></th>
        <th>소재지</th>
      </tr>
    </thead>
    <tbody id="ratebody">
    
    </tbody>
    
  </table>
</div>
  
  
  
  
  
  
  
  
  
  
  
</div>

</body>
</html>