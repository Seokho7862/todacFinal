<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<style type="text/css">
#my-spinner {
	width: 100%; height: 100%;
	top: 0; left: 0;
	display: none;
	opacity: .6;
	background: silver;
	position: fixed;
}
#my-spinner div {
	width: 100%; height: 100%;
	display: table;
}
#my-spinner span {
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}
#my-spinner img {
	background: white;
	padding: 1em;
	border-radius: .7em;
}
</style>
<script type="text/javascript">
$(function(){

	$('#sel1').on('change',function(){
		alert($('#sel1').val());
			$.ajax({
				url : 'getaddress.do',
				data:{
					code1:$('#sel1').val()
				},
				type:'post',
				beforeSend : function(){
					$('#spins').show();
				}
				,
				success :function(data){
					$('#spins').hide();
					alert("alert");
					alert(data);
					
					$('#sel2 > option:gt(0)').remove();
					var adop="";
					for(var i in data){
					adop+="<option value='"+data[i][0]+"'>"+data[i][1]+"</option>";
					}
					$('#sel2').append(adop);
					
				},
				error : function(){
					alert("다시시도해주세요");
				}
				
				
			});
	});
	
	
});

</script>
<script type="text/javascript">
function openInj(){
	$('#con_injection').show();
	$('#con_anti').hide();
	$('#con_op').hide();
	$('#con_medi').hide();
}
function openAn(){
	$('#con_injection').hide();
	$('#con_anti').show();
	$('#con_op').hide();
	$('#con_medi').hide();
	
}
function openOp(){
	$('#con_injection').hide();
	$('#con_anti').hide();
	$('#con_op').show();
	$('#con_medi').hide();
	
}
function openMe(){
	$('#con_injection').hide();
	$('#con_anti').hide();
	$('#con_op').hide();
	$('#con_medi').show();
	
}

$(function(){
	
	$('#con_injection').hide();
	$('#con_anti').hide();
	$('#con_op').hide();
	$('#con_medi').hide();
	
		var sub ="";
			
	$('#injectBtn').click(function(){
	sub = $('#injectBtn').val();
	openInj();
		}); 
	$('#antiBtn').click(function(){
	sub = $('#antiBtn').val();
	openAn();
		});
	$('#opBtn').click(function(){
	sub = $('#opBtn').val();
	openOp();
		});
	$('#costBtn').click(function(){
	sub = $('#costBtn').val();
	openMe();
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
				
			 	$('#ratebody tr:gt(0)').remove();
			 	
			 	alert("성공");
			 	var key = data.key;
			 	var newlist = data.newlist;
			 	var input ="";
				for(var i in newlist){
					//alert(data[i].yadmNm);
				  	input += "<tr>";
				  	input += "<td>" + i + "</td>";
				  	input += "<td>" + newlist[i].yadmNm + "</td>";
				  	if(key=="1"){
				  	input += "<td>주사제 처방률</td>";
				  	input += "<td>" + newlist[i].injection_rate + "</td>";
				  	}
				  	if(key=="2"){
				  	input += "<td>항생제 처방률</td>";
				  	input += "<td>" + newlist[i].anti_rate + "</td>";
				  	}
				  	if(key=="3"){
				  	input += "<td>수술의 예방적 항생제</td>";
				  	input += "<td>" + newlist[i].op_anti_rate + "</td>";
				  	}
				  	if(key=="4"){
				  	input += "<td>처방약품비</td>";
				  	input += "<td>" + newlist[i].medi_cost_rate + "</td>";
				  	}
				  	input += "<td>" + newlist[i].addr + "</td>";
				  	input += "</tr>";
				} 
			
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
        <option value="" selected="selected">시/도</option>
        <option value="110000">서울</option>
        <option value="210000">부산</option>
        <option value="220000">인천</option>
        <option value="230000">대구</option>
        <option value="240000">광주</option>
        <option value="250000">대전</option>
        <option value="260000">울산</option>
        <option value="310000">경기</option>
        <option value="320000">강원</option>
        <option value="330000">충북</option>
        <option value="340000">충남</option>
        <option value="350000">전북</option>
        <option value="360000">전남</option>
        <option value="370000">경북</option>
        <option value="380000">경남</option>
        <option value="390000">제주</option>
        <option value="410000">세종</option>
      </select>
 	 </div>
	<div class="col-md-2">
      <select class="form-control" id="sel2">
        <option value="" selected="selected">시/군/구</option>
 
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
  <div id="con_injection">
  
  <dl>
  <p>
  
  <dt>
<b>주사제 처방률 </b> :  항목을 평가하는 이유는 무엇인가요?
  </dt>
<dd>
		주사제는 알약을 삼킬 수 없거나, 응급환자처럼 치료효과가 빨리 나타나야 하는 경우 등에만 사용하는 의약품입니다.<br> 
		주사는 쇼크 등의 부작용이 발생할 가능성이 알약에 비해 높습니다. 따라서 올바른 주사제 사용을 유도하기 위해 병원별로 평가하여 
		결과를 공개하고 있습니다.
</dd>
  </p>

  <p>
  <dt>
<b> 평가내용 </b> :  어떤 내용을 평가했나요?
  </dt>
<dd>
		외래 원내에서 투여된 주사제 청구자료를 대상으로 처방률을 평가하였습니다.
</dd>
  </p>
  <p>
<dt>

 평가결과 :  평가결과는 어떻게 공개하나요?
</dt>
<dd>
 		평가결과는 주사제 처방률을 5개 등급으로 나누어 공개합니다.
		등급 숫자가 작을수록 주사제 처방을 적게하는 의료기관입니다. 
	* 공개대상 : 상급종합병원, 종합병원, 병원, 의원
</dd>
  </p>
  </dl>
  
  
  </div>
  <div id="con_anti" class="row">
  
  <dl>
  <p>
  <dt>
급성상기도감염 :  항생제 처방률 항목을 평가하는 이유는 무엇인가요?
  </dt>
<dd>
감기는 바이러스가 원인인 경우가 많아 항생제를 복용해도 치료가 빨라지거나 증상이 급격히 좋아지지 않습니다. 따라서 감기에는 항생제가 불필요하므로 올바른 항생제 사용을 유도하기 위해 병원별 항생제 처방률을 평가하고 결과를 공개하고 있습니다.
</dd>
  </p>

  <p>
  <dt>
 평가대상 : 어떤 대상을 평가했나요?
  </dt>
<dd>
평가대상기간(‘18년 1월~12월)에 급성 상기도감염 상병을 주상병으로 청구한 환자를 대상으로 평가하였습니다.(건강보험, 의료급여)
</dd>
  </p>
  <p>
<dt>
 평가내용 : 어떤 내용을 평가했나요?
 </dt>
 <dd>
외래에서 처방하거나 투여된 청구자료를 대상으로 주사형 항생제 및 원외처방 항생제 처방률을 평가하였습니다.<br>
또한, 사용범위가 넓어 내성균 증가와 다제내성 균주의 출현과 연관성이 높은 광범위 항생제(세파 3세대 이상, 퀴놀론계 및 마크로라이드계)<br> 
처방률도 평가하여 공개하고 있습니다.
 </dd>
</p>
<p>
<dt>
 평가결과 : 평가결과는 어떻게 공개하나요?
</dt>
<dd>
평가결과는 항생제 처방률을 5개 등급으로 나누어 공개합니다.
등급 숫자가 작을수록 항생제 처방을 적게 하는 의료기관입니다.
* 공개대상 : 상급종합병원, 종합병원, 병원, 의원
</dd>
</p>

  </dl>
  </div>
  
  <div id="con_op" class="row">
  <dl>
  <p>
  <dt>
수술의 예방적 항생제 : 사용을 평가하는 이유는 무엇인가요?
  </dt>
  <dd>
수술의 예방적 항생제는 수술부위 감염을 예방하는 방법 중의 하나로 기준에 부합하는 항생제를 선택하여 <br>
정확한 용법과 용량을 적절한 기간 동안 사용하는 것이 중요합니다.<br>
따라서, 국민에게 병원 선택에 도움을 주고자 평가 결과를 공개하고 있습니다.
  </dd>
  </p>
  <p>
<dt>
 평가대상 : 어떤 대상을 평가했나요?
</dt>
<dd>
평가대상 기간(3개월) 동안 평가대상 수술을 수술별로 10건 이상 청구한 병원급 이상 의료기관을 대상으로 
평가를 시행하였습니다.
</dd>
  </p>
  <p>
<dt>
 평가내용 : 어떤 내용을 평가했나요?
</dt>
<dd>
수술부위 감염을 예방하기 위한 항생제를 피부절개 전 1시간 이내에 투여하였는지, <br>
사용한 항생제의 선택은 적절하였는지, 투여기간은 얼마나 되었는지 등에 대한 지표를 선정하여 평가하였습니다.
</dd>
  </p>
<p>
<dt>
 평가결과 : 평가결과는 어떻게 공개하나요?
</dt>
<dd>
요양기관별 종합결과에 따라 1~5등급 또는 등급 제외로 공개합니다.
등급 숫자가 작을수록 수술의 예방적 항생제 사용을 적절하게 하는 의료기관입니다.
</dd>
</p>
  </dl>
 
  </div>
  <div id="con_medi" class="row">
  <dl>
  <dt>
  처방약품비 : 처방약품비를 평가하는 이유는 무엇인가요?
  </dt>
  <dd>
약품비는 인구 고령화로 만성질환자가 지속적으로 증가하고, 약품목수, 고가약 사용 등 복합적인 요인에 의해 매년 크게 증가하고 있습니다.<br>
의사가 환자의 증상 및 상태에 따라 비용효과적인 올바른 처방을 할 수 있도록 유도하기 위해 평가하고 있습니다. <br>
건강보험심사평가원은 병원별로 약품비용을 평가하여 국민에게 병원선택에 도움을 주고자 평가결과를 공개하고 있었으나<br>
 2014년 8월 29일 보건복지부 고시 제2014-143호 부칙 제2조에 의해 「외래처방에 대한 요양급여비용의 가산 지급 기준」이 폐지 되어 <br>
 2015년에 평가를 종료하게 되었습니다.
  </dd>
<dt>
 평가대상 : 올바른 약 처방을 받기 위해 꼭 기억하세요!
</dt>
<dd>
약은 처방 받은 기간 및 횟수를 준수하여 규칙적으로 복용합니다. <br>
증상이 비슷하다고 해서 자신의 약을 다른 사람들에게 주거나 다른 사람의 약을 복용하면 부작용이 있을 수 있으므로 임의 로 복용하여서는 안됩니다. <br>
유효기간이 지나 복용하지 않는 약 등 폐기할 약은 약국에서 수거하므로 가까운 약국으로 가져가시면 됩니다.<br>
</dd>
<dt>
 평가내용 : 평가결과는 어떻게 공개하나요?
</dt>
<dd>
평가결과는 외래처방약품비 고가도지표(OPCI, Outpatient Prescribing Costliness Index)를 5개 등급으로 나누어 공개합니다.<br>
등급 숫자가 작을수록 동일평가군 대비 투약일당(환자당)약품비가 낮은 의료기관입니다.
</dd>
<p>
<dt>
 평가결과 : 항목별 평가등급
</dt>
<dd>
평가등급	내용<br>
1등급	백분위 순위 20이하<br>
2등급	백분위 순위 20초과～40이하<br>
3등급	백분위 순위 40초과～60이하<br>
4등급	백분위 순위 60초과～80이하<br>
5등급	백분위 순위 80초과～100<br>
등급제외	평가대상기간내 폐업, 서면청구, 진료월이 6개월미만, 명세서건수가 120건 미만 등
* 공개대상 : 상급종합병원, 종합병원, 병원, 의원
</dd>
</p>
  </dl>
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
<div id='spins'>
	<div><span>
		<img src='//cdnjs.cloudflare.com/ajax/libs/galleriffic/2.0.1/css/loader.gif'>
	</span></div>
</div>

</body>
</html>